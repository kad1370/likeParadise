<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<div class="card-body">	
    <div class="control-group form-group">
      <div class="controls">
          <div class="card-footer text-muted">
          	<strong>문의합니다</strong>
          	<p class="small"><c:out value = '${questDtlConts.regDe}'/></p>
          </div>
          <div class="card-body"> </div>
        	<textarea rows="10" cols="150" class="form-control" name="questConts" id="questConts" maxlength="999" style="resize:none"></textarea>
      </div>
    </div>	
    
    <button class="dark-btn btn1" name="수정" id="updateQuestBtn">수정</button>
    <button class="white-btn" name="삭제" id="deleteQuestBtn" onclick="deleteInit.deleteFn();">삭제</button>
</div>    
    
<script>

$(function(){
	
	editorTargetObj.$textareaId = $("textarea").attr("id"),
	editorTargetObj.$applyBtnId = $("button[name=수정]").attr("id");
	
	smartEditorInit.applySe2(editorTargetObj.$textareaId, editorTargetObj.$applyBtnId
			, function(){
    	
    	var org = new Array();
    	org.push('${questDtlConts.questConts}');
    	
        //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
        oEditors.getById["questConts"].exec("PASTE_HTML", org);
    });
});

var updateInit = {
		   
		   changeChk : false,
		   
		    // 데이터 변경 체크 메서드   
		   checkDataChange : function() {
		      
		      var 	originData = '${questDtlConts.questConts}',
		      		editedData = $("textarea").val();
		      
		      if (originData !== editedData) {
		    	  changeChk = true;
		    	  this.saveUpdateDataFn();
		      }
		   },
		   
		   // 데이터 수정 메서드   
		   saveUpdateDataFn : function() {
			   
			   if (changeChk) {
				   
				   changedData = {
						      "questMngNo" : ${param.questMngNo},
						      "changedData" : $("textarea").val()
					},
				      
				      $.ajax({
				         type : "POST",
				         url : "<c:out value='updateQuestionData'/>",
				         
				         // JsonObject 형식을 JsonObjectStr 형식으로 바꾸기 위해 stringify 사용
				         // JsonObjectStr 로 바꾸게 되면 쿼리스트링 형식으로만 전달 받을 때 사용가능한 @RequestParam 사용 가능
				         data : {"changedData" : JSON.stringify(changedData)},
				         
				         success : function(updateResult){
				            
				        	resultAlertObj.result = updateResult.result;
				        	resultAlertObj.resultMsg = "수정";
				        	
				            resultAlertFn(resultAlertObj.result, resultAlertObj.resultMsg);
				         }
				      }) 
			   }

		   }
		}

var deleteInit = {
		
		deleteFn : function() {
			
			var deleteChk = confirm("삭제하시겠습니까?");
			
			if (deleteChk) {
				
				$.ajax({
			         type : "POST",
			         url : "<c:out value='deleteQuestionData'/>",
			         data : {"deleteQuestMngNo" : JSON.stringify(${param.questMngNo})},
			         
			         success : function(deleteResult){
			        	 
			        	resultAlertObj.result = deleteResult.result;
			        	resultAlertObj.resultMsg = "삭제";
			        	
			            resultAlertFn(resultAlertObj.result, resultAlertObj.resultMsg);
			         }	         
				});
			} else {
				location.reload(); // 페이지 새로고침
				return;
			}

		}
}
</script>
    
