package org.generals.domain;

import java.util.List;

import lombok.Data;

@Data
public class ArticleVO {

	private Long rno;
	private String aname, type;
	private int count;
	private List<String> serials;
	
}
