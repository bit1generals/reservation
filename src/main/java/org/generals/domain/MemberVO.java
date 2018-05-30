package org.generals.domain;

import java.util.Date;

import lombok.Data;


@Data
public class MemberVO {
	private String id, mname, pw, email;
	private Date regdate, updatedate;
}
