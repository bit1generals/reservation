package org.generals.service;

import java.util.List;

import org.generals.domain.HallVO;
import org.generals.domain.ReserveVO;
import org.generals.mapper.ReserveMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReserveService {

	@Setter(onMethod_ = { @Autowired })
	private ReserveMapper mapper;
	
	
	public List<HallVO> getHall(){
		log.info("get Hall...........................");
		return mapper.selectHall();
	}
	
	public List<ReserveVO> getTimeData(ReserveVO vo){
		return mapper.selectTime(vo);
	}
}
