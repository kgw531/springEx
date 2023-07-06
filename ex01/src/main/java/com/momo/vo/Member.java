package com.momo.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data // 롬복이 제공 : 이 어노테이션을 쓰면 getter, setter, equals, toString 등의 메서드가 자동으로 생성

/**
 * Data 어노테이션
 * IDE(이클립스,STS)에 설치 후 롬복 라이브러리를 추가 후 사용가능
 * IDE에 설치가 되어 있지 않으면 어노테이션을 추가 해도 메서드가 생성되지 않을 수 있다.
 * Outline View를 통해 메서드가 생성되었는지 확인해주세요.
 */
public class Member {
	private String id;
	private String pw;
	private String name;
	private int age;
	
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date dueDate;
	
}
