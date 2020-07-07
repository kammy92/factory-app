<?php

/**
 * Open a connection via PDO to create a
 * new database and table with structure.
 *
 */
//$option = readline('Do you want to enter details? (y/n)'); 
//if ($option == 'y' || $option == 'Y'){
//    $host = readline('Enter the host: '); 
//    $username = readline('Enter the username: '); 
//    $password = readline('Enter the password: '); 
//} else {
    $host = '127.0.0.1'; 
    $username = 'root'; 
    $password = 'root'; 
//}
$dbname     = "factory";
$dsn        = "mysql:host=$host;dbname=$dbname";
$options    = array(
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
              );

try {
    $connection = new PDO("mysql:host=$host", $username, $password, $options);
    $sql = file_get_contents("factory.sql");
    $connection->exec($sql);
    echo "Database created and initialized successfully.";
} catch(PDOException $error) {
    echo $sql . "<br>" . $error->getMessage();
}
