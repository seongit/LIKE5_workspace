package com.kh.like5.board.model.vo;

import java.util.ArrayList;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class Tag {
	
	private int tagNo;
	private String tagName;
	
	

	
	private ArrayList<Tag> tagList;



	public Tag(int tagNo, String tagName) {
		super();
		this.tagNo = tagNo;
		this.tagName = tagName;
	}
	
}