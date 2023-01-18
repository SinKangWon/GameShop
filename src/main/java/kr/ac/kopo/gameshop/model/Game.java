package kr.ac.kopo.gameshop.model;

import lombok.Getter;
import lombok.Setter;

import java.text.SimpleDateFormat;
import java.util.Date;
@Getter
@Setter
public class Game {
    private int id;
    private String title;
    private int price;
    private Date regDate;
    private Date pubDate;
    private String memberId;
    private String publisherId;
    private String contents;
}
