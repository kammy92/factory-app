<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app->group('/cron', function () use ($api_log) {
    $this->get('/check-expired-tokens', function (Request $rqst, Response $rsp, array $args) {
        $response = array();
        $response["data"] = array();
        $data["logins"] = array();
      
        try {
	       $logins = getAllUserLogins();
	       foreach($logins as $login){
	           $tmp = array();
	           if (strtotime ($this->utc_time) > strtotime($login["lgn_token_valid_till"])){
	               $tmp["user_id"] = $login["lgn_usr_id"];
	               $tmp["expired"] = updateExpiredLoginStatus($login["lgn_id"], $login["lgn_usr_id"], $login["lgn_token"], $this->utc_time)["changed"];
	               array_push ($data["logins"], $tmp);
	           }
	       }
		} catch(Exception $e) {
			$print=$this->error_response;
			$rsp = $print($rsp, "MySQLException", "Error occurred in MySQL.", $e);
			return $rsp;
        }
		$response["data"] = $data;
        $print = $this->data_response;
        $rsp = $print($rsp, $response, "CronSuccessful", "Cron executed successfully and Following user's logins got expired as on ".$this->utc_time);
        return $rsp;
    });
});

function getAllUserLogins() {
	global $mysqli;
	$query = "SELECT `lgn_id`, `lgn_usr_id`, `lgn_token`, `lgn_token_valid_till` FROM `tbl_user_logins` WHERE `lgn_token_status` = 1";
	return $mysqli->query($query)->fetchAll("assoc");
}

function updateExpiredLoginStatus($login_id, $user_id, $login_token, $datetime){
	$rsp = array();
	global $mysqli;
	$query = "UPDATE `tbl_user_logins` SET `lgn_token_status` = 0, `lgn_modified_at` = ? WHERE `lgn_id` = ? AND `lgn_usr_id` = ? AND `lgn_token` = ?";
	$update = $mysqli->query($query, [$datetime, $login_id, $user_id, $login_token], "siis");
	$rsp["affected_rows"] = $update->affectedRows();
    $rsp["rows_matched"] = $update->info()["Rows matched"];
    $rsp["changed"] = $update->info()["Changed"];
    $rsp["warnings"] = $update->info()["Warnings"];
    return $rsp;
}