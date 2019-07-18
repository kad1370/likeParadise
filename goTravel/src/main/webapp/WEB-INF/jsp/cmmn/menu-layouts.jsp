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
  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
 	<tiles:insertAttribute name="pageHead"/>

    <!-- Content Row -->
 		<tiles:insertAttribute name="content"/>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  	<tiles:insertAttribute name="footer"/>
  	
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
