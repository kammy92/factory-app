<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app->group('/app', function () use ($api_auth) {
	$this->post('/login', function (Request $rqst, Response $rsp, array $args){
		$response = array();
		$required_params = array("login_username", "login_password");
		try{
	  		global $validation;
			$validation->validateRequiredParams($required_params, $rqst->getParsedBody());
	  	} catch(Exception $e){
  			$print=$this->error_response;
			$rsp = $print($rsp, "ValidationError", "Error occurred in Validation. Details: ".$e->getMessage(), $e);
  			return $rsp;
  		}
  		
  		$login_username = $rqst->getParam("login_username");
		$login_password = $rqst->getParam("login_password");

		$device_id = $rqst->hasHeader("device-id") ? $rqst->getHeader("device-id")[0] : "";
		$device_type = strtoupper($rqst->hasHeader("device-type")) ? (in_array(strtoupper($rqst->getHeader("device-type")[0]), ["ANDROID", "IOS", "WEB"]) ? strtoupper($rqst->getHeader("device-type")[0]) : "") : "";

		$response["data"] = array();
	
		try {
			$result = validateUserLogin($login_username, $login_password);
        	switch($result){
	        	case 0:
        			$print=$this->error_response;
					$rsp = $print($rsp, "UserNotFound", "User not found");
					return $rsp;
        			break;
        		case 1:
	        		$user = getUserDetails($device_id, $device_type, $login_username);
        			switch ($user["lgn_token_status"]){
    	    			case 1:
        					$data["user_name"] = $user["usr_name"];
        					$data["user_email"] = $user["usr_email"];
	        				$data["user_mobile"] = $user["usr_mobile"];
        					$data["user_image"] = $user["usr_image"];
        					$data["user_type"] = $user["usr_type"];
        					$data["user_token"] = $user["lgn_token"];
        					break;
        				default:
        				    $generate_token = $this->generate_token;
	        				$token = generateNewToken($generate_token, $device_id, $device_type, $user["usr_id"],$user["usr_name"], $this->utc_time);
        					$data["user_name"] = $user["usr_name"];
        					$data["user_email"] = $user["usr_email"];
        					$data["user_mobile"] = $user["usr_mobile"];
        					$data["user_image"] = $user["usr_image"];
        					$data["user_type"] = $user["usr_type"];
        					$data["user_token"] = $token["lgn_token"];
        					break;
        			}
        			break;
        		case 2:
	        		$print=$this->error_response;
					$rsp = $print($rsp, "InvalidCredentials", "Invalid login credentials or User Inactive/Suspended");
					return $rsp;
        			break;
        	}
		} catch(Exception $e) {
			$print=$this->error_response;
			$rsp = $print($rsp, "MySQLException", "Error occurred in MySQL.", $e);
			return $rsp;
		}
		
		$response["data"] = $data;
		$print = $this->data_response;
		$rsp = $print($rsp, $response, "LoginSuccessful", "Login Successful", "User Type: 1=>Admin");
		return $rsp;
	})->add($api_auth);
});

function validateUserLogin($login_username, $login_password){
	global $mysqli;
	$query = "SELECT `usr_login_password` FROM `tbl_users` WHERE `usr_login_username` = ? AND `usr_status` = 1";
	$result = $mysqli->query($query, $login_username);
	if($result->numRows() > 0){
		if(password_verify($login_password, $result->fetch("col"))){
			return 1;
		} else {
			return 2;
		}
	} else {
		return 0;
	}
}

function getUserDetails($device_id, $device_type, $login_username) {
	global $mysqli;
	$query = "SELECT * FROM `tbl_users` LEFT JOIN `tbl_user_logins` ON `usr_id` = `lgn_usr_id` AND `lgn_token_status` = 1 AND `lgn_device_id` = ? AND `lgn_device_type` = ? WHERE `usr_login_username` = ?";
	$result = $mysqli->query($query, [$device_id, $device_type, $login_username]);
	return $result->fetch("assoc");
}

function generateNewToken($generate_token, $device_id, $device_type, $user_id, $user_name, $datetime) {
	global $mysqli;
	$expiry = date('Y-m-d H:i:s', strtotime('+4 week', strtotime($datetime)));
	$generate_token = $this->generate_token;
	$token = $generate_token($user_id, $user_name, $datetime, $expiry);
	$query = ["INSERT INTO `tbl_user_logins`(`lgn_usr_id`, `lgn_device_id`, `lgn_device_type`, `lgn_token`, `lgn_token_status`, `lgn_token_valid_from`, `lgn_token_valid_till`, `lgn_created_at`) VALUES (?,?,?,?,1,?,?,?)", "SELECT * FROM `tbl_user_logins` WHERE `lgn_id` = ?"];
	$values = [$user_id, $device_id, $device_type, $token, $datetime, $expiry, $datetime];
	$types = "issssss";
	$user_token = array();
	$mysqli->transaction(function($mysqli) use ($query, $values, $types, &$user_token) {
		$insert = $mysqli->query($query[0], $values, $types);
		if($insert->affectedRows() < 1) 
			throw new Exception('Error inserting values');
		$user_token = $mysqli->query($query[1], $insert->insertId(), "i")->fetch("assoc");
	});
	return $user_token;
}