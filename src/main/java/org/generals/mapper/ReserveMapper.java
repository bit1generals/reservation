package org.generals.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.generals.domain.ArticleVO;
import org.generals.domain.Criteria;
import org.generals.domain.HallVO;
import org.generals.domain.ReserveVO;

public interface ReserveMapper {

	public List<HallVO> selectHall();
	
	public List<ArticleVO> selectArticle();
	
	public int insertReserve(ReserveVO vo);
	
	public int insertReserveArticle(@Param("articleList") List<ArticleVO> vo);
	
	public List<ReserveVO> selectTime(ReserveVO vo);
	
	public ArticleVO selectReserveArticle(@Param("reserveVO")ReserveVO vo, @Param("type")String type);
	
	public List<ReserveVO> selectReserveList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public ReserveVO getReserve(Long rno);

	public List<ArticleVO> selectArticleByRno(Long rno);
}

