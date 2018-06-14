package org.generals.service;

import java.util.List;

import org.generals.domain.ArticleVO;
import org.generals.domain.Criteria;
import org.generals.domain.HallVO;
import org.generals.domain.ReserveVO;
import org.generals.mapper.ReserveMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@Transactional
public class ReserveService {

	@Setter(onMethod_ = { @Autowired })
	private ReserveMapper mapper;

	public void insertReserve(ReserveVO vo) throws Exception {

		if (mapper.insertReserve(vo) != 1) {
			throw new Exception("Reservation Fail");	
		}
		if (vo.getArticleList() != null) {
			mapper.insertReserveArticle(vo.getArticleList());
		}
		
		
	}

	public List<HallVO> getHall() {
		log.info("============getMapper=================");
		log.info(mapper);
		log.info("get Hall...........................");
		return mapper.selectHall();
	}

	public List<ReserveVO> getTimeData(ReserveVO vo) {
		log.info("get Time Data........................");
		return mapper.selectTime(vo);
	}

	public List<ArticleVO> getArticle() {
		log.info("get Article........................");
		return mapper.selectArticle();
	}

	public ArticleVO getReserveArticle(ReserveVO vo, String type) {
		log.info("get Reserve Article........................");
		return mapper.selectReserveArticle(vo, type);
	}

	public List<ReserveVO> getList(Criteria cri) {
		return mapper.selectReserveList(cri);
	}
	
	public int getTotal(Criteria cri) {
		return mapper.getTotal(cri);
	}
	
	public ReserveVO getReserve(Long rno) {
		return mapper.getReserve(rno);
	}
	
	public List<ArticleVO> getArticleList(Long rno){
		return mapper.selectArticleByRno(rno);
	}
	
}
