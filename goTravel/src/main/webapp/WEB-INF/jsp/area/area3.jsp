<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<script>

$(function(){
	init.menuFn();
});

var init = {
		
		$mainMenu 	: $(".list-group > li"), // 메인메뉴 (시/도)
		$subMenu 	: $(".subMenu"),		 // 서브메뉴 (지역구)
		
		// 메뉴처리 (하이라이트 및 서브메뉴 노출)
		menuFn : function() {
			
			var $this = $(this);
			
			// 페이지 랜딩 시 최초의 하이라이트 셋팅 (가장 상단의 메뉴)
			this.$mainMenu.eq(0).addClass("active");
			
			// 페이지 랜딩 시 최초의 서브메뉴 노출 (가장 상단메뉴의 서브메뉴)
			this.$subMenu.eq(0).attr("style", "display: block");
			
			// 메뉴 클릭 시 하이라이트 및 서브메뉴 노출 처리
			this.$mainMenu.click(function() {
				
				// 동적 하이라이트 처리
				$this.$mainMenu.removeClass("active");
				$this.addClass("active");
				
				// 동적 서브메뉴 노출 처리
				$this.$subMenu.attr("style", "display: none");
				$this.$subMenu.eq($this.index()).attr("style", "display: block");
				
				console.log("서브메뉴확인:" , $this.$subMenu);
				console.log("메인메뉴확인:" , $this.$mainMenu);
				
				debugger;
			});
		},
		
		// a태그 클릭 시 form태그 제출
		pageMoveFn : function() {
			
			
		}
}

</script>

<form>
	<input type="hidden" />
</form>

<div class="row">
     <!-- 대메뉴 (시/도) -->
	     <div class="col-lg-3 mb-4">
	        <div class="list-group">
		        <c:forEach var="cityName_L" items="${cityName}">
		        	<c:if test="${cityName_L.CAT_LV eq 1}">
						<li class="list-group-item" id="${cityName_L.CAT_CD}"><c:out value="${cityName_L.CAT_NM}"/></li>
					</c:if>
				</c:forEach>
	        </div>
	      </div>
      
      <!-- 서브메뉴(지역구) -->
	      <c:forEach var="cityName_L" items="${cityName}">
	      	<c:if test="${cityName_L.CAT_LV eq 1}">
			      <div class="col-lg-9 mb-4 subMenu" style="display: none">
		    		<c:forEach var="cityName_M" items="${cityName}">
			      		<c:if test="${(cityName_M.CAT_LV eq 2) and (cityName_L.CAT_CD eq cityName_M.UPPR_CAT)}">
			      				<li class="list-group-item" value="<c:out value="${cityName_M.CAT_CD}"/>">
			      					<a href=<c:url value="${cityName_M.CNNT_URL}"/>><c:out value="${cityName_M.CAT_NM}"/></a>
			      				</li>
			      		</c:if>
		    		</c:forEach>
			     </div>
	     	</c:if>
	     </c:forEach>
</div>