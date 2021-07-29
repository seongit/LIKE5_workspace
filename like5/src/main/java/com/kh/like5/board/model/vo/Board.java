package com.kh.like5.board.model.vo;

import lombok.Data;

import java.sql.Date;

@Data
public class Board {

    private int bno;
    private int mno;
    private String category;
    private String status;
    private String title;
    private String content;
    private Date enrollDate;
    private Date updateDate;
    private int count;
    private int like;
    private int scrap;
    private String tag;
    private String imgPath;
    private String nickname; // 사용자 닉네임

}
