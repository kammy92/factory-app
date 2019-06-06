<?php
ini_set("display_errors", "1");
error_reporting(E_ALL);

require '../vendor/autoload.php';
require '../src/simple-mysqli.php';
require '../src/validations.php';

$settings = require '../src/settings.php';

$user_id;

$app = new \Slim\App($settings);
require '../src/dependencies.php';
require '../src/middleware.php';


try{
    $mysqli = new SimpleMySQLi();
    $validation = new Validations();
} catch(Exception $e){
//    echo json_encode($e->getMessage());
//    $print=$app->getContainer()->error_response;
//    $rsp = $print($rsp, "MySQLException", "Error occurred in MySQL. Details=> ".$e->getMessage(), $e);
}
foreach (glob("routes/*.php") as $filename){
    include $filename;
}

$app->add($api_log);

$app->run();

