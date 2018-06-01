package org.generals.controller;

import java.util.Locale;

import org.generals.domain.ReserveVO;
import org.generals.service.ReserveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class HomeController {
	
	
	@Setter(onMethod_ = { @Autowired })
	private ReserveService service;
	
	
	@GetMapping("/")
	public String home(Locale locale, Model model) {
		log.info("HomeController... call");
		return "index";
	}
	
	@GetMapping("/reserve")
	public void reserve(Model model) {
		log.info("reserve()... call");
		model.addAttribute("hallList", service.getHall());
	}
	
	@PostMapping("/reserve")
	public void reservePost(ReserveVO reserveVO) {
		log.info("reservePost()... call");
		log.info("reserveVO : " + reserveVO);
	}
	
	
}
