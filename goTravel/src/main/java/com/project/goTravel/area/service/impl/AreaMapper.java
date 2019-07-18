package com.project.goTravel.area.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AreaMapper {

	List<Map<String,Object>> selectAreaServiceList() throws Exception;

}
