package com.project.goTravel.content.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface ContentMapper {

	List<Map<String, Object>> selectContentServiceList(Map<String, Object> searchData) throws Exception;

}
