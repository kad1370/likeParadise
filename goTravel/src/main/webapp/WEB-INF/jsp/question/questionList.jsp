<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<script>
$(function(){
	$("a").click(function(){
		var questMngNo = $(this).parents("tr").find("td[hidden=true]").text();
		location.href="<c:url value = 'questionConts?questMngNo='/>" + questMngNo; 
	})
});
</script>
	
	<!-- T_QNA_MNG 에서 데이터 조회해서 뿌려야함 -->
	<!-- 언제뿌리나? : 네비게이터에서 qna를 클릭해서 qnaList가 로드될 때 -->
    <div class="row">
        	<table class="table table-hover table-bordered" id="questionTable">
				<thead>
					<tr>
					
						<th id="questMngNo" 	width="60" 	align="center" hidden="true">mngNo</th> 
						<th id="questNum" 		width="60" 	align="center">no</th>
						<th id="questCat" 		width="60" 	align="center">category</th>		 
						<th id="questSubj" 		width="260" align="left">subject</th>			 
						<th id="mbrNm" 			width="90" 	align="center">name</th>			 
						<th id="regDe" 			width="90" 	align="center">date</th>			 
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${qaList}" var="qaListVar">
						<tr>
							<td hidden="true"><c:out value="${qaListVar.questMngNo}"/></td>
							<td><c:out value="${qaListVar.num}"/></td>
							<td><c:out value="${qaListVar.questCat}"/></td>
							<td><a href="#"><c:out value="${qaListVar.questSubj}"/></a></td>
							<td><c:out value="${qaListVar.mbrNm}"/></td>
							<td><c:out value="${qaListVar.regDe}"/></td>
						</tr>					
					</c:forEach>
				</tbody>        	
        	</table>
    </div>
    
		    <!-- Pagination -->
		    <ul class="pagination justify-content-center">
				    <li class="page-item">
				        <a  class="page-link" aria-label="Previous" href='<c:url value="/questionList?page=${pageMaker.startPage}"/>'>
				          <span aria-hidden="true">«</span>
				          <span class="sr-only">Previous</span>		        
				        </a>
				    </li>
			    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			    <li class="page-item">
			        <a class="page-link" href='<c:url value="/questionList?page=${idx}"/>'><c:out value='${idx}'/></a>
			    </li>
			    </c:forEach>
				    <li class="page-item">
				        <a class="page-link" aria-label="Next" href='<c:url value="/questionList?page=${pageMaker.endPage}"/>'>
				          <span aria-hidden="true">»</span>
				          <span class="sr-only">Next</span>		        
				       </a>
				    </li>
			</ul>
			   
   			<button class="dark-btn btn1" id="writeQnaBtn" onclick="location.href='writeQna'">글쓰기</button>		
    

    
    
    
