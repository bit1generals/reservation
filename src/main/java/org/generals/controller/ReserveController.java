package org.generals.controller;

import org.generals.domain.ReserveVO;
import org.generals.service.ReserveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/reserve")
@Log4j
public class ReserveController {
	
	
	@Setter(onMethod_ = { @Autowired })
	private ReserveService service;
	
	
	
	@GetMapping
	public void reserve(Model model) {
		log.info("reserve()... call");
		model.addAttribute("hallList", service.getHall());
		model.addAttribute("articleList", service.getArticle());
	}
	
	@PostMapping
	public void reservePost(ReserveVO reserveVO) {
		log.info("reservePost()... call");
		log.info("reserveVO : " + reserveVO);
		reserveVO.setId("user10");
		reserveVO.setState("D");
		service.insertReserve(reserveVO);
	}
	
	
}
