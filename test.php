<?php
//$servername = "localhost";
//$username = "root";
//$password = "root";
//
//// Create connection
//$conn = new mysqli($servername, $username, $password);
//
//// Check connection
//if ($conn->connect_error) {
//    die("Connection failed: " . $conn->connect_error);
//} 
//echo "Connected successfully";
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
print_r($message);
?>