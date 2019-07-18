package com.project.goTravel.question.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.project.goTravel.cmmn.CamelMap;
import com.project.goTravel.cmmn.vo.pagination.Criteria;
import com.project.goTravel.question.service.QuestionService;
import com.project.goTravel.util.JsonUtil;

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Resource
	private QuestionMapper questionMapper;
	
	// (1)[select: T_QUEST_MNG] 문의글 리스트 조회 
	@Override
	public List<CamelMap> selectQuestionListServiceList(Criteria criteria) throws Exception {
		return questionMapper.selectQuestionListServiceList(criteria);
	}
	
	// (1-2)[select: T_QUEST_MNG] 문의글 총 개수 조회
	@Override
	public int countQuestionListTotal() throws Exception {
		return questionMapper.countQuestionListTotal();
	}
	
	// (2)[insert: T_QUEST_MNG & T_QUEST_DTL] 문의글 insert
	@Override
	public CamelMap saveQuestionData(Map<String, Object> questionData) throws Exception {
		CamelMap insertResult = new CamelMap();
		
		try {
			
			// 제이슨오브젝트스르링을 스트링으로 형변환 (JsonUtil 사용을 위해)
			String 	questMngDataStr = (String) questionData.get("questMngData"),
					questDtlDataStr = (String) questionData.get("questDtlData");
			
			// JsonUtil을 사용하여 스트링을 Map으로 변환 (insert하기 위해서는 Map형태가 되어야하기 때문, CamelMap은 사용불가)
			Map<String, Object> questMngDataMap = JsonUtil.JsonToMap(questMngDataStr);
			Map<String, Object> questDtlDataMap = JsonUtil.JsonToMap(questDtlDataStr);
			
			// 공통코드인 카테고리 코드로 카테고리 이름 매칭 후 Map에 추가
			int catCode = Integer.parseInt((String) questMngDataMap.get("questCatCd"));
			switch (catCode) {
			case 10 : 
				questMngDataMap.put("questCat", "예약문의");
				break;
			case 20 : 
				questMngDataMap.put("questCat", "환불문의");
				break;
			case 30 : 
				questMngDataMap.put("questCat", "변경문의");
				break;
				
			// case가 40일 때	
			default : 
				questMngDataMap.put("questCat", "기타문의");
				break;
			}
			
			// [insert: T_QUEST_MNG] 문의글 관리 데이터 insert 
			questionMapper.insertQuestionMngData(questMngDataMap);
			
			// [insert: T_QUEST_DTL] 문의글 상세 데이터 insert
			questDtlDataMap.put("questMngNo", questMngDataMap.get("questMngNo"));
			questionMapper.insertQuestionDtlData(questDtlDataMap);
			
			// 저장 성공 시 success 리턴
			insertResult.put("result", "success");
			
		} catch(Exception e) {
			e.printStackTrace();
			
			// 저장 실패 시 fail 리턴
			insertResult.put("result", "fail");
		}
		
		return insertResult;
	}
	
	// (3)[select: T_QUEST_DTL] 문의글 상세 내용 조회
	@Override
	public CamelMap selectQuestionContsServiceInfo(String questMngNo) throws Exception {
		
		return questionMapper.selectQuestionContsServiceInfo(questMngNo);
	}

	// (4)[update: T_QUEST_DTL] 문의글 상세 내용 수정
	@Override
	public CamelMap saveChangedQuestionData(Map<String, Object> changedData) throws Exception {
		
		System.out.println("서비스 임플 수정데이터확인: " + changedData);
		
		CamelMap updateResult = new CamelMap();
		
		try {
			
			// 제이슨오브젝트스르링을 스트링으로 형변환 (JsonUtil 사용을 위해)
			String 	changedDataStr = (String) changedData.get("changedData");
			
			// JsonUtil을 사용하여 스트링을 Map으로 변환 (insert하기 위해서는 Map형태가 되어야하기 때문, CamelMap은 사용불가)
			Map<String, Object> changedDataMap = JsonUtil.JsonToMap(changedDataStr);
			
			questionMapper.saveChangedQuestionData(changedDataMap);			
			
			updateResult.put("result", "success");
			
			System.out.println("수정 결과 확인: " + updateResult);
			
		} catch(Exception e) {
			e.printStackTrace();
			
			// 저장 실패 시 fail 리턴
			updateResult.put("result", "fail");
			
			System.out.println("수정 결과 확인: " + updateResult);
		}

		return updateResult;
	}
	
	// (4)[delete: T_QUEST_MNG & T_QUEST_DTL] 문의글 삭제
	@Override
	public CamelMap saveDeleteQuestionData(String deleteQuestMngNo) throws Exception {
		
		CamelMap deleteResult = new CamelMap();
		
		try {
			
			// [delete: T_QUEST_MNG] 문의글 관리 데이터 삭제
			questionMapper.deleteQuestMngData(deleteQuestMngNo);
			
			// [delete: T_QUEST_DTL] 문의글 상세 데이터 삭제
			questionMapper.deleteQuestDtlData(deleteQuestMngNo);
			
			deleteResult.put("result", "success");
			
		} catch(Exception e) {
			e.printStackTrace();
			
			deleteResult.put("result", "fail");
		}
		
		return deleteResult;
	}
	

	

}
