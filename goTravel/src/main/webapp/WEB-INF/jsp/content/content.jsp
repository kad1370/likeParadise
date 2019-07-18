<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

      <div class="col-md-8">

        <!-- Blog Post -->
        <c:forEach items="${suksoData}" var="suksoDataVar">
	        <div class="card mb-4">
	          <img class="card-img-top" src="http://placehold.it/750x300" alt="Card image cap">
	          <div class="card-body">
	            <h2 class="card-title">${suksoDataVar.SUKSO_NM}</h2>
	            <p class="card-text">${suksoDataVar.LOC_INFO}</p>
	            <a href="#" class="btn btn-primary">Read More &rarr;</a>
	          </div>
	          <div class="card-footer text-muted">
	            Posted on January 1, 2017 by
	            <a href="#">Start Bootstrap</a>
	          </div>
	        </div>        
        </c:forEach>

        <!-- Pagination -->
        <ul class="pagination justify-content-center mb-4">
          <li class="page-item">
            <a class="page-link" href="#">&larr; Older</a>
          </li>
          <li class="page-item disabled">
            <a class="page-link" href="#">Newer &rarr;</a>
          </li>
        </ul>

      </div>