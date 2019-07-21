
// 스마트에디터 적용 타겟 객체
var editorTargetObj = {
	$textareaId : $, // 스마트에디터를 적용할 textarea
	$applyBtnId : $  // 데이터 등록 및 수정 버튼 (트랜젝션 버튼 타겟)
}

var oEditors = [];

var smartEditorInit = (function() {

	var _applySe2 = function(textareaId, applyBtnId, callback) {
		
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: oEditors,
	        
	        //textarea에서 지정한 id와 일치해야 합니다.
	        elPlaceHolder: textareaId,  
	        
	        //SmartEditor2Skin.html 파일이 존재하는 경로
	        sSkinURI: "se2/SmartEditor2Skin.html",  
	        
	        fOnAppLoad : callback,
	        
	        fCreator: "createSEditor2"
	    });
	    
	    //등록, 수정 버튼 클릭시 form 전송
	    $("#" + applyBtnId).click(function(){

	    	// SmartEditor의 값을 Textarea로 전달 해주는 역할
	        oEditors.getById[textareaId].exec("UPDATE_CONTENTS_FIELD", []);
	        
	        if (typeof callback === "undefined") {
	        	
		        // 등록 데이터 서버 전달 메서드
		        qnaInit.insertFn();	        	
	        } else if (typeof callback === "function") {
	        	
	        	// 수정 데이터 서버 전달 메서드
	        	updateInit.checkDataChange();
	        }

	    });  
	}
	
	return {
		applySe2 : _applySe2 
	}

}());

