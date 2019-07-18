<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

  <div class="container">
  	<div style="margin-bottom:50px"></div>
    <!-- search room -->
    <div class="searchRoom row bg-black" style="margin-bottom:100px">
    
    <!-- 메인화면 입력 데이터 : 시작 -->
    	<form id="searchFrm"> 
    		<div id="fullData" >
    			
    			<!-- 목적지 입력 -->
    			<div class="data1" style="float: left; margin-right:50px">
	    			<div>
	    				<select name="hotels" id="hotels" class="form-selects" style="float: left;">
						    <option value="1">호텔을 선택하세요</option>
						    <option value="2">Like paradise JEJU</option>
						    <option value="3">Like paradise SEOUL</option>
						    <option value="4">Like paradise BUSAN</option>
						</select>
	    			</div>
    			</div>
 				
 				<!-- 예약일자 입력 -->
     			<div class="data2" style="float: left; margin-right:50px">
	    			<div>
	    				<input id="strtDate" name="strtDate" class="form-selects" style="float: left;" placeholder="체크인" autocomplete=off>
	    					<span style="float: left;"> - </span>
	    				<input id="endDate" name="endDate" class="form-selects" placeholder="체크아웃" autocomplete=off >
	    			</div>
    			</div>
    			
    			<!-- 인원수 입력 -->
     			<div class="data3" style="float: left; margin-right:50px">
	    			<div>
	    				<select name="adults" id="adults" class="form-selects" style="float: left;">
						    <option value="1">성인 1명</option>
						    <option value="2">성인 2명</option>
						    <option value="3">성인 3명</option>
						    <option value="4">성인 4명</option>
						</select>
	    			</div>
    			</div>
    			
    			<!-- 제출버튼 -->
    			<span class="input-group-btn">
                	<button id="searchBtn" class="dark-btn btn1" style="width: 100px; height: 40px;" onclick="init.submitInitFn()">검색</button>
              	</span>    			   			
    		</div>
    	</form>
    <!-- 메인화면 입력 데이터 : 끝 -->
	</div>
    <!-- /.row -->
    
    <!-- Portfolio Section -->
    <h2 class="my-4">Portfolio Heading</h2>

    <div class="row">
      <div class="col-lg-4 portfolio-item">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
      </div>
      <div class="col-lg-4 portfolio-item">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
      </div>
      <div class="col-lg-4 portfolio-item">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
      </div>      
      <div class="col-sm-6 portfolio-item">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
      </div>
       <div class="col-sm-6 portfolio-item">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
      </div>     
    </div>
                   
    <!-- /.row -->
  </div>

  <script>
$(function(){
	
	// 예약일자 데이트피커 적용
	$("#strtDate,#endDate").datepicker();

});

//입력칸 빈칸 유효성 체크 메서드
var validChk = {
		
		emptyValChk : function() {
			
			var valid = false;
			
			$("#fullData").find("input").each(function() {
				var $this = $(this);
				
				// console.log("***", $this.attr("id"));
				
				if ($this.val() === "") {
					alert("빈 값이 있습니다.");
					
					valid = false;
					return valid;
					
				} else {
					valid = true;
				}
			});
			
			return valid;
		}
}

// 입력 데이터 submit
var init = {
		
		// 입력 데이터 제출 메서드 (go버튼 클릭 시 호출)
		submitInitFn : function() {
			
			// 빈 값 체크 결과가 false인 경우 if문이 true가 되면서
			// 구현부 안에 있는 return이 실행되어 submit 되지 않는다.
			
			/*
			if (!validChk.emptyValChk()) {
				return;
			} 
			*/
			// 빈 값이 없는 경우 submit
			$("#searchFrm").attr("action", "content.do");
			$("#searchFrm").submit();
		}
}

</script>