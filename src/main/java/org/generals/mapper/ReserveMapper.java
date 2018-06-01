package org.generals.mapper;

import java.util.List;

import org.generals.domain.ArticleVO;
import org.generals.domain.HallVO;
import org.generals.domain.ReserveVO;

public interface ReserveMapper {

	public List<HallVO> selectHall();
	
	public void insertReserve(ReserveVO vo);
	
	public void insertReserveArticle(ArticleVO vo);
	
	public List<ReserveVO> selectTime(ReserveVO vo);
}

