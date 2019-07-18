package com.project.goTravel.join.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JoinController {
	
	@RequestMapping("join")
	public String joinInit() throws Exception {
		
		return "join/join.join";
		// return null;
	}
}
