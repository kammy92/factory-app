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

    public function validateRequiredExpressions($parameter_keys, $parameter_values, $parameter_expressions) {
        $error = false; 
        $error_params = '';
        array_walk($parameter_expressions, function ($expression,$index) use ($parameter_keys, $parameter_values, &$error, &$error_params) {
            if (!preg_match($expression, $parameter_values[$index])){
                $error = true;
                $error_params .= "'".$parameter_keys[$index]."' => ".$parameter_values[$index].", ";
            }           
        });

       /* foreach($request_params as $param && $required_expression as $exp){
            $i++;
             if (!preg_match($exp, $param)){
                $error = true;
                $error_params .= "'".$param."', ";
            }
        }*/
        if($error){
            throw new ValidationException("Incorrect value(s) of parameters with key(s) ".substr($error_params, 0, -2));
        }
        return $error;
    }
}