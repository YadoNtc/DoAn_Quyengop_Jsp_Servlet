package util;

import java.security.SecureRandom;

public class RandomString {
	
	 static final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
     static SecureRandom rnd = new SecureRandom();
     
     public String randomString(int length) {
    	 StringBuilder sb = new StringBuilder(length);
    	 for (int i = 0; i < length; i++) {
    		 sb.append(AB.charAt(rnd.nextInt(AB.length())));
    	 }
    	 return sb.toString();
     }
}
