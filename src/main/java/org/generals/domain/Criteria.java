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

	public Criteria() {
		this.page = 1;
	}

	public Criteria(int page) {
		this.page = page < 0 ? 1 : page;
	}

	public int getSkip() {
		return (this.page-1)*10;
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
