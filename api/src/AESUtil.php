<?php
class AESUtil {
    //https://github.com/ChaoLiFL/PHP-Java-AES-Encrypt-Decrypt
    public static function encryptBase64($plaintext) {
        global $settings;
		$data = AESUtil::encrypt($plaintext, $settings["settings"]["encryption_key"]);
		$data = base64_encode($data);
		return $data; 
	}
	public static function encryptHexStr($plaintext) {
        global $settings;
		$data = AESUtil::encrypt($plaintext, $settings["settings"]["encryption_key"]);
		$data = bin2hex($data);
		return $data; 
	}
 
	public static function decryptBase64($ciphertext) {
        global $settings;
		$ciphertext = base64_decode($ciphertext);
		$plaintext = AESUtil::decrypt($ciphertext, $settings["settings"]["encryption_key"]);	
		return $plaintext; 
	}
	public static function decryptHexStr($ciphertext) {
        global $settings;
		$ciphertext = hex2bin($ciphertext);
		$plaintext = AESUtil::decrypt($ciphertext, $settings["settings"]["encryption_key"]);	
		return $plaintext; 
	}
	
	private static function encrypt($plaintext) {
        global $settings;
		return openssl_encrypt($plaintext, "aes-128-ecb", $settings["settings"]["encryption_key"], OPENSSL_RAW_DATA); 
	}
	
	private static function decrypt($ciphertext) {
        global $settings;
		return openssl_decrypt($ciphertext, "aes-128-ecb", $settings["settings"]["encryption_key"], OPENSSL_RAW_DATA); 
	}	
}
?>