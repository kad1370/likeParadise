package com.project.goTravel.question.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.goTravel.cmmn.CamelMap;
import com.project.goTravel.cmmn.vo.pagination.Criteria;
import com.project.goTravel.cmmn.vo.pagination.PageMaker;
import com.project.goTravel.question.service.QuestionService;
import com.project.goTravel.util.JsonUtil;


@Controller
public class QuestionController {
	
	@Resource
	private QuestionService questionService;
	
	// [select] 문의글 리스트 화면에 내리는 데이터
	@RequestMapping(value="questionList")
	public String qnaListInit(ModelMap model, @ModelAttribute Criteria criteria) throws Exception {
		
		List<CamelMap> qaList = questionService.selectQuestionListServiceList(criteria);
		
		 PageMaker pageMaker = new PageMaker();
		 pageMaker.setCri(criteria);
		 
		 System.out.println("총게시글 수 확인: " + questionService.countQuestionListTotal());
		 
		 int totCnt = questionService.countQuestionListTotal();
		 
		 pageMaker.setTotalCount(totCnt);

		System.out.println("리스트확인: " + qaList);
		
		model.addAttribute("qaList", qaList);
		model.addAttribute("pageMaker", pageMaker);
		
		return "question/questionList.join";
	}
	
	// 문의글 작성 페이지 init 메서드
	@RequestMapping(value="writeQna")
	public String writeQnaInit() throws Exception {
		
		return "question/writeQuestion.join";
	}
	
	// [insert] 문의글 데이터 insert 메서드
	@RequestMapping(value="saveQuestionData", produces="application/json; charset=utf-8")
	@ResponseBody	
	public String saveQuestionDataInit(@RequestParam Map<String, Object> questionData) throws Exception {
	
		CamelMap result = questionService.saveQuestionData(questionData);
		
		System.out.println("컨트롤러 결과확인:" + result);
		return JsonUtil.MapToJson(result);
	}
	
	// [select: T_QUEST_DTL] 문의글 상세 내용 조회
	@RequestMapping(value="questionConts")
	public String questionContsInit(@RequestParam (required=false) String questMngNo, ModelMap model) throws Exception {
		
		CamelMap questDtlConts = questionService.selectQuestionContsServiceInfo(questMngNo);
		
		System.out.println("-----------잘 추가되었나?" + questDtlConts);
		model.addAttribute("questDtlConts", questDtlConts);
		return "question/questionConts.join";
	}

	// [update & delete : T_QUEST_DTL] 문의글 상세 내용 수정 및 삭제
	// application/json 은 stringify와 짝꿍이다. (함께 사용해야한다)
	// 문자열이 객체로 ajax에 전달 되어 JSON.parse 없이 데이터 사용이 가능하다.
	@RequestMapping(value="updateQuestionData")
	
	// ResponsBody는 post 방식의 ajax로 보낸 데이터를 받을 때 사용한다.
	// post방식은 Http통신에서 body에 담겨 데이터가 전달이 되는데, ResponseBody는 body를 통째로 가져온다.
	@ResponseBody 
	public String updateQuestionData(@RequestParam Map<String, Object> changedData) throws Exception {
		
		System.out.println("수정데이터확인: " + changedData);
		
		CamelMap updateResult = questionService.saveChangedQuestionData(changedData);
		
		return JsonUtil.MapToJson(updateResult);
	}
	

	// [update & delete : T_QUEST_DTL] 문의글 상세 내용 수정 및 삭제
	@RequestMapping(value="deleteQuestionData", produces="application/json; charset=utf-8")
	@ResponseBody
	public String deleteQuestionData(@RequestParam (required=false) String deleteQuestMngNo) throws Exception {
		
		System.out.println("삭제데이터확인: " + deleteQuestMngNo);
		
		CamelMap deleteResult = questionService.saveDeleteQuestionData(deleteQuestMngNo);
		
		System.out.println("삭제확인확인:" + deleteResult);
		
		return JsonUtil.MapToJson(deleteResult);
	}	
	
}
