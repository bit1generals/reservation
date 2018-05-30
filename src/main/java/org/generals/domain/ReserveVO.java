package org.generals.domain;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ReserveVO {

	private Long rno, hno;
	private String id, state;
	private Date reservedate, regdate, updatedate;
	private Time startTime, endTime;
	
	private List<ArticleVO> list;
}
