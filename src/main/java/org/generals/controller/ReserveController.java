package org.generals.controller;

import java.util.List;

import org.generals.domain.Criteria;
import org.generals.domain.PageMaker;
import org.generals.domain.ReserveVO;
import org.generals.service.ReserveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/reserve")
@Log4j
public class ReserveController {
	
	
	@Setter(onMethod_ = { @Autowired })
	private ReserveService service;
	
	@GetMapping("/register")
	public void register(Model model) {
		log.info("register()... call");
		model.addAttribute("hallList", service.getHall());
		model.addAttribute("articleList", service.getArticle());
	}
	
	@PostMapping("/register")
	public String registerPost(ReserveVO reserveVO, RedirectAttributes rttr) {
		log.info("registerPost()... call");
		log.info("reserveVO : " + reserveVO);
		reserveVO.setId("user10");
		reserveVO.setState("D");
		try {
			service.insertReserve(reserveVO);
			rttr.addFlashAttribute("msg", "Reservation Success");
		} catch (Exception e) {
			rttr.addFlashAttribute("msg", e.getMessage());
		}
		
		return "redirect:list";
	}
	
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		log.info("list()... call");
		List<ReserveVO> reservList = service.getList(cri);
		log.info(reservList);
		model.addAttribute("pm", new PageMaker(cri, service.getTotal(cri)));
		model.addAttribute("reserveList",reservList);
	}
	
	@GetMapping("/view")
	public void view(Model model, Long rno) {
		model.addAttribute("reserveVO", service.getReserve(rno));
	}
	
	
}
