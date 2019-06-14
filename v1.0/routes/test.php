<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

use \Firebase\JWT\JWT;

$app->group('/test', function () use ($api_log) {
    $this->get('', function (Request $rqst, Response $rsp, array $args) {
        $response["data"] = array();
        
        $token_payload = [
            'iss' => 'https://github.com/auth0/php-jwt-example',
            'sub' => '123456',
            'name' => 'John Doe',
            'email' => 'info@auth0.com'
        ];
        // This is your client secret
        $key = '__test_secret__';
        $key2 = '__test_secret__';
        // This is your id token
        $jwt = JWT::encode($token_payload, base64_decode(strtr($key, '-_', '+/')), 'HS256');
        $decoded = JWT::decode($jwt, base64_decode(strtr($key2, '-_', '+/')), ['HS256']);
        $response["data"]["jwt"] = $jwt;
        $response["data"]["decoded"] = $decoded;

        $print = $this->data_response;
        $rsp = $print($rsp, $response, "TestSuccessful", "Test URL");
        return $rsp;
    });
    
    $this->get('/echo/{message}', function (Request $rqst, Response $rsp, array $args) {
        $response["data"] = array();
        $print = $this->data_response;
        $rsp = $print($rsp, $response, "TestSuccessful", $args['message']);
        return $rsp;
    });
    
    $this->get('/server-configuration', function (Request $rqst, Response $rsp, array $args) {  
        $hasMySQL = false; 
        $hasMySQLi = false; 
        $withMySQLnd = false; 
        $response["data"] = array();
        $message = "";
        if (function_exists('mysql_connect')) {
            $hasMySQL = true;
            $message .= "(Deprecated) MySQL is installed. ";
        } else {
            $message .= "(Deprecated) MySQL is not installed. ";
        }
        if (function_exists('mysqli_connect')) {
            $hasMySQLi = true;
            $message .= "and the new (improved) MySQL is installed. ";
        } else{
            $message .= "and the new (improved) MySQL is not installed. ";
        }
        if (function_exists('mysqli_get_client_stats')) {
            $withMySQLnd = true;
            $message .= "This server is using MySQLnd as the driver."; 
        } else{
            $message .= "This server is using libmysqlclient as the driver.";
        }

        $response["data"]["MySQL (Deprecated)"] = $hasMySQL;
        $response["data"]["MySQL (improved)"] = $hasMySQLi;
        $response["data"]["MySQLnd Driver"] = $withMySQLnd;

        $print = $this->data_response;
        $rsp = $print($rsp, $response, "TestSuccessful", $message);
        return $rsp;        
    });
   

    $this->get('/encryption/{message}', function (Request $rqst, Response $rsp, array $args) {  
        $response["data"] = array();
        $response["data"]["message_original"] =  $args['message'];
        $encrypt = $this->encrypt;
        $response["data"]["message_encrypted"] = $encrypt($args['message']);
        // $decrypt = $this->decrypt;
        // $response["data"]["message_decrypted"] = $decrypt($encrypt($args["message"]));

        $print = $this->data_response;
        $rsp = $print($rsp, $response, "TestSuccessful", "Encryption Successful");
        return $rsp;
    });
    
    $this->get('/encrypt/{message}', function (Request $rqst, Response $rsp, array $args) {  
        $response = array();
        $response["message_original"] =  $args['message'];
        $encrypt = $this->encrypt;
        $response["message_encrypted"] = $encrypt($args['message']);
        $rsp->getBody()->write(json_encode($response, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK | JSON_PRETTY_PRINT));
        $rsp->withHeader('Content-type', 'application/json')->withStatus(200);
        $this->logger->addInfo('in test/encrypt');
    });
    
    $this->get('/decrypt/{message}', function (Request $rqst, Response $rsp, array $args) {  
        $response = array();
        $response["message_original"] =  $args['message'];
        $decrypt = $this->decrypt;
        $response["message_decrypted"] = $decrypt(($args["message"]));
        $rsp->getBody()->write(json_encode($response, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK | JSON_PRETTY_PRINT));
        $rsp->withHeader('Content-type', 'application/json')->withStatus(200);
        $this->logger->addInfo('in test/decrypt');
    });
    
    $this->get('/phpinfo', function (Request $rqst, Response $rsp, array $args) {  
        phpinfo();
        $this->logger->addInfo('in test/phpinfo');
    });
});