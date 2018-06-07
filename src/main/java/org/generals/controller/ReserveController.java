package org.generals.controller;

import java.util.List;

import org.generals.domain.ArticleVO;
import org.generals.domain.ReserveVO;
import org.generals.service.ReserveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class ReserveController {
	

	@Setter(onMethod_ = { @Autowired })
	private ReserveService service;
	
	@PostMapping(value = "/reserve/timeData", produces = "application/json")
	public ResponseEntity<List<ReserveVO>> getTimeData(@RequestBody ReserveVO vo) {
		log.info("getTimeData call......");
		log.info("vo : "+vo);
		vo.setState("D");
		List<ReserveVO> timeDataList = service.getTimeData(vo);
		return new ResponseEntity<List<ReserveVO>>(timeDataList, HttpStatus.OK);
	}
	
	@PostMapping(value = "/reserve/articleData", produces = "application/json")
	public ResponseEntity<ArticleVO> getArticleData(@RequestBody ReserveVO vo) {
		log.info("getArticleData call........");
		log.info("vo : "+vo);
		log.info("type : "+ vo.getType());
		vo.setState("D");
		ArticleVO articleVO = service.getReserveArticle(vo, vo.getType());
		return new ResponseEntity<ArticleVO>(articleVO, HttpStatus.OK);
	}
	
}
