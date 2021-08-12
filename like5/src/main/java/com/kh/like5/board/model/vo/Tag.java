package com.kh.like5.board.model.vo;

import java.util.ArrayList;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter @Setter
public class Tag {
	
	private int tagNo;
	private String tagName;
	
	private ArrayList<Tag> tagList;
	
}