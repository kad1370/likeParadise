package com.project.goTravel.area.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.project.goTravel.area.service.AreaService;

@Service
public class AreaServiceImpl implements AreaService {

	@Resource
	private AreaMapper areaMapper;

	@Override
	public List<Map<String,Object>> selectAreaServiceList() throws Exception {
		List<Map<String,Object>> areaResult = areaMapper.selectAreaServiceList();
		return areaResult;
	}
}
