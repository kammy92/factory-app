<?php
$tmp = "localhost";

return [
    'settings' => [
        'displayErrorDetails' => true, // set to false in production
        'blank_nulls' => true, //true=> null values shown as blanks '', false=> null values shown as 'null'
        'utc_timezone' => false, //true=> Using default UTC timezones in all the DateTime responses, false=> Using the device_timezone as saved in the database (if available)
        'tz_conversion_method' => 2, // 1=> Through array_walk_recursive function, 2=> Through direct query 
        'jwt_signing_key' => 'fd75d2941232c9a9fec01bb6117fff0dcc45973c12ebc637a1',
       
        // Database settings
        'db' => 
            strpos($_SERVER["HTTP_HOST"], 'localhost') !== false ? array( 
                'user' => 'root',
                'pass' => 'root',
                'host' => 'localhost',
                'name' => 'factory') : array(
                
                'user' => 'root',
                'pass' => 'root',
                'host' => 'localhost',
                'name' => 'factory'),
       
//        'db' => [
//            'user' => 'root',
//            'pass' => 'root',
//            'host' => 'localhost',
//            'name' => 'factory',
//        ],
//        'db2' => [
//            'user' => 'karman',
//            'pass' => 'user',
//            'host' => 'localhost',
//            'name' => 'factory',
//        ],
        // PHPMailer settings
        'phpmailer' => [
            'CharSet' => 'UTF-8',
			'Host' => 'smtp.gmail.com',
			'SMTPAuth' => true,
			'Username' => 'actipatient@gmail.com',
			'Password' => 'actipatient@12345',
			'SMTPSecure' => 'tls',
			'Port' => 587,
        ],
        // Monolog settings
        'logger' => [
            'name' => 'slim-app',
            'path' => isset($_ENV['docker']) ? 'php://stdout' : __DIR__ . '/../logs/app.log',
            'level' => \Monolog\Logger::DEBUG,
        ],    
        'logs' => [
            'monolog_log' => false,
            'api_log' => true,
            'api_log_level' => 2, // 1=> Basic Details (Only API details), 2=> Basic + Request Body (API Details and Request Body) 3=> Few Details (Request Details along with the API Details), 2=> All Detials (Request and Response and API Details) 
            'api_limit' => false,
            'api_limit_value' => 20,
        ],
        'postman_url' => "https://www.getpostman.com/collections/3b9cb98366f728ff4c24",
        'error_info_url' => 'https://factory-app-cammy92.c9users.io/slim_final/',
        'errors' => [
            'TokenGenerateError' => [
                'error_type' => 'TokenGenerateError',
                'error_code' => 1234,
                'http_code' => 500
            ],
            'JWTTokenEncodeError' => [
                'error_type' => 'JWTTokenEncodeError',
                'error_code' => 1234,
                'http_code' => 500
            ],
            'JWTTokenDecodeError' => [
                'error_type' => 'JWTTokenDecodeError',
                'error_code' => 1234,
                'http_code' => 401
            ],
            'MySQLException' => [
                'error_type' => 'MySQLException',
                'error_code' => 1234,
                'http_code' => 500
            ],
            'APILimitCrossed' => [
                'error_type' => 'APILimitCrossed',
                'error_code' => 1111,
                'http_code' => 429
            ],
            'APIKeyInvalid' => [
                'error_type' => 'APIKeyInvalid',
                'error_code' => 1111,
                'http_code' => 401
            ],
            'APIKeyNotFound' => [
                'error_type' => 'APIKeyNotFound',
                'error_code' => 1222,
                'http_code' => 403
            ],
            'UserTokenInvalid' => [
                'error_type' => 'UserTokenInvalid',
                'error_code' => 1111,
                'http_code' => 401
            ],
            'UserTokenNotFound' => [
                'error_type' => 'UserTokenNotFound',
                'error_code' => 1111,
                'http_code' => 403
            ],
            'RuntimeException' => [
                'error_type' => 'RuntimeException',
                'error_code' => 1111,
                'http_code' => 500
            ],
            'PageNotFoundError' => [
                'error_type' => 'PageNotFoundError',
                'error_code' => 1111,
                'http_code' => 404
            ],
            'MethodNotAllowed' => [
                'error_type' => 'MethodNotAllowed',
                'error_code' => 1111,
                'http_code' => 405
            ],
            'PHPError' => [
                'error_type' => 'PHPError',
                'error_code' => 1111,
                'http_code' => 500
            ],
            'ValidationError' => [
                'error_type' => 'ValidationError',
                'error_code' => 1111,
                'http_code' => 422
            ],
            'UserNotFound' => [
                'error_type' => 'UserNotFound',
                'error_code' => 1111,
                'http_code' => 404
            ],
            'InvalidCredentials' => [
                'error_type' => 'InvalidCredentials',
                'error_code' => 1111,
                'http_code' => 404
            ],
            'FailedInsertException' => [
                'error_type' => 'FailedInsertException',
                'error_code' => 1111,
                'http_code' => 400
            ],
            'FailedUpdateException' => [
                'error_type' => 'FailedUpdateException',
                'error_code' => 1111,
                'http_code' => 400
            ],
            'FailedDeleteException' => [
                'error_type' => 'FailedDeleteException',
                'error_code' => 1111,
                'http_code' => 400
            ],
            'InvalidParameterValues' => [
                'error_type' => 'InvalidParameterValues',
                'error_code' => 1111,
                'http_code' => 400
            ],
        ],
        'success_info_url' => 'https://factory-app-cammy92.c9users.io/slim_final/',
        'success' => [
            'TestSuccessful' => [
                'success_type' => 'TestSuccessful',
                'success_code' => 0000,
                'http_code' => 200
            ],
            'CronSuccessful' => [
                'success_type' => 'CronSuccessful',
                'success_code' => 0000,
                'http_code' => 200
            ],
            'LoginSuccessful' => [
                'success_type' => 'LoginSuccessful',
                'success_code' => 1234,
                'http_code' => 200
            ],
            'InitializedSuccessful' => [
                'success_type' => 'InitializedSuccessful',
                'success_code' => 1111,
                'http_code' => 200
            ],
            'InsertedSuccessful' => [
                'success_type' => 'InsertedSuccessful',
                'success_code' => 1234,
                'http_code' => 201
            ],
            'FetchedSuccessful' => [
                'success_type' => 'FetchedSuccessful',
                'success_code' => 1111,
                'http_code' => 200
            ],
            'UpdatedSuccessful' => [
                'success_type' => 'UpdatedSuccessful',
                'success_code' => 1111,
                'http_code' => 200
            ],
            'PatchedSuccessful' => [
                'success_type' => 'PatchedSuccessful',
                'success_code' => 1111,
                'http_code' => 200
            ],
            'DeletedSuccessful' => [
                'success_type' => 'DeletedSuccessful',
                'success_code' => 1111,
                'http_code' => 200
            ]
        ]
    ]
];