// 결과 알림 시 사용할 객체
var resultAlertObj = {
		result 		: "",
		resultMsg 	: ""
}

// 결과 알림 기능 메서드
function resultAlertFn(result, resultMsg) { 
	
	if (result === "success") {
        alert(resultMsg + "되었습니다");
        location.href="questionList"; // 리스트 페이지로 이동		
	} else {
        alert(resultMsg + "되지 않았습니다, 다시 시도해주세요");
		location.reload(); // 페이지 새로고침
		return;
	}
}