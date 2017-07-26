<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
		<div class="panel panel-default"  style="overflow:scroll; overflow-x:hidden; height:90%;width:100%">
			  <!-- Default panel contents -->
		  	<div class="panel-heading"><span class="lead">List of Questions </span><span style="float: right" class="lead">Total Questions : <b>${counter}</b></span></div>
			<table class="table table-hover">
	    		<thead>
		      		<tr>
				        <th style="width: 2%">A/A</th>
				        <th style="width: 56%">Context</th>
				        <th style="width: 1%">Chapter</th>
				        <th style="width: 1%">Difficulty</th>
				        <th style="width: 30%">Answers</th>
				        <th style="width: 1%">Correct</th>
				        <th style="width: 10%">Action</th>
				        
					</tr>
		    	</thead>
	    		<tbody>
				<c:forEach items="${questions}" var="questions" varStatus="loop">
					<tr>
						<td>${loop.index+1}</td>
						<td>${questions.context}</td>
						<td>${questions.chapter}</td>
						<td>${questions.difficulty}</td>
						<td><b>A.</b> ${questions.answera}<br><b>B.</b> ${questions.answerb}<br><b>C.</b> ${questions.answerc}<br><b>D.</b> ${questions.answerd}
    					<c:if test="${not empty questions.answere}"><br><b>E.</b> ${questions.answere}</c:if></td>
						<td style="text-transform: uppercase">${questions.correct}</td>
						<td><a href="<c:url value='/edit-question-${questions.id}' />" class="btn btn-success custom-width">edit</a></td>
					</tr>
				</c:forEach>
	    		</tbody>
	    	</table>
		</div>		 	
   	</div>
</body>
</html>