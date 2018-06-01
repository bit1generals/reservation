package org.generals.domain;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ReserveVO {

	private Long rno, hno;
	private String id, state, message;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date reservedate;
	private Date regdate, updatedate;
	private Timestamp starttime, endtime;

	private List<ArticleVO> list;
	
	public void setStartTime(String starttime) {
		this.starttime = Timestamp.valueOf(starttime);
	}

	public void setEndTime(String endtime) {
		this.endtime = Timestamp.valueOf(endtime);
	}
	
	
}
