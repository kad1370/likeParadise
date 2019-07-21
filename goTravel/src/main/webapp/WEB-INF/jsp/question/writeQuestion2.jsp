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
		          <button class="dark-btn btn1" id="submitQuestion">등록</button>
		          <a href="questionList"><button class="white-btn" id="cancelQuestion">취소</button></a>
 		</div>
    
