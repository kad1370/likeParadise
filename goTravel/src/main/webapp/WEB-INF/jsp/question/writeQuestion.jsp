<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<script>

$(function(){
	
	editorTargetObj.$textareaId = $("textarea").attr("id"),
	editorTargetObj.$applyBtnId = $("button[name=등록]").attr("id");
	
	smartEditorInit.applySe2(editorTargetObj.$textareaId, editorTargetObj.$applyBtnId);
	

});

var qnaInit = {
		
		insertFn : function(){
			
			var $that = this;
			
			// 문의글 관리 데이터
			var questMngData = {
				"questCatCd" : $("select[name=questCatCd]").val(),
				"questSubj" : $("select[name=questSubj]").val(),
				"mbrNm" : $("input[name=mbrNm]").val()
			}
			
			// 문의글 상세 데이터
			var questDtlData = {
				"questConts" : $("textarea").val()
			}
			
			// 데이터 전달
			$.ajax({
				url  : "<c:out value='saveQuestionData'/>",
				type : "POST",
				data : {
					"questMngData" : JSON.stringify(questMngData),
					"questDtlData" : JSON.stringify(questDtlData),
				},
				
				success : function(insertResult){
		        	resultAlertObj.result = insertResult.result;
		        	resultAlertObj.resultMsg = "등록";
		        	
		            resultAlertFn(resultAlertObj.result, resultAlertObj.resultMsg);
				}
			})
		}
}
</script>

    <div class="row">
 				<table class="table table-striped" style="width:100%">
 					<tbody>
						<tr>
							<th scope="row">제목</th>
							<td>
			    				<select name="questCatCd" class="form-selects">
								    <option value=10>예약문의</option>
								    <option value=20>환불문의</option>
								    <option value=30>변경문의</option>
								    <option value=40>기타문의</option>
								</select>							
				              <select name="questSubj" class="form-selects">
				              	<option value="문의합니다">문의합니다</option>
				              </select>							
							</td>
						</tr> 			
						<tr>
							<th>이름</th>
							<td><input type="text" class="form-control" name="mbrNm" style="width:50%"></td>
						</tr>		
 					</tbody>
 				</table>

		              <textarea rows="10" cols="100" class="form-control" name="questContsInsert" id="questContsInsert" maxlength="999" style="resize:none"></textarea>

    </div>
    	 <div class="card-body">	        
		          <button class="dark-btn btn1" name="등록" id="submitQuestion">등록</button>
		          <a href="questionList"><button class="white-btn" name="취소" id="cancelQuestion">취소</button></a>
 		</div>
    
