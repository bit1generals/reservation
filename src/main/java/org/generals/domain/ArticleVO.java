package org.generals.domain;

import lombok.Data;

@Data
public class ArticleVO {

	private Long rno;
	private String aname, serial, type;
	private int count;
}
