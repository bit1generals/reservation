package org.generals.domain;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReserveVO {

	private Long rno, hno;
	private String id, state, message, type;
	
	private HallVO hallVO;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH")
	private Date reservedate;
	private Date regdate, updatedate;
	//@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH")
	private Timestamp startTime, endTime;

	private List<ArticleVO> articleList;

	public void setStartTime(String startTime) {
		this.startTime = Timestamp.valueOf(startTime);
	}

	public void setEndTime(String endTime) {
		this.endTime = Timestamp.valueOf(endTime);
	}

	public String getReservedate() {
		if (reservedate != null) {
			return new SimpleDateFormat("yyyy-MM-dd").format(this.reservedate);
		}
		return null;
	}

}
