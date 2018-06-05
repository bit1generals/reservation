package org.generals.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.generals.domain.ArticleVO;
import org.generals.domain.HallVO;
import org.generals.domain.ReserveVO;

public interface ReserveMapper {

	public List<HallVO> selectHall();
	
	public void insertReserve(ReserveVO vo);
	
	public void insertReserveArticle(@Param("articleList") List<ArticleVO> vo);
	
	public List<ReserveVO> selectTime(ReserveVO vo);
}

