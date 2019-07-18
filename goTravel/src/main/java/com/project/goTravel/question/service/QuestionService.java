package com.project.goTravel.question.service;

import java.util.List;
import java.util.Map;

import com.project.goTravel.cmmn.CamelMap;
import com.project.goTravel.cmmn.vo.pagination.Criteria;

public interface QuestionService {
	
	// [select: T_QUEST_MNG] 문의글 리스트 조회 
	List<CamelMap> selectQuestionListServiceList(Criteria criteria) throws Exception;
	
	// [select: T_QUEST_MNG] 문의글 총 개수 조회
	int countQuestionListTotal() throws Exception;
	
	// [insert: T_QUEST_MNG & T_QUEST_DTL] 문의글 관리 및 상세 데이터 insert
	CamelMap saveQuestionData(Map<String, Object> questionData) throws Exception;
	
	// [select: T_QUEST_DTL] 문의글 상세 내용 조회
	CamelMap selectQuestionContsServiceInfo(String questMngNo) throws Exception;

	// [update: T_QUEST_DTL] 문의글 상세 내용 수정
	CamelMap saveChangedQuestionData(Map<String, Object> changedData) throws Exception;
	
	// [delete: T_QUEST_MNG & T_QUEST_DTL] 문의글 삭제
	CamelMap saveDeleteQuestionData(String deleteQuestMngNo) throws Exception;
	
}
