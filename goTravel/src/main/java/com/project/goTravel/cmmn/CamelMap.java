package com.project.goTravel.cmmn;

import org.apache.commons.collections.map.ListOrderedMap;
import org.apache.ibatis.type.Alias;

import com.project.goTravel.util.CamelUtil;



@Alias("camelMap")
public class CamelMap extends ListOrderedMap {

	private static final long serialVersionUID = 6723434363565852261L;
	
	/**
	 * map의 key를 camel 규칙으로 변경
	 * 
	 * @param key 	: key 값
	 * @param value : 값
	 */
	@Override
	public Object put(Object key, Object value) {
		return super.put(CamelUtil.convertCamelCase((String) key), value);
	}
}

