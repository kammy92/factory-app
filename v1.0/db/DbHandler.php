<?php
class DbHandler {
	private $conn;
	function __construct() {
		require_once dirname(__FILE__) . '/DbConnect.php';
		$db = new DbConnect();
		$this->conn = $db->connect();
	}
	
	public function isValidApiKey($api_key) {
		if($api_key == 'ebaa3e8571444005cc0b609824e90dc8'){
			return true;
		} else {
			return false;
		}
	}

	public function isValidUserLoginKey($login_key) {
		$stmt = $this->conn->prepare("SELECT usr_id FROM `tbl_users` WHERE usr_login_key = ?");
		$stmt->bind_param("s", $login_key);
		$stmt->execute();
		$stmt->store_result();
		$num_rows = $stmt->num_rows;
		$stmt->close();
		return $num_rows > 0;
	}

	public function getUserId($login_key) {
		$stmt = $this->conn->prepare("SELECT usr_id FROM `tbl_users` WHERE usr_login_key = ?");
		$stmt->bind_param("s", $login_key);
		if ($stmt->execute()) {
			$stmt->bind_result($user_id);
			$stmt->fetch();
			$stmt->close();
			return $user_id;
		} else {
			return NULL;
		}
	}
	
	public function validateAdminLogin($login_id, $login_password){
		$stmt = $this->conn->prepare("SELECT `usr_login_pass` FROM `tbl_users` WHERE `usr_login_id` = ? AND `usr_status` = 1 AND `usr_type` = 1");
		$stmt->bind_param("s", $login_id);
		if ($stmt->execute()) {
			$stmt->store_result();
			$stmt->bind_result($password_db);
			$num_rows = $stmt->num_rows;
			$stmt->fetch();
			$stmt->close();
			
			if($num_rows){
				if(strcmp($login_password, $password_db) == 0){
					return 1;
				} else {
					return 2;
				}
			} else {
				return 0;
			}
		}
	}

	
	public function validateUserLogin($login_id, $login_password){
		$stmt = $this->conn->prepare("SELECT `usr_login_pass` FROM `tbl_users` WHERE `usr_login_id` = ? AND `usr_status` = 1 AND `usr_type` = 0");
		$stmt->bind_param("s", $login_id);
		if ($stmt->execute()) {
			$stmt->store_result();
			$stmt->bind_result($password_db);
			$num_rows = $stmt->num_rows;
			$stmt->fetch();
			$stmt->close();
			
			if($num_rows){
				if(strcmp($login_password, $password_db) == 0){
					return 1;
				} else {
					return 2;
				}
			} else {
				return 0;
			}
		}
	}

	public function getUserDetails2($login_id) {
		$response = array();
		$stmt = $this->conn->prepare("SELECT `usr_id`, `usr_name`, `usr_mobile`, `usr_login_key`, `usr_status` FROM `tbl_users` WHERE `usr_login_id` = ?");
		$stmt->bind_param("s", $login_id);
		if ($stmt->execute()) {
			$stmt->bind_result($response["user_id"], $response["user_name"], $response["user_mobile"], $response["user_login_key"], $response["user_status"]);
			$stmt->fetch();
			$stmt->close();
			return $response;
		} else {
			return NULL;
		}
	}
	
	public function updateUserDetail($name, $mobile, $status){
		$newdt = getTimestamp();
		$stmt = $this->conn->prepare("UPDATE `tbl_surveys` SET `srvy_status` = 1, `srvy_started_at` = ? WHERE `srvy_id` = ?");
		$stmt->bind_param("si", $newdt, $survey_id);
		if ($stmt->execute()) {
			$stmt->fetch();
			$stmt->close();
			return 1;
		} else {
			return NULL;
		}
	}
	
	public function isUserSurveyExist($user_id, $product_id) {
		$response = array();
		$stmt = $this->conn->prepare("SELECT * FROM `tbl_surveys` WHERE `srvy_usr_id` = ? AND `srvy_prdct_id` = ? AND `srvy_status` IN (0,1,2)");
		$stmt->bind_param("ii", $user_id, $product_id);
		$stmt->execute();
		$stmt->store_result();
		$num_rows = $stmt->num_rows;
		$stmt->close();
		return $num_rows > 0;
	}

	public function isUserSurveyExist2($user_id, $survey_number) {
		$response = array();
		$stmt = $this->conn->prepare("SELECT * FROM `tbl_surveys` WHERE `srvy_usr_id` = ? AND `srvy_number` = ?");
		$stmt->bind_param("is", $user_id, $survey_number);
		$stmt->execute();
		$stmt->store_result();
		$num_rows = $stmt->num_rows;
		$stmt->close();
		return $num_rows > 0;
	}

	public function getSurveyDetails2($user_id, $survey_number) {
		$response = array();
		$stmt = $this->conn->prepare("SELECT * FROM `tbl_surveys` INNER JOIN `tbl_products` ON `prdct_id` = `srvy_prdct_id` WHERE `srvy_usr_id` = ? AND `srvy_number` = ?");
		$stmt->bind_param("is", $user_id, $survey_number);
		$stmt->execute();
		$result = getResult($stmt);
		$stmt->close();
		return $result;
	}

	public function insertSurvey($user_id, $product_id){
		$newdt = getTimestamp();
	
	    $characters2 = '0123456789';
        $randomString2 = '';
        for ($i = 0; $i < 8; $i++) {
        	$randomString2 .= $characters2[rand(0, strlen($characters2) - 1)];
        }

	    $survey_number = "PK".$randomString2;

		$stmt = $this->conn->prepare("INSERT INTO `tbl_surveys`(`srvy_number`, `srvy_prdct_id`, `srvy_usr_id`, `srvy_status`, `srvy_created_at`) VALUES (?,?,?,0,?)");
		$stmt->bind_param("siis", $survey_number, $product_id, $user_id, $newdt);
		if ($stmt->execute()) {
			$survey_id = $stmt->insert_id;
    		$stmt->fetch();
			$stmt->close();
            return $survey_id;
		} else {
			return NULL;
		}
	}

	public function getSurveyDetails($survey_id) {
		$stmt = $this->conn->prepare("SELECT * FROM `tbl_surveys` INNER JOIN `tbl_users` ON `usr_id` = `srvy_usr_id` INNER JOIN `tbl_products` ON `prdct_id` = `srvy_prdct_id` WHERE `srvy_id` = ?");
		$stmt->bind_param("i", $survey_id);
		$stmt->execute();
		$result = getResult($stmt);
		$stmt->close();
		return $result;
	}

	public function getAllSurveys() {
		$stmt = $this->conn->prepare("SELECT * FROM `tbl_surveys` INNER JOIN `tbl_users` ON `usr_id` = `srvy_usr_id` INNER JOIN `tbl_products` ON `prdct_id` = `srvy_prdct_id`");
		$stmt->execute();
		$result = getResult($stmt);
		$stmt->close();
		return $result;
	}


	public function startSurvey($user_id, $survey_id){
		$newdt = getTimestamp();
		$stmt = $this->conn->prepare("UPDATE `tbl_surveys` SET `srvy_status` = 1, `srvy_started_at` = ? WHERE `srvy_id` = ?");
		$stmt->bind_param("si", $newdt, $survey_id);
		if ($stmt->execute()) {
			$stmt->fetch();
			$stmt->close();
			return 1;
		} else {
			return NULL;
		}
	}
	
	public function getSurveyDayElapsed($survey_id) {
		$stmt = $this->conn->prepare("SELECT `srvy_days_elapsed` FROM `tbl_surveys` WHERE `srvy_id` = ?");
		$stmt->bind_param("i", $survey_id);
		if ($stmt->execute()) {
			$stmt->bind_result($days_elapsed);
			$stmt->fetch();
			$stmt->close();
			return $days_elapsed;
		} else {
			return NULL;
		}
	}
	
	public function getSurveyStatus($survey_id) {
		$stmt = $this->conn->prepare("SELECT `srvy_status` FROM `tbl_surveys` WHERE `srvy_id` = ?");
		$stmt->bind_param("i", $survey_id);
		if ($stmt->execute()) {
			$stmt->bind_result($survey_status);
			$stmt->fetch();
			$stmt->close();
			return $survey_status;
		} else {
			return NULL;
		}
	}
	
	public function isSurveyConclusionDone($survey_id) {
		$stmt = $this->conn->prepare("SELECT * FROM `tbl_surveys` WHERE `srvy_id` = ? AND `srvy_conclusion` = 1");
		$stmt->bind_param("i", $survey_id);
		$stmt->execute();
		$stmt->store_result();
		$num_rows = $stmt->num_rows;
		$stmt->close();
		return $num_rows > 0;
	}
	
	public function isSurveyLabReportDone($survey_id) {
		$stmt = $this->conn->prepare("SELECT * FROM `tbl_surveys` WHERE `srvy_id` = ? AND `srvy_lab_report` = 1");
		$stmt->bind_param("i", $survey_id);
		$stmt->execute();
		$stmt->store_result();
		$num_rows = $stmt->num_rows;
		$stmt->close();
		return $num_rows > 0;
	}
	
	public function updateSurveyStatus($survey_id ){
		$newdt = getTimestamp();
		$stmt = $this->conn->prepare("UPDATE `tbl_surveys` SET `srvy_status` = 1, `srvy_started_at` = ? WHERE `srvy_id` = ?");
		$stmt->bind_param("si", $newdt, $survey_id);
		if ($stmt->execute()) {
			$stmt->fetch();
			$stmt->close();
			return 1;
		} else {
			return NULL;
		}
	}
	
	public function insertDailyResponse ($survey_id, $day_number, $date, $answer_1, $answer_2, $answer_3, $answer_4, $answer_5, $answer_5a, $answer_5b, $answer_5c, $answer_5d, $answer_6, $answer_6a, $answer_6b, $answer_6c, $answer_6d, $answer_7, $answer_7a, $answer_7b, $answer_7c, $answer_8, $answer_8a, $answer_8b) {
		$newdt = getTimestamp();
		$stmt = $this->conn->prepare("INSERT INTO `tbl_responses`(`rspns_srvy_id`, `rspns_day_number`, `rspns_date`, `rspns_type`, `rspns_answer_1`, `rspns_answer_2`, `rspns_answer_3`, `rspns_answer_4`, `rspns_answer_5`, `rspns_answer_5a`, `rspns_answer_5b`, `rspns_answer_5c`, `rspns_answer_5d`, `rspns_answer_6`, `rspns_answer_6a`, `rspns_answer_6b`, `rspns_answer_6c`, `rspns_answer_6d`, `rspns_answer_7`, `rspns_answer_7a`, `rspns_answer_7b`, `rspns_answer_7c`, `rspns_answer_8`, `rspns_answer_8a`, `rspns_answer_8b`, `rspns_created_at`) VALUES (?,?,?,1,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		$stmt->bind_param("iisssssssssssssssssssssss", $survey_id, $day_number, $date, $answer_1, $answer_2, $answer_3, $answer_4, $answer_5, $answer_5a, $answer_5b, $answer_5c, $answer_5d, $answer_6, $answer_6a, $answer_6b, $answer_6c, $answer_6d, $answer_7, $answer_7a, $answer_7b, $answer_7c, $answer_8, $answer_8a, $answer_8b, $newdt);
		if ($stmt->execute()) {
			$response_id = $stmt->insert_id;
    		$stmt->fetch();
			$stmt->close();
			
			if($day_number == 7){
				$stmt2 = $this->conn->prepare("UPDATE `tbl_surveys` SET `srvy_days_elapsed` = ?, `srvy_status` = 2 WHERE `srvy_id` = ?");
			} else{
				$stmt2 = $this->conn->prepare("UPDATE `tbl_surveys` SET `srvy_days_elapsed` = ? WHERE `srvy_id` = ?");
			}
			$stmt2->bind_param("ii", $day_number, $survey_id);
			if ($stmt2->execute()) {
				$stmt2->fetch();
				$stmt2->close();
				return $response_id;
			} else {
				return NULL;
			}
		} else {
			return NULL;
		}
	}

	public function insertConclusionResponse ($survey_id, $date, $answer_9, $answer_9a, $answer_9b, $answer_9c, $answer_9d, $answer_9e, $answer_9f) {
		$newdt = getTimestamp();
		$stmt = $this->conn->prepare("INSERT INTO `tbl_responses`(`rspns_srvy_id`, `rspns_date`, `rspns_type`, `rspns_answer_9`, `rspns_answer_9a`, `rspns_answer_9b`, `rspns_answer_9c`, `rspns_answer_9d`, `rspns_answer_9e`, `rspns_answer_9f`, `rspns_created_at`) VALUES (?,?,2,?,?,?,?,?,?,?,?)");
		$stmt->bind_param("isssssssss", $survey_id, $date, $answer_9, $answer_9a, $answer_9b, $answer_9c, $answer_9d, $answer_9e, $answer_9f, $newdt);
		if ($stmt->execute()) {
			$response_id = $stmt->insert_id;
    		$stmt->fetch();
			$stmt->close();
			
			$stmt2 = $this->conn->prepare("UPDATE `tbl_surveys` SET `srvy_status` = 3, `srvy_conclusion` = 1 WHERE `srvy_id` = ?");
			$stmt2->bind_param("i", $survey_id);
			if ($stmt2->execute()) {
				$stmt2->fetch();
				$stmt2->close();
				return $response_id;
			} else {
				return NULL;
			}
		} else {
			return NULL;
		}
	}

	public function insertLabResponse ($survey_id, $date, $answer_10, $answer_11, $answer_12, $answer_13, $answer_13a) {
		$newdt = getTimestamp();
		$stmt = $this->conn->prepare("INSERT INTO `tbl_responses`(`rspns_srvy_id`, `rspns_date`, `rspns_type`, `rspns_answer_10`, `rspns_answer_11`, `rspns_answer_12`, `rspns_answer_13`, `rspns_answer_13a`, `rspns_created_at`) VALUES (?,?,3,?,?,?,?,?,?)");
		$stmt->bind_param("isssssss", $survey_id, $date, $answer_10, $answer_11, $answer_12, $answer_13, $answer_13a, $newdt);
		if ($stmt->execute()) {
			$response_id = $stmt->insert_id;
    		$stmt->fetch();
			$stmt->close();
			
			$stmt2 = $this->conn->prepare("UPDATE `tbl_surveys` SET `srvy_status` = 4, `srvy_lab_report` = 1, `srvy_completed_at` = ? WHERE `srvy_id` = ?");
			$stmt2->bind_param("si", $newdt, $survey_id);
			if ($stmt2->execute()) {
				$stmt2->fetch();
				$stmt2->close();
				return $response_id;
			} else {
				return NULL;
			}
		} else {
			return NULL;
		}
	}

	
	public function getSurveyResponses($survey_id) {
		$stmt = $this->conn->prepare("SELECT * FROM `tbl_responses` WHERE `rspns_srvy_id` = ?");
		$stmt->bind_param("i", $survey_id);
		$stmt->execute();
		$result = getResult($stmt);
		$stmt->close();
		return $result;
	}


	public function isUserExist($user_mobile){
		$stmt = $this->conn->prepare("SELECT `usr_id` FROM `tbl_users` WHERE `usr_mobile` = ?");
		$stmt->bind_param("s", $user_mobile);
		$stmt->execute();
		$stmt->store_result();
		$num_rows = $stmt->num_rows;
		$stmt->close();
		return $num_rows > 0;
	}
	
	public function isUserExist2($login_id){
		$stmt = $this->conn->prepare("SELECT `usr_id` FROM `tbl_users` WHERE `usr_login_id` = ?");
		$stmt->bind_param("s", $login_id);
		$stmt->execute();
		$stmt->store_result();
		$num_rows = $stmt->num_rows;
		$stmt->close();
		return $num_rows > 0;
	}

	public function insertUser($name, $mobile, $password){
		$newdt = getTimestamp();
	
		$login_key = md5($newdt.$mobile);
	   
		$stmt = $this->conn->prepare("INSERT INTO `tbl_users`(`usr_name`, `usr_mobile`, `usr_login_id`, `usr_login_pass`, `usr_login_key`, `usr_status`, `usr_created_at`) VALUES (?,?,?,?,?,1,?)");
		$stmt->bind_param("ssssss", $name, $mobile, $mobile, $password, $login_key, $newdt);
		if ($stmt->execute()) {
			$user_id = $stmt->insert_id;
    		$stmt->fetch();
			$stmt->close();
            return $user_id;
		} else {
			return NULL;
		}
	}
	
	public function insertUser2($login_id, $login_pass){
		$newdt = getTimestamp();
		$login_key = md5($newdt.$login_id);
		$stmt = $this->conn->prepare("INSERT INTO `tbl_users`(`usr_login_id`, `usr_login_pass`, `usr_login_key`, `usr_status`, `usr_created_at`) VALUES (?,?,?,1,?)");
		$stmt->bind_param("ssss", $login_id, $login_pass, $login_key, $newdt);
		if ($stmt->execute()) {
			$user_id = $stmt->insert_id;
    		$stmt->fetch();
			$stmt->close();
            return $user_id;
		} else {
			return NULL;
		}
	}
	
	public function getUserDetails3($user_id) {
		$response = array();
		$stmt = $this->conn->prepare("SELECT `usr_id`, `usr_name`, `usr_mobile`, `usr_login_id`, `usr_login_pass`, `usr_status` FROM `tbl_users` WHERE `usr_id` = ?");
		$stmt->bind_param("i", $user_id);
		if ($stmt->execute()) {
			$stmt->bind_result($response["user_id"], $response["user_name"], $response["user_mobile"], $response["user_login_id"], $response["user_login_pass"], $response["user_status"]);
			$stmt->fetch();
			$stmt->close();
			return $response;
		} else {
			return NULL;
		}
	}
	
	public function getAllUsers() {
//		$stmt = $this->conn->prepare("SELECT * FROM `tbl_users` WHERE `usr_type` = 0 ORDER BY `usr_id` DESC");
		$stmt = $this->conn->prepare("SELECT * FROM `tbl_users` WHERE `usr_type` = 0 ORDER BY `usr_id` ASC");
		$stmt->execute();
		$result = getResult($stmt);
		$stmt->close();
		return $result;
	}

	public function isProductExist($product_code){
		$stmt = $this->conn->prepare("SELECT * FROM `tbl_products` WHERE `prdct_code` = ?");
		$stmt->bind_param("s", $product_code);
		$stmt->execute();
		$stmt->store_result();
		$num_rows = $stmt->num_rows;
		$stmt->close();
		return $num_rows > 0;
	}
	
	public function insertProduct($product_code){
		$newdt = getTimestamp();
		$stmt = $this->conn->prepare("INSERT INTO `tbl_products`(`prdct_code`, `prdct_status`, `prdct_created_at`) VALUES (?,1,?)");
		$stmt->bind_param("ss", $product_code, $newdt);
		if ($stmt->execute()) {
			$product_id = $stmt->insert_id;
    		$stmt->fetch();
			$stmt->close();
            return $product_id;
		} else {
			return NULL;
		}
	}

	public function getProductDetails($product_id) {
		$response = array();
		$stmt = $this->conn->prepare("SELECT `prdct_id`, `prdct_code`, `prdct_status` FROM `tbl_products` WHERE `prdct_id` = ?");
		$stmt->bind_param("i", $product_id);
		if ($stmt->execute()) {
			$stmt->bind_result($response["product_id"], $response["product_code"], $response["product_status"]);
			$stmt->fetch();
			$stmt->close();
			return $response;
		} else {
			return NULL;
		}
	}
	
	public function getAllProducts() {
		$stmt = $this->conn->prepare("SELECT * FROM `tbl_products` ORDER BY `prdct_id` DESC");
		$stmt->execute();
		$result = getResult($stmt);
		$stmt->close();
		return $result;
	}
	
	public function updateProduct($product_id, $product_status) {
		$stmt2 = $this->conn->prepare("UPDATE `tbl_products` SET `prdct_status` = ? WHERE `prdct_id` = ?");
		$stmt2->bind_param("ii", $product_status, $product_id);
		if ($stmt2->execute()) {
			$stmt2->fetch();
			$stmt2->close();
			return 1;
		} else {
			return NULL;
		}
	}

	public function getAllActiveSearchedProducts($product_code) {
		$stmt = $this->conn->prepare("SELECT * FROM `tbl_products` WHERE `prdct_code` LIKE '%".$product_code."%' AND `prdct_status` = 1");
		$stmt->execute();
		$result = getResult($stmt);
		$stmt->close();
		return $result;
	}

	public function getAllActiveSearchedUsers($search) {
		$stmt = $this->conn->prepare("SELECT * FROM `tbl_users` WHERE (`usr_name` LIKE '%".$search."%' OR `usr_mobile` LIKE '%".$search."%') AND `usr_status` = 1 AND `usr_type` = 0");
		$stmt->execute();
		$result = getResult($stmt);
		$stmt->close();
		return $result;
	}
	
	public function getAllSearchedSurvey($search) {
		$stmt = $this->conn->prepare("SELECT * FROM `tbl_surveys` INNER JOIN `tbl_users` ON `usr_id` = `srvy_usr_id` INNER JOIN `tbl_products` ON `prdct_id` = `srvy_prdct_id` WHERE `srvy_number` LIKE '%".$search."%' OR `usr_name` LIKE '%".$search."%' OR `usr_mobile` LIKE '%".$search."%' OR `prdct_code` LIKE '%".$search."%'");
		$stmt->execute();
		$result = getResult($stmt);
		$stmt->close();
		return $result;
	}
	
	
	
	public function isOpenSurveyExist($user_id, $product_id) {
		$response = array();
		$stmt = $this->conn->prepare("SELECT * FROM `tbl_surveys` WHERE `srvy_usr_id` = ? AND `srvy_prdct_id` = ? AND `srvy_status` IN (0,1,2) ORDER BY `srvy_created_at` DESC LIMIT 1");
		$stmt->bind_param("ii", $user_id, $product_id);
		$stmt->execute();
		$stmt->store_result();
		$num_rows = $stmt->num_rows;
		$stmt->close();
		return $num_rows > 0;
	}

	public function getOpenSurveyDetails($user_id, $product_id) {
		$stmt = $this->conn->prepare("SELECT * FROM `tbl_surveys` INNER JOIN `tbl_users` ON `usr_id` = `srvy_usr_id` INNER JOIN `tbl_products` ON `prdct_id` = `srvy_prdct_id` WHERE `srvy_usr_id` = ? AND `srvy_prdct_id` = ? AND `srvy_status` IN (0,1,2) ORDER BY `srvy_created_at` DESC LIMIT 1");
		$stmt->bind_param("ii", $user_id, $product_id);
		$stmt->execute();
		$result = getResult($stmt);
		$stmt->close();
		return $result;
	}

	public function abandonSurvey($survey_id) {
		$stmt2 = $this->conn->prepare("UPDATE `tbl_surveys` SET `srvy_status` = 5 WHERE `srvy_id` = ?");
		$stmt2->bind_param("i", $survey_id);
		if ($stmt2->execute()) {
			$stmt2->fetch();
			$stmt2->close();
			return 1;
		} else {
			return NULL;
		}
	}
	
	
	public function getCourseProducts($user_id) {
		$stmt = $this->conn->prepare("SELECT *, (SELECT `prdct_code` FROM `tbl_products` WHERE `prdct_id` = `wk_1_prdct_id`) AS `week_1`, (SELECT `prdct_code` FROM `tbl_products` WHERE `prdct_id` = `wk_2_prdct_id`) AS `week_2`, (SELECT `prdct_code` FROM `tbl_products` WHERE `prdct_id` = `wk_3_prdct_id`) AS `week_3`, (SELECT `prdct_code` FROM `tbl_products` WHERE `prdct_id` = `wk_4_prdct_id`) AS `week_4`, (SELECT `prdct_code` FROM `tbl_products` WHERE `prdct_id` = `wk_5_prdct_id`) AS `week_5`, (SELECT `prdct_code` FROM `tbl_products` WHERE `prdct_id` = `wk_6_prdct_id`) AS `week_6` FROM `tbl_user_weeks` WHERE `wk_usr_id` = ?");
		$stmt->bind_param("i", $user_id);
		$stmt->execute();
		$result = getResult($stmt);
		$stmt->close();
		return $result;
	}
	
	public function insertUserWeeks($user_id, $week_1, $week_2, $week_3, $week_4, $week_5, $week_6) {
		$stmt = $this->conn->prepare("INSERT INTO `tbl_user_weeks`(`wk_usr_id`, `wk_1_prdct_id`, `wk_2_prdct_id`, `wk_3_prdct_id`, `wk_4_prdct_id`, `wk_5_prdct_id`, `wk_6_prdct_id`) VALUES (?,?,?,?,?,?,?)");
		$stmt->bind_param("iiiiiii", $user_id, $week_1, $week_2, $week_3, $week_4, $week_5, $week_6);
		if ($stmt->execute()) {
			$week_id = $stmt->insert_id;
    		$stmt->fetch();
			$stmt->close();
            return $week_id;
		} else {
			return NULL;
		}
	}
	
	public function updateUserWeeks($user_id, $week_1, $week_2, $week_3, $week_4, $week_5, $week_6){
		$newdt = getTimestamp();
		$stmt = $this->conn->prepare("UPDATE `tbl_user_weeks` SET `wk_1_prdct_id` = ?, `wk_2_prdct_id` = ?, `wk_3_prdct_id` = ?, `wk_4_prdct_id` = ?, `wk_5_prdct_id` = ?, `wk_6_prdct_id` = ? WHERE `wk_usr_id` = ?");
		$stmt->bind_param("iiiiiii", $week_1, $week_2, $week_3, $week_4, $week_5, $week_6, $user_id);
		if ($stmt->execute()) {
			$stmt->fetch();
			$stmt->close();
			return 1;
		} else {
			return NULL;
		}
	}
	
	
	
	
	public function getUserID2($login_id) {
		$stmt = $this->conn->prepare("SELECT usr_id FROM `tbl_users` WHERE usr_login_id = ?");
		$stmt->bind_param("s", $login_id);
		if ($stmt->execute()) {
			$stmt->bind_result($user_id);
			$stmt->fetch();
			$stmt->close();
			return $user_id;
		} else {
			return NULL;
		}
	}
	
	

	public function getProductId($product_code) {
		$stmt = $this->conn->prepare("SELECT `prdct_id` FROM `tbl_products` WHERE `prdct_code` = ?");
		$stmt->bind_param("s", $product_code);
		if ($stmt->execute()) {
			$stmt->bind_result($product_id);
			$stmt->fetch();
			$stmt->close();
			return $product_id;
		} else {
			return NULL;
		}
	}

	public function updateUserLoginPass($user_id, $login_pass) {
		$stmt2 = $this->conn->prepare("UPDATE `tbl_users` SET `usr_login_pass` = ? WHERE `usr_id` = ?");
		$stmt2->bind_param("si", $login_pass, $user_id);
		if ($stmt2->execute()) {
			$stmt2->fetch();
			$stmt2->close();
			return 1;
		} else {
			return NULL;
		}
	}

	




	public function getUserDetails($mobile) {
		$response = array();
		$stmt = $this->conn->prepare("SELECT `usr_id`, `usr_name`, `usr_mobile`, `usr_login_key`, `usr_active` FROM `tbl_users` WHERE `usr_mobile` = ?");
		$stmt->bind_param("s", $mobile);
		if ($stmt->execute()) {
			$stmt->bind_result($response["user_id"], $response["user_name"], $response["user_mobile"], $response["user_login_key"], $response["user_active"]);
			$stmt->fetch();
			$stmt->close();
			return $response;
		} else {
			return NULL;
		}
	}


	public function isSurveyExist($product_code){
		$stmt = $this->conn->prepare("SELECT * FROM `tbl_products` WHERE `prdct_code` = ?");
		$stmt->bind_param("s", $product_code);
		$stmt->execute();
		$stmt->store_result();
		$num_rows = $stmt->num_rows;
		$stmt->close();
		return $num_rows > 0;
	}


	

	

	public function updateAppVersionInUserTable($user_id, $app_version){
		$newdt = getTimestamp();
		$stmt2 = $this->conn->prepare("UPDATE `tbl_users` SET `usr_app_version`= ?, `usr_last_login_at` = ? WHERE `usr_id` = ?");
		$stmt2->bind_param("ssi", $app_version, $newdt, $user_id);
		$stmt2->execute();
		$stmt2->store_result();
		$num_rows2 = $stmt2->num_rows;
		$stmt2->close();
	}

	public function getCurrentAppVersion($device) {
		$response = array();
		$stmt = $this->conn->prepare("SELECT `app_vrsn_code`, `app_vrsn_changes` FROM `tbl_app_versions` WHERE `app_vrsn_device` = ? AND `app_vrsn_active` = 1 ORDER BY app_vrsn_updated_on DESC LIMIT 1");
		$stmt->bind_param("s", $device);
		if ($stmt->execute()) {
			$stmt->bind_result($response["version_code"], $response["version_changes"]);
			$stmt->fetch();
			$stmt->close();
			return $response;
		} else {
			return NULL;
		}
	}



	
	
	

	
	public function getAllFirebaseIds(){
		$stmt2 = $this->conn->prepare("SELECT `usr_firebase_id` FROM `tbl_users` WHERE `usr_firebase_id` <> ''");
		$stmt2->execute();
		$result = getResult($stmt2);
		$stmt2->close();
		return $result;
	}
	
	public function getTestFirebaseIds(){
		$stmt2 = $this->conn->prepare("SELECT `usr_firebase_id` FROM `tbl_users` WHERE `usr_id` IN (1)");
		$stmt2->execute();
		$result = getResult($stmt2);
		$stmt2->close();
		return $result;
	}
}

function getResult($stmt){
	return $stmt->get_result();
}

function getTimestamp(){
//	date_default_timezone_set("Asia/Kolkata");
	date_default_timezone_set("America/Denver");
	$dt = new DateTime();
	$newdt = $dt->format('Y-m-d H:i:s');
	return $newdt;
}
?>