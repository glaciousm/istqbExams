<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Results List</title>
	<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>

<body>
	<div class="generic-container" style="height: 95%; width: 96%">
		<%@include file="authheader.jsp" %>	
		<div class="panel panel-default">
			  <!-- Default panel contents -->
		  	<div class="panel-heading">
			  	<div  class="floatLeft" style="display: inline-block;">
			  		<span class="lead">List of Results </span>
			  	</div>
			  	<div class="floatRight" style="width:60%;display: inline-block">
			  		<form action="/istqbExams/resultprofile" method="post">
			  		<label>Select User</label>
			  			<select name="userid" class="form-control" style="width:35%;display: inline-block;">
							<c:forEach var="item" varStatus="loop" items="${userList}">
	        					<option value="${item.id}">${item.firstName} ${item.lastName}</option>
	   						 </c:forEach>
					  </select>	
					  <label>Select Course</label>
					  <select name="courseid" class="form-control" style="width:35%;display: inline-block;">
							<c:forEach var="item" varStatus="loop" items="${courseList}">
	        					<option value="${item.id}">${item.name}</option>
	   						 </c:forEach>
					  </select>		
					  <input id="submitBtn" class="btn btn-primary" type="submit" value="Search"/>
			  		</form>
			  	</div>
		  	</div>
		  	<div style="overflow:scroll; overflow-x:hidden; height: 85%;width:100%">
			<table class="table table-hover">
	    		<thead>
		      		<tr>
				        <th>User</th>
				        <th>Score</th>
				        <th>Course</th>
				        <th>Date</th>
				        <!-- <th>Status</th> -->
				        <th>Total Time</th>
					</tr>
		    	</thead>
	    		<tbody>
				<c:forEach items="${results}" var="result" varStatus = "loop">
					<tr>
						<td>${result.user}</td>
						<td>${result.score} %</td>
						<td>${result.course.name}</td>
						<td>${dates[loop.index]}</td>
						<%-- <td>${result.status}</td> --%>
						<td>${result.time}</td>						    
					</tr>
				</c:forEach>
	    		</tbody>
	    	</table>
	    	</div>
		</div>
   	</div>
</body>
</html>