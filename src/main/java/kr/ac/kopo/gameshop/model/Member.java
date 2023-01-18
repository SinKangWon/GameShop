package kr.ac.kopo.gameshop.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;
@Getter
@Setter
public class Member {
    private String id;
    private String passwd;
    private String name;
    private Date regDate;

}
