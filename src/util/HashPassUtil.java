package util;

import org.apache.commons.codec.digest.DigestUtils;

public class HashPassUtil {
	
	/**
	 * Mã hóa dùng DigestUtil
	 */
	 public static String hashMd5(String pass) {
		 return DigestUtils.md5Hex(pass).toUpperCase();
	 }
	 


}
