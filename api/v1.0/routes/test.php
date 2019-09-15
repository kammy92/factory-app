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
    
    $this->get('/jwt', function (Request $rqst, Response $rsp, array $args) {
        $response["data"] = array();
         $token_payload = [
            'user_id' => '1',
            'aud' => 'Karman Singh',
            'iss' => 'admin',
            'iat' => '2019-08-09 06:28:56',
            'exp' => strtotime('2019-09-06 06:28:56'),
            'zoneinfo' => '+05:30'
        ];

        // This is your client secret
        $key = 'fd75d2941232c9a9fec01bb6117fff0dcc45973c12ebc637a1';
//        $key2 = 'fd75d2941232c9a9fec01bb6117fff0dcc45973c12ebc637a1';
        // This is your id token
        try{
            $jwt = JWT::encode($token_payload, base64_decode(strtr($key, '-_', '+/')), 'HS256');
            //$response["data"]["jwt"] = $jwt;
        } catch(Exception $e) {
            $print=$this->error_response;
            $rsp = $print($rsp, "JWTTokenEncodeError", "Error occurred while encoding JWT Token. Please try again.");
            return $rsp;
        }
        try{
            $jwt2 = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJhdWQiOiJLYXJtYW4gU2luZ2giLCJpc3MiOiJhZG1pbiIsImlhdCI6IjIwMTktMDgtMDkgMDY6Mzk6MjgiLCJleHAiOjE1Njc3NTE5NjgsInpvbmVpbmZvIjoiKzA1OjMwIn0.snY_mdHgrh1GD6thiAkBcpFAJnP2-i5by7Wko7hBz6s";
            $decoded = JWT::decode($jwt2, base64_decode(strtr($key, '-_', '+/')), ['HS256']);
            $response["data"]["decoded"] = $decoded;
        } catch(Exception $e) {
            $print=$this->error_response;
            $rsp = $print($rsp, "JWTTokenDecodeError", "Error Occured while decoding JWT Token. Details: ".$e->getMessage(), $e);
            return $rsp;
        }            
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