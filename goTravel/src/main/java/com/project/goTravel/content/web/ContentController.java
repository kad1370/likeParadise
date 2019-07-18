package com.project.goTravel.content.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.goTravel.content.service.ContentService;



@Controller
public class ContentController {
	
	@Resource
	private ContentService contentService;
	
	// cnntUrl: DB상 저장되어 있는 세부 지역으로 이동한다. (ex: a-01 은 강남/역삼/삼성/논현)
	@RequestMapping(value="{cnntUrl}") 
	public String contentInit(@PathVariable("cnntUrl") String cnntUrl,
			@RequestParam (required=false) Map<String, Object> searchData, 
			@RequestParam (required=false) Map<String, Object> areaNm,
			ModelMap model) throws Exception {
		
		System.out.println("---------파라미터확인: " + searchData);
		System.out.println("---------파라미터확인: " + areaNm);
		
		// 지역에 해당하는 숙박데이터 가져오기
		List<Map<String,Object>> suksoData = contentService.selectContentServiceList(searchData);
		
		System.out.println("리스트확인: " + suksoData);
		
		model.addAttribute("suksoData", suksoData);
		model.addAttribute("areaNmData", areaNm);
		
		return "content/content.tiles2";
	}
}

