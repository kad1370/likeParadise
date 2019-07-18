package com.project.goTravel.content.service;

import java.util.List;
import java.util.Map;



public interface ContentService {

	List<Map<String, Object>> selectContentServiceList(Map<String, Object> searchData) throws Exception;


}
