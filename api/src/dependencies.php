<?php
use \Firebase\JWT\JWT;
// DIC configuration
$container = $app->getContainer();

// monolog
$container['logger'] = function ($c) {
    $settings = $c->get('settings')['logger'];
    $logger = new Monolog\Logger($settings['name']);
    $logger->pushProcessor(new Monolog\Processor\UidProcessor());
    $logger->pushHandler(new Monolog\Handler\StreamHandler($settings['path'], $settings['level']));
    return $logger;
};

$container['connect_pdo'] = function ($c) {
    $db = $c['settings']['db'];
    $pdo = new PDO('mysql:host=' . $db['host'] . ';dbname=' . $db['dbname'],
        $db['user'], $db['pass']);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    return $pdo;
};

$container['connect_mysqli'] = function ($c) {
    $db = $c['settings']['db'];
    try {
        $mysqli = new SimpleMySQLi();
        return $mysqli;
    } catch(Exception $e) {
        $print=$this->error_response;
		$rsp = $print($rsp, 500, 2323, "MySQLException", "Error occurred in MySQL. Details=> ".$e->getMessage(), "http://google.com/2323");
		return $rsp;
    }
};

$container['generate_basic_token'] = function ($c) {
    return function($user_id, $user_name, $datetime, $expiry) use ($c){
        try {
            return substr(md5($user_id.$user_name.$datetime.$expiry).sha1($expiry.$datetime.$user_id.$user_name), 10,50);
        } catch(Exception $e) {
            $print=$this->error_response;
            $rsp = $print($rsp, "TokenGenerateError", "Error occurred while generating Token.", $e);
            return $rsp;
        }
    };
};

$container['generate_jwt_token'] = function ($c) {
    return function($user_id, $user_name, $datetime, $timezone) use ($c){ 
        $token_payload = [
            'user_id' => $user_id,
            'aud' => $user_name,
            'iss' => 'admin',
            'iat' => $datetime,
            'exp' => strtotime($c['settings']['jwt_expiry_time'], strtotime($datetime)),
            'zoneinfo' => $timezone
        ];
        try{
            return JWT::encode($token_payload, base64_decode(strtr($c['settings']['jwt_signing_key'], '-_', '+/')), 'HS256');
        } catch(Exception $e) {
            $print=$this->error_response;
            $rsp = $print($rsp, "JWTTokenEncodeError", "Error occurred while encoding JWT Token. Please try again.");
            return $rsp;
        }
    };
};

$container['encrypt'] = function ($c) {
    return function($message) use ($c){
        $key = "pk12345678912345";
        $size = openssl_get_block_size(MCRYPT_RIJNDAEL_128, MCRYPT_MODE_ECB); 
        $pad = $size - (strlen($message) % $size); 
        $message = $message . str_repeat(chr($pad), $pad); 
        $td = openssl_module_open(MCRYPT_RIJNDAEL_128, '', MCRYPT_MODE_ECB, ''); 
        $iv = openssl_create_iv (openssl_enc_get_iv_size($td), MCRYPT_RAND); 
        openssl_generic_init($td, $key, $iv); 
        $data = openssl_generic($td, $message); 
        openssl_generic_deinit($td); 
        openssl_module_close($td); 
        $data = base64_encode($data); 
        return $data;  
        // $key = "pk12345678912345";
        // $size = mcrypt_get_block_size(MCRYPT_RIJNDAEL_128, MCRYPT_MODE_ECB); 
        // $pad = $size - (strlen($message) % $size); 
        // $message = $message . str_repeat(chr($pad), $pad); 
        // $td = mcrypt_module_open(MCRYPT_RIJNDAEL_128, '', MCRYPT_MODE_ECB, ''); 
        // $iv = mcrypt_create_iv (mcrypt_enc_get_iv_size($td), MCRYPT_RAND); 
        // mcrypt_generic_init($td, $key, $iv); 
        // $data = mcrypt_generic($td, $message); 
        // mcrypt_generic_deinit($td); 
        // mcrypt_module_close($td); 
        // $data = base64_encode($data); 
        // return $data;  
    };
};

$container['decrypt'] = function ($c) {
    return function($message) {
        $key = "pk12345678912345";
		$decrypted= mcrypt_decrypt(
			MCRYPT_RIJNDAEL_128,
			$key, 
			base64_decode($message), 
			MCRYPT_MODE_ECB
		);
		$dec_s = strlen($decrypted); 
		$padding = ord($decrypted[$dec_s-1]); 
		$decrypted = substr($decrypted, 0, -$padding);
		return $decrypted;
    };
};

$container['data_response'] = function ($c) {
    return function($rsp, $response, $success_type, $success_message = '', $more_info = '', $status_code = 0, $log_message = '') use ($c){
        $success = $c['settings']['success']["$success_type"];
        $url = $c['settings']['success_info_url'];

        array_walk_recursive($response, function (&$item, $key) use ($c) {
            if (!$c['settings']['utc_timezone'] && $c['settings']['tz_conversion_method'] == 1) {
                if ((DateTime::createFromFormat('Y-m-d H:i:s', $item) !== FALSE)){
                    global $device_timezone;
                    $date = new DateTime($item, new DateTimeZone("UTC"));
                    $date->setTimezone(new DateTimeZone($device_timezone));
                    $item = $date->format('Y-m-d H:i:s');
                }
            }
            if ($c['settings']['blank_nulls']){ 
                if ($item === null){
                    $item = '';
                }
            }
        });
        
        $response["error"] = new ArrayObject();
        $response["data"]["success_type"] = $success["success_type"];
        $response["data"]["success_code"] = $success["success_code"];
        $response["data"]["status_code"] = $status_code != 0 ? $status_code : $success["http_code"];
        $response["data"]["message"] = $success_message == '' ? "Successful" : $success_message; 
        $response["data"]["more_info"] = $more_info == '' ? "For more info please visit ".$url.$success["success_code"] : $more_info.". For more info please visit ".$url.$success["success_code"];
        $rsp = $rsp->write(json_encode($response, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK | JSON_PRETTY_PRINT))
            ->withHeader('Content-Type', 'application/json')
            ->withHeader('Status-Code', $response["data"]["status_code"])
            ->withHeader('Success-Code', $response["data"]["success_code"])
            ->withHeader('Success-Type', $response["data"]["success_type"])
            ->withStatus($response["data"]["status_code"]);
        
        if($c['settings']["logs"]["monolog_log"]){
            $c->logger->addInfo($log_message);
        }
        return $rsp;
    };
};

$container['error_response'] = function ($c) {
    return function($rsp, $error_type, $message = '', $exception = '', $more_info = '', $status_code = 0, $log_message = '') use ($c) {
        $error = $c['settings']['errors']["$error_type"];
        $url = $c['settings']['error_info_url'];
        $response["data"] =  new ArrayObject();
        $response["error"]["error_type"] = $error["error_type"];
        $response["error"]["error_code"] = $error["error_code"];
//        $response["error"]["error_message"] = $error["error_message"];
        $response["error"]["status_code"] = $status_code != 0 ? $status_code : $error["http_code"];
        $response["error"]["message"] = $message == '' ? "Error Occurred" : $message;
        if ($c['settings']['displayErrorDetails'] && $exception != ''){
//            $response["error"]["message"] = $response["error"]["message"] . " Details: ".$exception->getMessage();
            $response["error"]["error_message"] = "Message: ".$exception->getMessage();
            $response["error"]["stacktrace"] = "Exception Stack Trace. Details: ".$exception->getTraceAsString();
            $response["error"]["file"] = "File: ".$exception->getFile().", Line: ".$exception->getLine();
        }
        $response["error"]["more_info"] = $more_info == '' ? "For more info please visit ".$url.$error["error_code"] : $more_info.". For more info please visit ".$url.$error["error_code"];

        $rsp = $rsp
        ->write(json_encode($response, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK | JSON_PRETTY_PRINT))
        ->withHeader('Status-Code', $response["error"]["status_code"])
        ->withHeader('Error-Code', $response["error"]["error_code"])
        ->withHeader('Error-Type', $response["error"]["error_type"])
        ->withHeader('Content-Type', 'application/json')
        ->withStatus($response["error"]["status_code"]);

        if($c['settings']["logs"]["monolog_log"]){
            $c->logger->addInfo($log_message);
        }
        return $rsp;
    };
};

$container['errorHandler'] = function ($c) {
    return function ($rqst, $rsp, $exception) use ($c) {
        $error = $c['settings']['errors']["RuntimeException"];
        $url = $c['settings']['error_info_url'];
        $response["data"] =  new ArrayObject();
        $response["error"]["type"] = $error["error_type"];
        $response["error"]["status_code"] = $error["http_code"];
        $response["error"]["error_code"] = $error["error_code"];
        $response["error"]["message"] = "Runtime Error occurred!. Details: ".$exception->getMessage();
        if ($c['settings']['displayErrorDetails']){
            $response["error"]["stacktrace"] = "Exception Stack Trace. Details: ".$exception->getTraceAsString();
            $response["error"]["file"] = "File: ".$exception->getFile().", Line: ".$exception->getLine();
        }
        
        $response["error"]["more_info"] = "For more info please visit ".$url.$error["error_code"];
        $rsp = $rsp
        ->write(json_encode($response, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK | JSON_PRETTY_PRINT))
        ->withHeader('Content-Type', 'application/json')
        ->withStatus($response["error"]["status_code"]);

        $c->logger->addInfo("Runtime Error occurred");
        return $rsp;
    };
};

$container['notFoundHandler'] = function ($c) {
    return function ($rqst, $rsp) use ($c) {
        $error = $c['settings']['errors']["PageNotFoundError"];
        $url = $c['settings']['error_info_url'];
        $response["data"] =  new ArrayObject();
        $response["error"]["type"] = $error["error_type"];
        $response["error"]["status_code"] = $error["http_code"];
        $response["error"]["error_code"] = $error["error_code"];
        $response["error"]["message"] = "This API endpoint doesn't exist. Please check your URL again"; 
        $response["error"]["more_info"] = "For more info please visit ".$url.$error["error_code"];
        $rsp = $rsp
        ->write(json_encode($response, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK | JSON_PRETTY_PRINT))
        ->withHeader('Content-Type', 'application/json')
        ->withStatus($response["error"]["status_code"]);
        
        $c->logger->addInfo("Page not found");
        return $rsp;
    };
};

$container['notAllowedHandler'] = function ($c) {
    return function ($rqst, $rsp, $methods) use ($c) {
        $error = $c['settings']['errors']["MethodNotAllowed"];
        $url = $c['settings']['error_info_url'];
        $response["data"] =  new ArrayObject();
        $response["error"]["type"] = $error["error_type"];
        $response["error"]["status_code"] = $error["http_code"];
        $response["error"]["error_code"] = $error["error_code"];
        $response["error"]["message"] = "This method is not allowed. Please check your method of call. Method must be one of: ".implode(', ', $methods); 
        $response["error"]["more_info"] = "For more info please visit ".$url.$error["error_code"];
        $rsp = $rsp
        ->write(json_encode($response, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK | JSON_PRETTY_PRINT))
        ->withHeader('Allow', implode(', ', $methods))
        ->withHeader('Content-Type', 'application/json')
        ->withStatus($response["error"]["status_code"]);

        $c->logger->addInfo("Method not allowed");
        return $rsp;
    };
};

$container['phpErrorHandler'] = function ($c) {
    return function ($rqst, $rsp, $error) use ($c) {
        $error2 = $c['settings']['errors']["PHPError"];
        $url = $c['settings']['error_info_url'];
        $response["data"] =  new ArrayObject();
        $response["error"]["type"] = $error2["error_type"];
        $response["error"]["status_code"] = $error2["http_code"];
        $response["error"]["error_code"] = $error2["error_code"];
        $response["error"]["message"] = "Something went wrong!. Details :".$error->getMessage();;
        if ($c['settings']['displayErrorDetails']){
            $response["error"]["stacktrace"] = "Exception Stack Trace. Details: ".$error->getTraceAsString();
            $response["error"]["file"] = "File: ".$error->getFile().", Line: ".$error->getLine();
        }
        $response["error"]["more_info"] = "For more info please visit ".$url.$error2["error_code"];
        $rsp = $rsp
        ->write(json_encode($response, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK | JSON_PRETTY_PRINT))
        ->withHeader('Content-Type', 'application/json')
        ->withStatus($response["error"]["status_code"]);

        $c->logger->addInfo("PHP Error occurred");
        return $rsp;
    };
};

$container['utc_time'] = function ($c) {
    date_default_timezone_set('UTC');
   	$dt = new DateTime();
	$newdt = $dt->format('Y-m-d H:i:s');
	return $newdt;
};

function convert_timezone ($coloumn = '', $alias = ''){
        global $device_timezone;
//        if (!$c['settings']['utc_timezone'] && $c['settings']['tz_conversion_method'] == 2){
            return "CONVERT_TZ(`".$coloumn."`,'+00:00','".$device_timezone."') AS `".$alias."`";    
//        } else {
//            return "`".$coloumn."` AS `".$alias."`";
//        }
            
}

$container['convert_timezone'] = function ($c) {
    return function ($coloumn = '', $alias = '') use ($c) {
        global $device_timezone;
        echo "coloumn : ".$coloumn;
        echo "alias : ".$alias;
        return "CONVERT_TZ(".$coloumn.",'+00:00',".$device_timezone.") AS ".$alias;
    };
};

$container['isset'] = function ($c) {
    return function ($value = '', $default = '') use ($c) {
        if (isset($value)) {
            return $value;
        } else {
            return $default;
        }
    };
};