<?php

// https://github.com/WebsiteBeaver/Simple-MySQLi

class ValidationException extends Exception {}

/**
 * Class SimpleMySQLi
 *
 * @version 1.5.5
 */
class Validations {
	private $validation;

	public function __construct() {
	}

	public function validateRequiredParams($required_params, $request_params) {
		$error = false; 
        $error_params = '';
        
        foreach($required_params as $param){
            if(!isset($request_params[$param]) || strlen($request_params[$param])<=0){
                $error = true; 
                $error_params .= "'".$param."', ";
            }
        }
        
        if($error){
        	throw new ValidationException("Required parameters with key ".substr($error_params, 0, -2)." are either missing or empty");
        }
		return $error;
	}
}