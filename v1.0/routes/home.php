<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app->group('/', function () use ($api_log) {
    $this->get('', function (Request $rqst, Response $rsp, array $args) {
        $response["data"] = array();
        $response["data"]["postman-link"] = $this["settings"]["postman_url"];
        $response["data"]["endpoints"] = array();
        
        $endpoint = array(
            "url"=>"http://node16.codenvy.io:32996/factory-app/api/v1.0/app/customers", 
            "method"=>"GET",
            "headers"=>array(
                "Authorization:Bearer <token>",
                "api-key:<api-key>",
                "device-id:<device-id> (optional)",
                "device-type:ANDROID/IOS/WEB (optional)"),
            "parameters"=>array(
                "limit:<limit-of-records>",
                "offset:<offset-for-fetch>"));
        
        array_push($response["data"]["endpoints"], $endpoint);
        $print = $this->data_response;
        $rsp = $print($rsp, $response, "TestSuccessful", "API HOME");
        return $rsp;
    });
});