<?php
$api_auth = function ($rqst, $rsp, $next) {
    try {
        if ($rqst->hasHeader('api-key')) {
            $api_key = $rqst->getHeader('api-key')[0];
            if (isValidApiKey($api_key)) {
                $rsp = $next($rqst, $rsp);
            } else {
                $print=$this->error_response;
		        $rsp = $print($rsp, "APIKeyInvalid", "Access Denied. API key is not valid.");
		        return $rsp;
            }
        } else {
            $print=$this->error_response;
		    $rsp = $print($rsp, "APIKeyNotFound", "Access Denied. API key is not present.");
		    return $rsp;
        }
	} catch(Exception $e) {
		$print=$this->error_response;
		$rsp = $print($rsp, "MySQLException", "Error occurred in MySQL. Details: ".$e->getMessage(), $e);
		return $rsp;
	}
    return $rsp;
};

$user_auth = function ($rqst, $rsp, $next) {
    try {
        if ($rqst->hasHeader('api-key')) {
            $api_key = $rqst->getHeader('api-key')[0];
            if (isValidApiKey($api_key)) {
                if ($rqst->hasHeader('authorization')) {
                    $user_token = substr($rqst->getHeader('authorization')[0], 7);
                    $device_id = $rqst->hasHeader('device-id') ? $rqst->getHeader('device-id')[0] : "";
	                $device_type = strtoupper($rqst->hasHeader("device-type")) ? (in_array(strtoupper($rqst->getHeader("device-type")[0]), ["ANDROID", "IOS", "WEB"]) ? strtoupper($rqst->getHeader("device-type")[0]) : "") : "";
                    $user = isValidUserToken($device_id, $device_type, $user_token);
        	        if ($user["found"] > 0) {
                        global $user_id;
                        $user_id = $user["user_id"];
                        $rsp = $next($rqst, $rsp);
                    } else {
                        $print=$this->error_response;
                        $rsp = $print($rsp, "UserTokenInvalid", "Access Denied. User token is not valid.");
                        return $rsp;
                    }
                 } else {
                     $print=$this->error_response;
                     $rsp = $print($rsp, "UserTokenNotFound", "Access Denied. User Authorization Token is not present.");
                     return $rsp;
                 }
            } else {
                $print=$this->error_response;
		        $rsp = $print($rsp, "APIKeyInvalid", "Access Denied. API key is not valid.");
		        return $rsp;
            }
        
        } else {
            $print=$this->error_response;
		    $rsp = $print($rsp, "APIKeyNotFound", "Access Denied. API key is not present.");
		    return $rsp;
        }
	} catch(Exception $e) {
		$print=$this->error_response;
		$rsp = $print($rsp, "MySQLException", "Error occurred in MySQL. Details: ".$e->getMessage(), $e);
		return $rsp;
	}
    return $rsp;
};

$api_log = function ($rqst, $rsp, $next) {
    try {
        $api_limit = $this->get('settings')['logs']['api_limit'];
        $api_limit_value = $this->get('settings')['logs']['api_limit_value'];
        
        if($this->get('settings')['logs']['api_log']){
                $server = $rqst->getServerParams();
                $count = getTodayAPIHits(getIPAddress($server), $this->utc_time);
                $result = insertAPILog($this->get('settings')['logs']['api_log_level'], getIPAddress($server), $server["REQUEST_METHOD"], $server["REQUEST_SCHEME"]."://".$server["SERVER_NAME"].$server["REQUEST_URI"], $server["REQUEST_URI"], json_encode($rqst->getParsedBody()), json_encode($rqst->getHeaders()), json_encode($server), $this->utc_time);
                $log_id = $result["insert_id"];
                    
                if ($api_limit && $count > $api_limit_value){
                    $print=$this->error_response;
                    $rsp = $rsp->withHeader("X-RateLimit-Limit", $api_limit_value)
                            ->withHeader("X-RateLimit-Remaining", $api_limit_value - $count)
                            ->withHeader("X-RateLimit-Reset", strtotime(date('Y-m-d 00:00:00', strtotime($this->utc_time.'+1 days'))));
                    $rsp = $print($rsp, "APILimitCrossed", "Access Denied. API limit crossed your daily limit.");
                    $headers = $rsp->getHeaders();
                    $msg_type = $rsp->hasHeader("Error-Type") ? $headers["Error-Type"][0] : $headers["Success-Type"][0];
                    $msg_code = $rsp->hasHeader("Error-Code") ? $headers["Error-Code"][0] : $headers["Success-Code"][0];
                    updateAPILog($this->get('settings')['logs']['api_log_level'], $log_id, $headers["Status-Code"][0], $msg_code, $msg_type, json_encode($headers), $rsp, $this->utc_time);
                    return $rsp;
                } else {
                    if($api_limit){
                        $rsp = $rsp->withHeader("X-RateLimit-Limit", $api_limit_value)
                            ->withHeader("X-RateLimit-Remaining", $api_limit_value - $count)
                            ->withHeader("X-RateLimit-Reset", strtotime(date('Y-m-d 00:00:00', strtotime($this->utc_time.'+1 days'))));
                    }
                    $rsp = $next($rqst, $rsp);
                    $headers = $rsp->getHeaders();
                    $msg_type = $rsp->hasHeader("Error-Type") ? $headers["Error-Type"][0] : $headers["Success-Type"][0];
                    $msg_code = $rsp->hasHeader("Error-Code") ? $headers["Error-Code"][0] : $headers["Success-Code"][0];
                    updateAPILog($this->get('settings')['logs']['api_log_level'], $log_id, $headers["Status-Code"][0], $msg_code, $msg_type, json_encode($headers), $rsp, $this->utc_time);
                }                    
        } else {
            $rsp = $next($rqst, $rsp);
        }
   	} catch(Exception $e) {
		$print=$this->error_response;
		$rsp = $print($rsp, "MySQLException", "Error occurred in MySQL. Details: ".$e->getMessage(), $e);
		return $rsp;
	}
    return $rsp;
};

function isValidApiKey($api_key) {
    global $mysqli;
    $query = "SELECT * FROM `tbl_api_keys` WHERE `ky_auth` = ? AND `ky_status` = 1";
    $result = $mysqli->query($query, [$api_key]);
   	return $result->numRows();
}

function isValidUserToken($device_id, $device_type, $user_token) {
    global $mysqli;
    $rsp = array();
    $query = "SELECT `lgn_usr_id` FROM `tbl_user_logins` WHERE `lgn_device_id` = ? AND `lgn_device_type` = ? AND `lgn_token` = ? AND `lgn_token_status` = 1";
    $result = $mysqli->query($query, [$device_id, $device_type, $user_token]);
    $rsp["found"] = $result->numRows();
	$rsp["user_id"] = $result->fetch("col");
	return $rsp;
}

function getIPAddress($server){
    $ipaddress = '';
    if (array_key_exists('HTTP_CLIENT_IP', $server))
        $ipaddress = $server['HTTP_CLIENT_IP'];
    else if(array_key_exists('HTTP_X_FORWARDED_FOR', $server))
        $ipaddress = $server['HTTP_X_FORWARDED_FOR'];
    else if(array_key_exists('HTTP_X_FORWARDED', $server))
        $ipaddress = $server['HTTP_X_FORWARDED'];
    else if(array_key_exists('HTTP_FORWARDED_FOR', $server))
        $ipaddress = $server['HTTP_FORWARDED_FOR'];
    else if(array_key_exists('HTTP_FORWARDED', $server))
        $ipaddress = $server['HTTP_FORWARDED'];
    else if(array_key_exists('REMOTE_ADDR', $server))
        $ipaddress = $server['REMOTE_ADDR'];
    else
        $ipaddress = 'UNKNOWN';
    return $ipaddress;
}

function getTodayAPIHits($request_ip, $datetime) {
    global $mysqli;
    $date = date("Y-m-d",strtotime($datetime));
    $query = "SELECT COUNT(*) FROM `tbl_api_logs` WHERE `lg_rqst_ip` = ? AND DATE(`lg_created_at`) = ?";
	return $mysqli->query($query, [$request_ip, $date])->fetch("col");
}

function insertAPILog($log_level, $request_ip, $request_method, $request_url, $request_uri, $request_body, $request_header, $request_raw, $datetime) {
    $rsp = array();
    global $mysqli;
	$time = round(microtime(true)*1000);
	switch($log_level){
	    case 1:
	        $query = "INSERT INTO `tbl_api_logs`(`lg_rqst_ip`, `lg_rqst_method`, `lg_rqst_url`, `lg_rqst_uri`, `lg_execution_time`, `lg_status`, `lg_created_at`) VALUES (?,?,?,?,?,0,?)";
	        $insert = $mysqli->query($query, [$request_ip, $request_method, $request_url, $request_uri, $time, $datetime], "ssssis");
	        break;
        case 2:
	        $query = "INSERT INTO `tbl_api_logs`(`lg_rqst_ip`, `lg_rqst_method`, `lg_rqst_url`, `lg_rqst_uri`, `lg_rqst_body`, `lg_execution_time`, `lg_status`, `lg_created_at`) VALUES (?,?,?,?,?,?,0,?)";
	        $insert = $mysqli->query($query, [$request_ip, $request_method, $request_url, $request_uri, $request_body, $time, $datetime], "sssssis");
	        break;
        case 3:
            $query = "INSERT INTO `tbl_api_logs`(`lg_rqst_ip`, `lg_rqst_method`, `lg_rqst_url`, `lg_rqst_uri`, `lg_rqst_body`, `lg_rqst_header`, `lg_execution_time`, `lg_status`, `lg_created_at`) VALUES (?,?,?,?,?,?,?,0,?)";
            $insert = $mysqli->query($query, [$request_ip, $request_method, $request_url, $request_uri, $request_body, $request_header, $time, $datetime], "ssssssis");
	        break;
        case 4:
            $query = "INSERT INTO `tbl_api_logs`(`lg_rqst_ip`, `lg_rqst_method`, `lg_rqst_url`, `lg_rqst_uri`, `lg_rqst_body`, `lg_rqst_header`, `lg_rqst_raw`, `lg_execution_time`, `lg_status`, `lg_created_at`) VALUES (?,?,?,?,?,?,?,?,0,?)";
            $insert = $mysqli->query($query, [$request_ip, $request_method, $request_url, $request_uri, $request_body, $request_header, $request_raw, $time, $datetime], "sssssssis");
	       break;
	}

	$rsp["affected_rows"] = $insert->affectedRows();
    $rsp["insert_id"] = $insert->insertId();
//    $rsp["rows_matched"] = $insert->info()["Rows matched"];
//    $rsp["changed"] = $insert->info()["Changed"];
//    $rsp["warnings"] = $insert->info()["Warnings"];
    return $rsp;
}

function updateAPILog($log_level, $log_id, $http_code, $message_code, $message_type, $response_headers, $response_raw, $datetime) {
	$time = round(microtime(true)*1000);
	$rsp = array();
	global $mysqli;
	global $user_id;
	switch($log_level){
	    case 1:
	        $query = "UPDATE `tbl_api_logs` SET `lg_usr_id` = ?, `lg_rsp_http_code` = ?,`lg_rsp_msg_code` = ?, `lg_rsp_msg_type` = ?, `lg_execution_time` = ? - `lg_execution_time`, `lg_status` = 1, `lg_modified_at` = ? WHERE `lg_id` = ?";
            $update = $mysqli->query($query, [$user_id, $http_code, $message_code, $message_type, $time, $datetime, $log_id], "isssisi");
	        break;
        case 2:
	        $query = "UPDATE `tbl_api_logs` SET `lg_usr_id` = ?, `lg_rsp_http_code` = ?,`lg_rsp_msg_code` = ?, `lg_rsp_msg_type` = ?, `lg_execution_time` = ? - `lg_execution_time`, `lg_status` = 1, `lg_modified_at` = ? WHERE `lg_id` = ?";
            $update = $mysqli->query($query, [$user_id, $http_code, $message_code, $message_type, $time, $datetime, $log_id], "isssisi");
	        break;
        case 3:
	        $query = "UPDATE `tbl_api_logs` SET `lg_usr_id` = ?, `lg_rsp_http_code` = ?,`lg_rsp_msg_code` = ?, `lg_rsp_msg_type` = ?, `lg_rsp_headers` = ?, `lg_execution_time` = ? - `lg_execution_time`, `lg_status` = 1, `lg_modified_at` = ? WHERE `lg_id` = ?";
            $update = $mysqli->query($query, [$user_id, $http_code, $message_code, $message_type, $response_headers, $time, $datetime, $log_id], "issssisi");
	        break;
        case 4:
            $query = "UPDATE `tbl_api_logs` SET `lg_usr_id` = ?, `lg_rsp_http_code` = ?,`lg_rsp_msg_code` = ?, `lg_rsp_msg_type` = ?, `lg_rsp_headers` = ?, `lg_rsp_raw` = ?, `lg_execution_time` = ? - `lg_execution_time`, `lg_status` = 1, `lg_modified_at` = ? WHERE `lg_id` = ?";
            $update = $mysqli->query($query, [$user_id, $http_code, $message_code, $message_type, $response_headers, $response_raw, $time, $datetime, $log_id], "isssssisi");
	        break;
	}
	
	$rsp["affected_rows"] = $update->affectedRows();
    $rsp["rows_matched"] = $update->info()["Rows matched"];
    $rsp["changed"] = $update->info()["Changed"];
    $rsp["warnings"] = $update->info()["Warnings"];
    return $rsp;
}