<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Users List</title>
	<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>

<body>
	<div class="generic-container" style="height:95%;width:95%;left:1%">
		<%@include file="authheader.jsp" %>	
		<div class="panel panel-default"  style="overflow-x:hidden; height:90%;width:100%">
			  <!-- Default panel contents -->
			  <div style="display: inline-block;left: 2%;width: 96%">
				  <div style="float: left">
				  	<img alt="ISTQB" src="https://www.isqi.org/tl_files/data/Registration%20Forms/Training%20Provider%20Logos/ISTQB%20Logo.png" style="width: 200px;left: 30px;">
				  </div>
				  <div style="float: right;">
				  	<img alt="ISTQB" src="http://www.iteam.gr/wp-content/uploads/2015/10/logo.png" style="width: 200px;right: 30px; margin-top: 20px">
				  </div>
			  </div>
			<div id="welcomeText" style="display: inline-block;width: 96%;height: 70%;text-align: center">
				<br>
				<h3>Welcome to iteam's Exam site for Istqb</h3>
				<h4>At the moment only ISTQB Foundation is available</h4>
				<br>
				<h5>In order to begin a test click on "Take a Test" link on the upper right</h5>
				<br>
				<h5>All answered tests are stored under you username and the total results can be viewed at any time</h5>
				<br>
				<br>  
			</div>
		</div>		 	
   	</div>
</body>
</html>