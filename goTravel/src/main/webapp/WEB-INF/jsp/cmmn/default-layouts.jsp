<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>

<!DOCTYPE html>
<html>

<head>
<tiles:insertAttribute name="head"/>
</head>

<body>

  <!-- Navigation -->
	<tiles:insertAttribute name="nav"/>

  <header>
	<tiles:insertAttribute name="header"/>
  </header>

  <!-- Page Content -->
 	 <tiles:insertAttribute name="content"/>
  <!-- /.container -->

  <!-- Footer -->
	<tiles:insertAttribute name="footer"/>

</body>

</html>
