package com.project.goTravel.content.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.project.goTravel.content.service.ContentService;

@Service
public class ContentServiceImpl implements ContentService{
	
	@Resource
	private ContentMapper contentMapper;

	@Override
	public List<Map<String, Object>> selectContentServiceList(Map<String, Object> searchData)
			throws Exception {
		
		System.out.println("임플확인: " + searchData);
		
		String dataType = (String) searchData.get("suksoType");
		
		if (dataType == null) {
			System.out.println("null입니다");
		} else if (dataType == "") {
			System.out.println("빈값입니다.");
		}
		
		List<Map<String, Object>> searchResult = contentMapper.selectContentServiceList(searchData);
		return searchResult;
	}
	
}
