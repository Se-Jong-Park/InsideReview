package com.jeonju.movie.comm;

import java.security.SecureRandom;

public class PasswordUtil {
	public static String makeTempPassword() {
		final String ALPA = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		final String NUMBERS = "0123456789";
		
		String all = ALPA + NUMBERS;
		
		// 난수 생성 객체 생성. 랜던값을 꺼내와주는 객체 
		SecureRandom random = new SecureRandom();
		// 문자열 객체 생성
		StringBuffer sb = new StringBuffer();
		
		for (int i = 0; i < 6; i++) {
			sb.append(PasswordUtil.getRandomChar(all, random));
		}
			System.out.println("sb >> " + sb.toString());
			
			return sb.toString();
	}		
	
	private static String getRandomChar(String str, SecureRandom random) {
		return String.valueOf(str.charAt(random.nextInt(str.length())));
	}
}
