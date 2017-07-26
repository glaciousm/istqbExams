<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Test Results</title>
	<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>
<body style="height:100%;width:100%">
	<div class="generic-container" style="height:95%;width:96%" >
		<%@include file="authheader.jsp" %>
		
		
		<c:choose>
		    <c:when test="${fn:length(wrong) gt 25}">
		        <div class="alert alert-danger lead">
			    	${Failed}
				</div>
		    </c:when>    
		    <c:otherwise>
		        <div class="alert alert-success lead">
			    	${Passed}
				</div>
		    </c:otherwise>
		</c:choose>
		<div>
		<label>Your Wrong answered questions are:</label>
		<div  style="background-color:white; overflow:scroll; overflow-x:hidden; height:80%;width:100%" >
		<c:forEach items="${wrong}" var="questions" varStatus="loop">
		<div id="questionBox" style="margin: 10px;">
				<h3>Question ${questions.id}</h3>
				<h4>${questions.context}</h4>				
				<h4><b>Answer</b></h4>
				<c:choose>
				<c:when test="${questions.correct == 'a'}"><h4 style="color: green"><b>A.</b> ${questions.answera}</h4></c:when><c:otherwise><h4 style="color: red"><b>A.</b> ${questions.answera}</h4></c:otherwise>
				</c:choose><c:choose>
				<c:when test="${questions.correct == 'b'}"><h4 style="color: green"><b>A.</b> ${questions.answerb}</h4></c:when><c:otherwise><h4 style="color: red"><b>A.</b> ${questions.answerb}</h4></c:otherwise>
				</c:choose><c:choose>
				<c:when test="${questions.correct == 'c'}"><h4 style="color: green"><b>A.</b> ${questions.answerc}</h4></c:when><c:otherwise><h4 style="color: red"><b>A.</b> ${questions.answerc}</h4></c:otherwise>
				</c:choose><c:choose>
				<c:when test="${questions.correct == 'd'}"><h4 style="color: green"><b>A.</b> ${questions.answerd}</h4></c:when><c:otherwise><h4 style="color: red"><b>A.</b> ${questions.answerd}</h4></c:otherwise>
				</c:choose><c:choose>
    			<c:when test="${questions.correct == 'e'}"><c:if test="${not empty questions.answere}"><h4 style="color: green"><b>A.</b> ${questions.answere}</h4></c:if></c:when><c:otherwise><c:if test="${not empty questions.answere}"><h4 style="color: red"><b>A.</b> ${questions.answere}</h4></c:if></c:otherwise>
    			</c:choose>
    			</div>
		
		</c:forEach>
		</div>
		</div>
	</div>
</body>