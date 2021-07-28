package com.kh.like5.member.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class Member {
	
	private int memNo;
	private String email;
	private String memPwd;
	private String memName;
	private String nickName;
	private String memProfile;
	private String memCheck;
	private String bank;
	private String accountNum;
	private Date enrDate;
	private String userStatus;
	private String entYN;
	
	private ArrayList<Member> memList;
	

	
	
	
}
