<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<script>

var oEditors = [];

$(function(){
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        
        //textarea에서 지정한 id와 일치해야 합니다.
        elPlaceHolder: "questContsInsert",  
        
        //SmartEditor2Skin.html 파일이 존재하는 경로
        sSkinURI: "se2/SmartEditor2Skin.html",  
        
        /*
        fOnAppLoad : function(){
        	
        	var org = new Array();
        	org.push('${questDtlConts.questConts}');
        	
            //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
            oEditors.getById["questConts"].exec("PASTE_HTML", org);
        },
        */
        
        fCreator: "createSEditor2"
    });
    
    //저장버튼 클릭시 form 전송
    $("#submitQuestion").click(function(){
    	
    	// SmartEditor의 값을 Textarea로 전달 해주는 역할
        oEditors.getById["questContsInsert"].exec("UPDATE_CONTENTS_FIELD", []);
        qnaInit.insertFn();
    });  
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
					$that.popUpFn(insertResult.result);	
				}
			})
		},
		
		popUpFn : function(result){

			( result === "success" ) ? 
					
					// 성공인 경우 등록 완료 안내 팝업
					(function() {
						alert("등록되었습니다");
						// location.href="<c:url value = 'questionList'/>"; // 리스트 페이지로 이동
					})() : 
						
						// 실패인 경우 실패 안내 팝업
						(function() {
							alert("등록에 실패했습니다, 다시 작성해주세요");
							// location.reload(); // 페이지 새로고침
						})();						
		}
}
</script>

    <div class="row">
      <div class="col-lg-8 mb-4">
 		<h3>write Q/A</h3>      
 		
		          <div class="control-group form-group">
		            <div class="controls">
		              <label>카테고리</label>
	    				<select name="questCatCd" class="form-control">
						    <option value=10>예약문의</option>
						    <option value=20>환불문의</option>
						    <option value=30>변경문의</option>
						    <option value=40>기타문의</option>
						</select>
		              <p class="help-block"></p>
		            </div>
		          </div>
		          
		          <div class="control-group form-group">
		            <div class="controls">
		              <label>제목</label>
		              <select class="form-control" name="questSubj">
		              	<option value="문의합니다">문의합니다</option>
		              </select>
		            </div>
		          </div>
		          
		          <div class="control-group form-group">
		            <div class="controls">
		              <label>이름</label>
		              <input type="text" class="form-control" name="mbrNm">
		            </div>
		          </div>
		          		          
		          <div class="control-group form-group">
		            <div class="controls">
		              <label>문의내용:</label>
		              <textarea rows="10" cols="100" class="form-control" name="questContsInsert" id="questContsInsert" maxlength="999" style="resize:none"></textarea>
		            </div>
		          </div>
		        
		          <button class="btn btn-primary" id="submitQuestion">등록</button>
		          <a href="questionList"><button class="btn btn-primary" id="cancelQuestion">취소</button></a>
 		
      </div>
    </div>
    
