package com.project.goTravel.main.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.project.goTravel.main.service.MainService;

@Service
public class MainServiceImpl implements MainService {
	
	@Resource
	private MainMapper mainMapper;
	
	@Override
	public List<Map<String, Object>> selectMainServiceList() throws Exception {
		
		List<Map<String, Object>> suksoTypeList = mainMapper.selectMainServiceList();
 		return suksoTypeList;
	}
}
