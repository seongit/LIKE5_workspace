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
public class Sponsorship {

	private int sponNo;
	private int  memNo;
	private int smemNo;
	private int sponFee;
	private Date sponDate;
	private int sponCategory;
	private int refBoaNo;
	
	private ArrayList<Sponsorship> sponsorList;
		
}
