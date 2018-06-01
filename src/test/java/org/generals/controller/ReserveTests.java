package org.generals.controller;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;

import org.generals.domain.ReserveVO;
import org.generals.mapper.ReserveMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReserveTests {

	@Autowired
	ReserveMapper mapper;
	
	@Test
	public void insertTest() {
		ReserveVO vo = new ReserveVO();
		vo.setHno(1L);
		vo.setId("user01");
		vo.setReservedate(new Date());
		vo.setState("D");
		vo.setStartTime("2018-06-01 19:00:00");
		vo.setEndTime("2018-06-01 20:00:00");
		
		mapper.insertReserve(vo);
		
	}
	
	@Test
	public void selectTest() {
		
	}
}
