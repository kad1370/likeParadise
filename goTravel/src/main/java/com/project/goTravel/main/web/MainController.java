package com.project.goTravel.main.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.goTravel.main.service.MainService;

@Controller
public class MainController {

	@Resource
	private MainService mainService;
	
	@RequestMapping("/") 
	public String initMain(HttpServletRequest req, @RequestParam Map<String, Object> map, ModelMap model) throws Exception {
		
		List<Map<String,Object>> suksoTypeList = mainService.selectMainServiceList();
		System.out.println("메뉴리스트확인: " + suksoTypeList);
		
		model.addAttribute("suksoTypeList", suksoTypeList);
		return "main/main.tiles";
	}
}
