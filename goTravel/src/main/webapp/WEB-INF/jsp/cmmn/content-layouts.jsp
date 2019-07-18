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
	<!-- 필요 시 사용
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Home</a>
      </li>
      <li class="breadcrumb-item active">Blog Home 1</li>
    </ol>
	 -->
	 
    <div class="row">

      <!-- Blog Entries Column -->
		<tiles:insertAttribute name="content"/>
      <!-- Sidebar Widgets Column -->
		<tiles:insertAttribute name="left"/>
    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
		<tiles:insertAttribute name="footer"/>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
