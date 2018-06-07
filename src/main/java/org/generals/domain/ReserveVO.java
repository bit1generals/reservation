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

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH")
	private Date reservedate;
	private Date regdate, updatedate;
	//@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH")
	private Timestamp starttime, endtime;

	private List<ArticleVO> articleList;

	public void setStarttime(String starttime) {
		this.starttime = Timestamp.valueOf(starttime);
	}

	public void setEndtime(String endtime) {
		this.endtime = Timestamp.valueOf(endtime);
	}

	public String getReservedate() {
		if (reservedate != null) {
			return new SimpleDateFormat("yyyy-MM-dd").format(this.reservedate);
		}
		return null;
	}

}
