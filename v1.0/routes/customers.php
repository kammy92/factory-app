<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app->group('/app', function () use ($user_auth) {
	$this->group('/customers', function () use ($user_auth) {
		$this->get('', function (Request $rqst, Response $rsp, array $args) {  
			$response = array();
			$response["data"] = array();
	    	try {
	    		$offset = $rqst->getParam("offset") ? $rqst->getParam("offset") : 0;
	    		$limit = $rqst->getParam("limit") ? $rqst->getParam("limit") : 100;
				$data["customers"] = getAllActiveCustomers($offset, $limit);
			} catch(Exception $e) {
				$print=$this->error_response;
				$rsp = $print($rsp, "MySQLException", "Error occurred in MySQL.", $e);
				return $rsp;
			}
			$data["offset"] = $offset;
			$data["limit"] = $limit;
			if(sizeof($data["customers"]) > 0){
				$message = "Customers fetched successfully.";
			} else {
				$message = "No Customer found.";
			}
			$response["data"] = $data;
			$print = $this->data_response;
			$rsp = $print($rsp, $response, "FetchedSuccessful", $message);  
			return $rsp;
		});
		
		$this->post('', function (Request $rqst, Response $rsp, array $args) {  
	  		$response = array();
  			$required_params = array("customer_name");
  			global $user_id;
	  		try {
	  			global $validation;
  				$validation->validateRequiredParams($required_params, $rqst->getParsedBody());
  			} catch(Exception $e){
	  			$print=$this->error_response;
				$rsp = $print($rsp, "ValidationError", "Error occurred in Validation. Details: ".$e->getMessage(), $e);
  				return $rsp;
  			}
  		
  			$customer_name = $rqst->getParam("customer_name");
			$customer_mobile = $rqst->getParam("customer_mobile");
			$customer_email = $rqst->getParam("customer_email");
			$customer_address = $rqst->getParam("customer_address");
	
			$response["data"] = array();
  			try {
	        	$data["info"] = insertNewCustomer($customer_name, $customer_mobile, $customer_email, $customer_address, $this->utc_time);
			} catch(Exception $e) {
				$print=$this->error_response;
				$rsp = $print($rsp, "MySQLException", "Error occurred in MySQL.", $e);
				return $rsp;
			}
			
  			if($data["info"]["affected_rows"] > 0){
        		$message = "Customer Inserted successfully.";
        		$data["customer_id"] = $data["info"]["insert_id"];
       			$response["data"] = $data;
				$print = $this->data_response;
				$rsp = $print($rsp, $response, "InsertedSuccessful", $message);  
    		} else {
	    		$print=$this->error_response;
				$rsp = $print($rsp, "FailedInsertException", "Failed to insert customer. Please try again.", "", json_encode($data["info"]));
        	}
  			return $rsp;
		});
		
		$this->put('/{customer_id:[0-9]+}', function (Request $rqst, Response $rsp, array $args) {  
	  		$response = array();
	  		$customer_id = $args['customer_id'];
	  		
  			$required_params = array("customer_name", "customer_mobile", "customer_email", "customer_name");
  			global $user_id;
	  		try {
	  			global $validation;
  				$validation->validateRequiredParams($required_params, $rqst->getParsedBody());
  			} catch(Exception $e){
	  			$print=$this->error_response;
				$rsp = $print($rsp, "ValidationError", "Error occurred in Validation. Details: ".$e->getMessage(), $e);
  				return $rsp;
  			}
  		
  			$customer_name = $rqst->getParam("customer_name");
			$customer_mobile = $rqst->getParam("customer_mobile");
			$customer_email = $rqst->getParam("customer_email");
			$customer_address = $rqst->getParam("customer_address");
	
			$response["data"] = array();
  			try {
	        	$data["info"] = updateCustomerDetails($customer_id, $customer_name, $customer_mobile, $customer_email, $customer_address, $this->utc_time);
			} catch(Exception $e) {
				$print=$this->error_response;
				$rsp = $print($rsp, "MySQLException", "Error occurred in MySQL.", $e);
				return $rsp;
			}
			
  			if($data["info"]["affected_rows"] > 0){
        		$message = "Customer Updated successfully.";
        		$data["customer_id"] = $customer_id;
       			$response["data"] = $data;
				$print = $this->data_response;
				$rsp = $print($rsp, $response, "UpdatedSuccessful", $message);  
    		} else {
	    		$print=$this->error_response;
				$rsp = $print($rsp, "FailedUpdateException", "Failed to update customer. Please try again.", "", json_encode($data["info"]));
        	}
  			return $rsp;
		});
		
		$this->patch('/{customer_id:[0-9]+}/status', function (Request $rqst, Response $rsp, array $args) {  
	  		$response = array();
	  		$customer_id = $args['customer_id'];
	  		
  			$required_params = array("customer_status");
  			global $user_id;
	  		try {
	  			global $validation;
  				$validation->validateRequiredParams($required_params, $rqst->getParsedBody());
  			} catch(Exception $e){
	  			$print=$this->error_response;
				$rsp = $print($rsp, "ValidationError", "Error occurred in Validation. Details: ".$e->getMessage(), $e);
  				return $rsp;
  			}
			
			$customer_status = $rqst->getParam("customer_status");
			if($customer_status != 0 && $customer_status != 1){
				$print=$this->error_response;
				$rsp = $print($rsp, "InvalidParameterValues", "Invalid parameter value provided. Please try again.");
				return $rsp;
			}

			$response["data"] = array();
  			try {
	        	$data["info"] = updateCustomerStatus($customer_id, $customer_status, $this->utc_time);
			} catch(Exception $e) {
				$print=$this->error_response;
				$rsp = $print($rsp, "MySQLException", "Error occurred in MySQL.", $e);
				return $rsp;
			}
			
  			if($data["info"]["affected_rows"] > 0){
        		$message = "Customer Status Updated successfully.";
        		$data["customer_id"] = $customer_id;
       			$response["data"] = $data;
				$print = $this->data_response;
				$rsp = $print($rsp, $response, "PatchedSuccessful", $message);  
    		} else {
	    		$print=$this->error_response;
				$rsp = $print($rsp, "FailedUpdateException", "Failed to update customer. Please try again.", "", json_encode($data["info"]));
        	}
  			return $rsp;
		});
		
		$this->delete('/{customer_id:[0-9]+}', function (Request $rqst, Response $rsp, array $args) {  
	  		$response = array();
	  		$customer_id = $args['customer_id'];
	  		
  			$required_params = array();
  			global $user_id;
	  		try {
	  			global $validation;
  				$validation->validateRequiredParams($required_params, $rqst->getParsedBody());
  			} catch(Exception $e){
	  			$print=$this->error_response;
				$rsp = $print($rsp, "ValidationError", "Error occurred in Validation. Details: ".$e->getMessage(), $e);
  				return $rsp;
  			}
  		
			$response["data"] = array();
  			try {
	        	$data["info"] = deleteCustomer($customer_id, $this->utc_time);
			} catch(Exception $e) {
				$print=$this->error_response;
				$rsp = $print($rsp, "MySQLException", "Error occurred in MySQL.", $e);
				return $rsp;
			}
			
  			if($data["info"]["affected_rows"] > 0){
        		$message = "Customer deleted successfully.";
        		$data["customer_id"] = $customer_id;
       			$response["data"] = $data;
				$print = $this->data_response;
				$rsp = $print($rsp, $response, "DeletedSuccessful", $message);  
    		} else {
	    		$print=$this->error_response;
				$rsp = $print($rsp, "FailedDeleteException", "Failed to delete customer. Please try again.", "", json_encode($data["info"]));
        	}
  			return $rsp;
		});
	})->add($user_auth);
});


function getAllActiveCustomers($offset, $limit){
	global $mysqli;
	$query = "SELECT `cstmr_id` AS `customer_id`, `cstmr_name` AS `customer_name`, `cstmr_mobile` AS `customer_mobile`, `cstmr_email` AS `customer_email`, `cstmr_address` AS `customer_address`, `cstmr_created_at` FROM `tbl_customers` WHERE `cstmr_status` = 1 ORDER BY `cstmr_name` ASC LIMIT ?,?";
	return $mysqli->query($query, [$offset, $limit], "ii")->fetchAll("assoc");
}

function insertNewCustomer($customer_name, $customer_mobile, $customer_email, $customer_address, $datetime){
	$rsp = array();
	global $mysqli;
	$query = "INSERT INTO `tbl_customers`(`cstmr_name`, `cstmr_mobile`, `cstmr_email`, `cstmr_address`, `cstmr_status`, `cstmr_created_at`) VALUES (?,?,?,?,1,?)";
	$insert = $mysqli->query($query, [$customer_name, $customer_mobile, $customer_email, $customer_address, $datetime]);
	$rsp["affected_rows"] = $insert->affectedRows();
    $rsp["insert_id"] = $insert->insertId();
//    $rsp["rows_matched"] = $insert->info()["Rows matched"];
//    $rsp["changed"] = $insert->info()["Changed"];
//    $rsp["warnings"] = $insert->info()["Warnings"];
    return $rsp;
}

function updateCustomerDetails($customer_id, $customer_name, $customer_mobile, $customer_email, $customer_address, $datetime){
	$rsp = array();
	global $mysqli;
	$query = "UPDATE `tbl_customers` SET `cstmr_name` = ?, `cstmr_mobile` = ?, `cstmr_email` = ?, `cstmr_address` = ?, `cstmr_modified_at` = ? WHERE `cstmr_id` = ?";
	$update = $mysqli->query($query, [$customer_name, $customer_mobile, $customer_email, $customer_address, $datetime, $customer_id], "sssssi");
	$rsp["affected_rows"] = $update->affectedRows();
    $rsp["rows_matched"] = $update->info()["Rows matched"];
    $rsp["changed"] = $update->info()["Changed"];
    $rsp["warnings"] = $update->info()["Warnings"];
    return $rsp;
}

function updateCustomerStatus($customer_id, $customer_status, $datetime){
	$rsp = array();
	global $mysqli;
	$query = "UPDATE `tbl_customers` SET `cstmr_status` = ?, `cstmr_modified_at` = ? WHERE `cstmr_id` = ?";
	$update = $mysqli->query($query, [$customer_status, $datetime, $customer_id], "isi");
	$rsp["affected_rows"] = $update->affectedRows();
    $rsp["rows_matched"] = $update->info()["Rows matched"];
    $rsp["changed"] = $update->info()["Changed"];
    $rsp["warnings"] = $update->info()["Warnings"];
    return $rsp;
}

function deleteCustomer($customer_id, $datetime){
	$rsp = array();
	global $mysqli;
	$query = "UPDATE `tbl_customers` SET `cstmr_status` = -1, `cstmr_deleted_at` = ? WHERE `cstmr_id` = ?";
	$delete = $mysqli->query($query, [$datetime, $customer_id], "si");
	$rsp["affected_rows"] = $delete->affectedRows();
    $rsp["rows_matched"] = $delete->info()["Rows matched"];
    $rsp["changed"] = $delete->info()["Changed"];
    $rsp["warnings"] = $delete->info()["Warnings"];
    return $rsp;
}