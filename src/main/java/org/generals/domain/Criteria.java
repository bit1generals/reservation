package org.generals.domain;

import java.net.URLDecoder;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Data
@Log4j
public class Criteria {

	private int page;
	private String type,btype;
	private String keyword;
	//페이지 당 게시글 수
	public static final int perPageCount = 10;

	public Criteria() {
		this.page = 1;
	}

	public Criteria(int page) {
		this.page = page < 0 ? 1 : page;
	}

	public int getSkip() {
		return (this.page-1)*perPageCount;
	}
	
	public String[] getArr() {
		log.info("getARR-------------------------------"+this.type.split("-").toString());
		return this.type.split("-");
	}
	
	public String getKeyword() {
		log.info("getKeyword---------------------------------"+this.keyword);
		return this.keyword;
	}
	

	
}
