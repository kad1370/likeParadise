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
          	<p class="small"><c:out value = '${questDtlConts.regDt}'/></p>
          </div>
          <div class="card-body"> </div>
        	<textarea rows="10" cols="150" class="form-control" name="questConts" id="questConts" maxlength="999" style="resize:none"></textarea>
      </div>
    </div>	
    
    <button class="dark-btn btn1" id="updateQuestBtn">수정</button>
    <button class="white-btn" id="deleteQuestBtn" onclick="deleteInit.deleteFn();">삭제</button>
</div>    
    
<script>

var oEditors = [];

$(function(){
	// updateInit.checkDataChange();

    nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        
        //textarea에서 지정한 id와 일치해야 합니다.
        elPlaceHolder: "questConts",  
        
        //SmartEditor2Skin.html 파일이 존재하는 경로
        sSkinURI: "se2/SmartEditor2Skin.html",  
        
        fOnAppLoad : function(){
        	
        	var org = new Array();
        	org.push('${questDtlConts.questConts}');
        	
            //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
            oEditors.getById["questConts"].exec("PASTE_HTML", org);
        },
        
        fCreator: "createSEditor2"
    });
    
    //저장버튼 클릭시 form 전송
    $("#updateQuestBtn").click(function(){
    	
    	// SmartEditor의 값을 Textarea로 전달 해주는 역할
        oEditors.getById["questConts"].exec("UPDATE_CONTENTS_FIELD", []);
        updateInit.checkDataChange();
    });   	
	
});

var updateInit = {
		   
		   changeChk : false,
		   
		    // 데이터 변경 체크 메서드   
		   checkDataChange : function() {
		      
			   console.log("타나?");
			   console.log($("#questConts").val());
			   
		      var originData = '${questDtlConts.questConts}',
		      		editedData = $("textarea").val();
		      
		      if (originData !== editedData) {
		    	  changeChk = true;
		    	  this.saveUpdateDataFn();
		      }
		   },
		   
		   // 데이터 수정 메서드   
		   saveUpdateDataFn : function() {
			   
			   var $that = this;
			   
			   if (changeChk) {
				   
				   changedData = {
						      "questMngNo" : ${param.questMngNo},
						      "changedData" : $("textarea").val()
					},
				      
				      $.ajax({
				         type : "POST",
				         url : "<c:out value='updateQuestionData'/>",
				         contentType : "application/json",
				         // JsonObject 형식을 JsonObjectStr 형식으로 바꾸기 위해 stringify 사용
				         // JsonObjectStr 로 바꾸게 되면 쿼리스트링 형식으로만 전달 받을 때 사용가능한 @RequestParam 사용 가능
				         data : {"changedData" : JSON.stringify(changedData)},
				         
				         success : function(updateResult){
				            $that.popUpFn(updateResult.result);               
				         }
				      }) 
			   }

		   },
		   
		   popUpFn : function(result){

		      ( result === "success" ) ? 
		            
		            // 성공인 경우 등록 완료 안내 팝업
		            (function() {
		               alert("수정되었습니다");
		               location.href="<c:url value = 'questionList'/>"; // 리스트 페이지로 이동
		            })() : 
		               
		               // 실패인 경우 실패 안내 팝업
		               (function() {
		                  alert("수정에 실패했습니다, 다시 작성해주세요");
		                  location.reload(); // 페이지 새로고침
		               })();                  
		   }   
		}

var deleteInit = {
		
		deleteFn : function() {
			
			var deleteChk = confirm("삭제하시겠습니까?");
			
			var $that = this;
			
			if (deleteChk) {
				$.ajax({
			         type : "POST",
			         url : "<c:out value='deleteQuestionData'/>",
			         data : {"deleteQuestMngNo" : JSON.stringify(${param.questMngNo})},
			         
			         success : function(deleteResult){
			        	 $that.popUpFn(deleteResult.result);              
			         }	         
				});
			} else {
				location.reload(); // 페이지 새로고침
			}

		},

		   popUpFn : function(result){

			      ( result === "success" ) ? 
			            
			            // 성공인 경우 등록 완료 안내 팝업
			            (function() {
			               alert("삭제되었습니다");
			               location.href="<c:url value = 'questionList'/>"; // 리스트 페이지로 이동
			            })() : 
			               
			               // 실패인 경우 실패 안내 팝업
			               (function() {
			                  alert("삭제에 실패했습니다. 다시 시도해주세요");
			                  location.reload(); // 페이지 새로고침
			               })();                  
			   }  
}
</script>
    
