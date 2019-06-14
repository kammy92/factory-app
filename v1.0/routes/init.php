<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app->group('/app', function () use ($user_auth) {
	$this->post('/init/application', function (Request $rqst, Response $rsp, array $args){  
		$response = array();
		global $user_id;
		$required_params = array("app_version");
		try{
	  		global $validation;
			$validation->validateRequiredParams($required_params, $rqst->getParsedBody());
	  	} catch(Exception $e){
  			$print=$this->error_response;
			$rsp = $print($rsp, "ValidationError", "Error occurred in Validation. Details: ".$e->getMessage(), $e);
  			return $rsp;
  		}
  	
  	
  		$app_version = $rqst->getParam("app_version");
  		$firebase = $rqst->getParam("firebase") ? $rqst->getParam("firebase") : "";
		$device_id = $rqst->hasHeader("device-id") ? $rqst->getHeader("device-id")[0] : "";
		$device_type = strtoupper($rqst->hasHeader("device-type")) ? (in_array(strtoupper($rqst->getHeader("device-type")[0]), ["ANDROID", "IOS", "WEB"]) ? strtoupper($rqst->getHeader("device-type")[0]) : "") : "";

		$response["data"] = array();
	
		try {
			$update = updateUserLoginDetails($user_id, $device_id, $device_type, $app_version, $firebase, $this->utc_time);
		    $result = getCurrentAppVersion($device_type);
            if($result["app_version"] > $app_version){
            	$data["update"]["update_available"] = 1;
            	$data["update"]["update_message"] = $result["version_changelog"];
            	$data["update"]["update_critical"] = $result["version_critical"];
            } else {
            	$data["update"]["update_available"] = 0;
            }
            $data["categories"] = getInitProductCategories();
           	$message = "Application Initialized Successfully";
   		} catch(Exception $e) {
			$print=$this->error_response;
			$rsp = $print($rsp, "MySQLException", "Error occurred in MySQL.", $e);
			return $rsp;
		}
		
		$response["data"] = $data;
		$print = $this->data_response;
		$rsp = $print($rsp, $response, "InitializedSuccessful", $message, "Category Type: 0=>Intermediate, 1=>Final");
		return $rsp;
	})->add($user_auth);
});


function updateUserLoginDetails($user_id, $device_id, $device_type, $app_version, $firebase, $datetime){
	global $mysqli;
	$query = "UPDATE `tbl_user_logins` SET `lgn_firebase` = ?, `lgn_firebase_status` = 1, `lgn_app_version` = ?, `lgn_last_login` = ?, `lgn_modified_at` = ? WHERE `lgn_usr_id` = ? AND `lgn_device_id` = ? AND `lgn_device_type` = ?";
	$result = $mysqli->query($query, [$firebase, $app_version, $datetime, $datetime, $user_id, $device_id, $device_type], "ssssiss");
	if($result->affectedRows() > 0){
		return 1;
	} else {
		return 0;
	}
}

function getCurrentAppVersion($device_type) {
	global $mysqli;
	$query = "SELECT `vrsn_app_version` AS `app_version`, `vrsn_changelogs` AS `version_changelog`, `vrsn_critical` AS `version_critical` FROM `tbl_app_versions` WHERE `vrsn_device_type` = ? AND `vrsn_status` = 1 ORDER BY `vrsn_updated_on` DESC LIMIT 1";
	$result = $mysqli->query($query, [$device_type], "s");
	return $result->fetch("assoc");
}

function getInitProductCategories(){
	global $mysqli;
	$query = "SELECT `ctgry_id` AS `category_id`, `ctgry_name` AS `category_name`, `ctgry_type` AS `category_type` FROM `tbl_product_categories` WHERE `ctgry_status` = 1";
	return $mysqli->query($query)->fetchAll("assoc");
}

function getInitCustomers(){
	global $mysqli;
	$query = "SELECT `cstmr_id` AS `customer_id`, `cstmr_name` AS `customer_name`, `cstmr_mobile` AS `customer_mobile`, `cstmr_email` AS `customer_email`, `cstmr_address` AS `customer_address` FROM `tbl_customers` WHERE `cstmr_status` = 1 ORDER BY `cstmr_name` ASC";
	return $mysqli->query($query)->fetchAll("assoc");
}