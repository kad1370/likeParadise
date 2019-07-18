package com.project.goTravel.question.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.goTravel.cmmn.CamelMap;
import com.project.goTravel.cmmn.vo.pagination.Criteria;

@Mapper
public interface QuestionMapper {
	
	// [select: T_QUEST_MNG] 문의글 리스트 조회 
	List<CamelMap> selectQuestionListServiceList(Criteria criteria) throws Exception;
	
	// [select: T_QUEST_MNG] 문의글 총 개수 조회
	int countQuestionListTotal() throws Exception;
	
	// [insert: T_QUEST_MNG] 문의글 관리 데이터 insert
	void insertQuestionMngData(Map<String, Object> qnaMngDataMap) throws Exception;
	
	// [insert: T_QUEST_DTL] 문의글 상세 데이터 insert
	void insertQuestionDtlData(Map<String, Object> questDtlDataMap) throws Exception;
	
	// [select: T_QUEST_DTL] 문의글 상세 내용 조회
	CamelMap selectQuestionContsServiceInfo(String questMngNo) throws Exception;

	// [update: T_QUEST_DTL] 문의글 상세 내용 수정
	void saveChangedQuestionData(Map<String, Object> changedData) throws Exception;
	
	// [delete: T_QUEST_MNG] 문의글 관리 데이터 삭제
	void deleteQuestMngData(String deleteQuestMngNo) throws Exception;
	
	// [delete: T_QUEST_DTL] 문의글 상세 데이터 삭제
	void deleteQuestDtlData(String deleteQuestMngNo) throws Exception;

}
