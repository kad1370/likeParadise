package com.project.goTravel.main.web;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.goTravel.main.service.MainService;

@Controller
public class MainController {

	@Resource
	private MainService mainService;
	
	@RequestMapping("/") 
	public String initMain() throws Exception {
		
		return "main/main.tiles";
	}
}
