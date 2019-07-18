package com.project.goTravel.area;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.goTravel.area.service.AreaService;

@Controller
public class AreaController {
	
	@Resource
	private AreaService areaService;
	
	@RequestMapping({ "/area", "/hotel", "/motel", "/guestHouse", "/pension" })
	public String initArea(HttpServletRequest req, ModelMap model, 
			@RequestParam Map<String,Object> suksoType) throws Exception {
		
		// 대메뉴, 중메뉴로 생성할 지역 데이터 가져오기
		List<Map<String,Object>> areaResult = areaService.selectAreaServiceList();
		
		System.out.println("---------지역데이터 확인---------: " + areaResult);
		System.out.println("---------suksoType 확인---------: " + suksoType);
		
		// 메뉴 데이터 내리기
		model.addAttribute("cityName", areaResult);
		
		// 숙소타입 데이터 내리기
		// model.addAttribute("suksoType", suksoType);
		
		return "area/area.menu";
	}
}
