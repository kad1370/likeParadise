<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
 <script>
 $(function() {
	 
	    // 디폴트 날짜 설정
	    var date = new Date(); /* 현재 */
	    date.setTime(date.getTime() + 1000 * 60 * 60 * 24); /* 타임스탬프 + 1000*60*60*24ms(=1일) */
		
	    
	    // 체크인 데이트 피커 옵션
	     $("#CheckIn").datepicker({
	        onSelect: function(formattedDate, date, inst) {
	        	makeDate(date, inst);
	        	
	        	var endDate = date;
	        	endDate.setTime(date.getTime() + 1000 * 60 * 60 * 24);
	        	
	        	$("#CheckOut").datepicker({
	        		minDate: endDate
	        	});
	        }
	    });
	    
	     // 체크아웃 데이트 피커 옵션
	     $("#CheckOut").datepicker({
		        onSelect: function(formattedDate, date, inst) {
		        	makeDate(date, inst);
		        }
		    });
	     
		    $("#CheckIn").datepicker().data('datepicker').selectDate(new Date());
		    $("#CheckOut").datepicker().data('datepicker').selectDate(date);
		    
	});
 
  function makeDate(date, inst) {
 	var dateData = {};
 	
 	dateData["selectMonth"] = date.getMonth() + 1,
 	dateData["selectDay"] = date.getDay(),
 	dateData["selectDate"] = date.getDate(), 
 	dateData["$targetId"] = inst.el.id;
 	
 	setDate(dateData);
 } 
 
  function setDate(dateData) {
		 
			 var $target = $("#" + dateData.$targetId).parent();
			 // 월 데이터 넣기
			 $target.children("span:eq(0)").text(dateData.selectMonth + "/");
			 
			 // 일 데이터 넣기
			 $target.children("span:eq(1)").text(dateData.selectDate);
			 
			 // 요일 가져오고, 데이터 넣기
			var dayArr = ["일","월","화","수","목","금","토"];
			$target.children("span:eq(2)").text(dayArr[dateData.selectDay]);		 
		
	 }
  
//입력칸 빈칸 유효성 체크 메서드
var validChk = {
		
		emptyValChkFn : function() {
			
			// 기본값 셋팅
			var valid 		= false,
				searchData 	= {};
			
			// 호텔선택 빈 값 확인
			/*
			if ($("#hotels").val().length === 0) {
				alert("호텔을 선택하세요");
				return;
			} else {
				// searchData["hotels"] = $("[name=hotels]").val();
				$("[name=hotels]").val($("#hotels").val());	
			}
			*/
			
			// 체크인, 체크아웃 빈 값 확인
			if ($("[name=checkDate]").val().length === 0) {
				alert("날짜를 선택하세요");
				return;
			} else {
				// 선택 한 경우에는 input 에 값을 넣어준다.
				
 				$("[name=strtDate]").val($("#CheckIn").val());
				$("[name=endDate]").val($("#CheckOut").val());
				$("[name=person]").val($("#person").val());
				
				// $(".day:eq(0)").text($("#CheckIn").val());
			}
			
			// 필수 값 체크에 이상이 없을 시 페이지 이동
			valid = true;
			
			if (valid) {
				$("#searchFrm").submit();
			}
			// ajax로 값을 보내 서버단에서 유효성 체크
/* 			if (valid) {
 				$.ajax({
					type : "POST",
					url : "<c:out value='searchResult'/>",
					data : {"searchData" : JSON.stringify(searchData)},
					
					success : function(searchResult){
						
					} 
				});
			} */
		}
}

</script>
<form id="searchFrm" action="searchResult">
	<input type="hidden" name="strtDate"/>
	<input type="hidden" name="endDate"/>
	<input type="hidden" name="person"/>
</form>

	<!--================Booking Area =================-->
	<section class="container">
		<div class="booking_area">
			<div class="row">
					
					<div class="col-lg-3 col-sm-6 col-6">
						<div class="booking_item">
							<p>Check - in</p>
							<span class="day"></span>
							<span class="day"></span>
							<span class="month"></span>
							<label for="CheckIn">
								<i class="fa fa-angle-down"></i>
							</label>					
							<input type="text" class="form-control" name="checkDate" id="CheckIn">
							</div>
					</div>
					
						
					<div class="col-lg-3 col-sm-6 col-6">
						<div class="booking_item">
							<p>Check - out</p>
							<span class="day"></span>
							<span class="day"></span>
							<span class="month"></span>
							<label for="CheckOut">
								<i class="fa fa-angle-down"></i>
							</label>
							<input type="text" class="form-control" name="checkDate" id="CheckOut">
						</div>
					</div>
					
					<div class="col-lg-3 col-sm-6 col-6">
						<div class="booking_item">
							<p>Toatal guests</p>
								<select class="day" id="person">
									<option value="1">01</option>
									<option value="2">02</option>
									<option value="3">03</option>
								</select>
							<span class="month">person</span>	
<!-- 							<span class="day">01</span>
							<span class="month">person</span> -->
						</div>
					</div>
					
					<div class="col-lg-3 col-sm-6 col-6 coupon-code">
						<div class="booking_item">
							<button class="main_btn" onclick="validChk.emptyValChkFn()">Search</button>
						</div>
					</div>
				</div>	
		</div>
	</section>
	<!--================End Booking Area =================-->
	
  <div class="container">
  	<div style="margin-bottom:50px;"></div>
    	<h2 class="my-4" style="text-align: center;">진행 중인 프로모션</h2>
	<div style="margin-bottom:50px;"></div>
   <!-- Portfolio Section -->
    <div class="row">
         <div class="col-lg-4 portfolio-item">
            <div class="blog_post">
                <a href="single-blog.html"> <img src="images/event/massage.jpg" alt="massage"></a>
                <div class="blog_details">
                   <h2>Paradise Spa</h2>
                    <p>천연허브와 약초만을 사용해 전문가의 손길로 품격있는 스파 트리트먼트를 경험해보세요</p>
                </div>
            </div>
        </div>
         <div class="col-lg-4 portfolio-item">
            <div class="blog_post">
                 <a href="single-blog.html"><img src="images/event/privatePool.jpg" alt="privatePool"></a>
                <div class="blog_details">
                   <h2>Private Pool</h2>
                    <p>아늑하고 프라이빗한 풀은 여유로운 휴식을 선사합니다<br>
                    파노라믹 뷰로 펼쳐진 자연의 아름다움을 감상해보세요.</p>
                </div>
            </div>
        </div>
         <div class="col-lg-4 portfolio-item">
            <div class="blog_post">
                <img src="images/event/subbed.jpg" alt="subbed">
                <div class="blog_details">
                    <a href="single-blog.html">
                        <h2>The Glossary Of Telescopes</h2>
                    </a>
                    <p>MCSE boot camps have its supporters and its detractors. Some people do not
                        understand why you should have to spend money on boot camp when you can get
                        the MCSE study materials yourself at a fraction.</p>
                </div>
            </div>
        </div>     
        <div class="col-sm-6 portfolio-item">
            <div class="blog_post">
                <img src="images/event/brunch.jpg" alt="brunchbrunch">
                <div class="blog_details">
                    <a href="single-blog.html">
                        <h2>The Glossary Of Telescopes</h2>
                    </a>
                    <p>MCSE boot camps have its supporters and its detractors. Some people do not
                        understand why you should have to spend money on boot camp when you can get
                        the MCSE study materials yourself at a fraction.</p>
                </div>
            </div>
        </div>   
        <div class="col-sm-6 portfolio-item">
            <div class="blog_post">
                <img src="images/event/wine.jpg" alt="wine">
                <div class="blog_details">
                    <a href="single-blog.html">
                        <h2>The Glossary Of Telescopes</h2>
                    </a>
                    <p>MCSE boot camps have its supporters and its detractors. Some people do not
                        understand why you should have to spend money on boot camp when you can get
                        the MCSE study materials yourself at a fraction.</p>
                </div>
            </div>
        </div>     
    </div>
                   
    <!-- /.row -->
  </div>

