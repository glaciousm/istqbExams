<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Select Course</title>
	<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>

<body>
	<div class="generic-container" style="height:95%;width:95%;left:1%">
		<%@include file="authheader.jsp" %>	
		<div class="panel panel-default"  style="overflow:scroll; overflow-x:hidden; height:90%;width:100%">
			  <!-- Default panel contents -->
			  <div>
			  <label style="margin-top: 1%; margin-left: 1%">Select Course</label>
			  <form id="myForm" method="post" action="/istqbExams/list">
				  <select class="form-control" name="name" style="text-transform: uppercase;width: 200px;margin-left: 1%;">
						<c:forEach var="item" varStatus="loop" items="${courseList}">
        					<option value="${item.name}">${item.name}</option>
   						 </c:forEach>
				  </select>		
				  <input type="submit" value="Submit" class="btn btn-primary btn-sm" id="submitButton" style="margin-left: 1%; margin-top: 1%;"/>	  
			  </form>
			  </div>
		</div>		 	
   	</div>
</body>
</html>