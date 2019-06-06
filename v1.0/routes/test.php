<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app->group('/test', function () use ($api_log) {
    $this->get('', function (Request $rqst, Response $rsp, array $args) {
        $response = array();
        
        //echo "<pre>";
        //print_r($rqst->getServerParams());
        //exit;
        $response["message"] = "";
        $rsp->getBody()->write(json_encode($response, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK | JSON_PRETTY_PRINT));
        $rsp->withHeader('Content-type', 'application/json')->withStatus(200);
        $this->logger->addInfo('in test/echo');
        return $rsp;
    })->add($api_log);
    
    $this->get('/echo/{message}', function (Request $rqst, Response $rsp, array $args) {
        $message = $args['message'];
        $response = array();
        $response["message"] = $message;
        $rsp->getBody()->write(json_encode($response, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK | JSON_PRETTY_PRINT));
        $rsp->withHeader('Content-type', 'application/json')->withStatus(200);
        $this->logger->addInfo('in test/echo');
        return $rsp;
    });
    
    $this->get('/server_configuration', function (Request $rqst, Response $rsp, array $args) {  
        $hasMySQL = false; 
        $hasMySQLi = false; 
        $withMySQLnd = false; 
        $response = array();
        
        if (function_exists('mysql_connect')) {
            $hasMySQL = true;
            $response["message"].= "(Deprecated) MySQL is installed. ";
        } else{
            $response["message"].= "(Deprecated) MySQL is not installed. ";
        }
        if (function_exists('mysqli_connect')) {
            $hasMySQLi = true;
            $response["message"].= "and the new (improved) MySQL is installed. ";
        } else{
            $response["message"].= "and the new (improved) MySQL is not installed. ";
        }
        if (function_exists('mysqli_get_client_stats')) {
            $withMySQLnd = true;
            $response["message"].= "This server is using MySQLnd as the driver."; 
        } else{
            $response["message"].= "This server is using libmysqlclient as the driver.";
        }
        
        $response["MySQL (Deprecated)"] = $hasMySQL;
        $response["MySQL (improved)"] = $hasMySQLi;
        $response["MySQLnd Driver"] = $withMySQLnd;
        
        $rsp->getBody()->write(json_encode($response, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK | JSON_PRETTY_PRINT));
        $rsp->withHeader('Content-type', 'application/json')->withStatus(200);
        $this->logger->addInfo('in test/server_configuration');
    });
   
    $this->get('/encryption/{message}', function (Request $rqst, Response $rsp, array $args) {  
        $response = array();
        $response["message_original"] =  $args['message'];
        $encrypt = $this->encrypt;
        $response["message_encrypted"] = $encrypt($args['message']);
        $decrypt = $this->decrypt;
        $response["message_decrypted"] = $decrypt($encrypt($args["message"]));
        $rsp->getBody()->write(json_encode($response, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK | JSON_PRETTY_PRINT));
        $rsp->withHeader('Content-type', 'application/json')->withStatus(200);
        $this->logger->addInfo('in test/encryption');
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