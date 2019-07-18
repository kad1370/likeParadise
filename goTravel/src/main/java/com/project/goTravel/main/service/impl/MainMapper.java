package com.project.goTravel.main.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MainMapper {

	List<Map<String, Object>> selectMainServiceList() throws Exception;

}
