<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>

<!DOCTYPE html>
<html>

<head>
	<tiles:insertAttribute name="head"/>
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

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Contact form JavaScript -->
  <!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
  <script src="js/jqBootstrapValidation.js"></script>
  <script src="js/contact_me.js"></script>

</body>

</html>
