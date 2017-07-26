<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Question Form</title>
	<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>

<body>
 	<div class="generic-container">
		<%@include file="authheader.jsp" %>

		<div class="well lead">Question Form</div>
	 	<form:form method="POST" modelAttribute="question" class="form-horizontal">
			<form:input type="hidden" path="id" id="id"/>
			
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="context">Question</label>
					<div class="col-md-7">
						<form:textarea path="context" rows="10" cols="30"  id="context" class="form-control" style="height:200px;"/>
						<%-- <form:input type="text" path="context" id="context" class="form-control input-sm" style="height:200px;"/> --%>
					</div>
				</div>
			</div>
	
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="chapter">Chapter</label>
					<div class="col-md-7">
						<form:input type="number" path="chapter" id="chapter" class="form-control input-sm" />
					</div>
				</div>
			</div>
	
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="difficulty">Difficulty</label>
					<div class="col-md-7">
						<form:input type="number" path="difficulty" id="difficulty" class="form-control input-sm" />
					</div>
				</div>
			</div>
	
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="answera">Response A</label>
					<div class="col-md-7">
						<form:input type="text" path="answera" id="answera" class="form-control input-sm" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="answerb">Response B</label>
					<div class="col-md-7">
						<form:input type="text" path="answerb" id="answerb" class="form-control input-sm" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="answerc">Response C</label>
					<div class="col-md-7">
						<form:input type="text" path="answerc" id="answerc" class="form-control input-sm" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="answerd">Response D</label>
					<div class="col-md-7">
						<form:input type="text" path="answerd" id="answerd" class="form-control input-sm" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="answere">Response E</label>
					<div class="col-md-7">
						<form:input type="text" path="answere" id="answere" class="form-control input-sm" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="correct">Correct Answer</label>
					<div class="col-md-7">
						<form:select path="correct" style="text-transform: uppercase">
							 <form:option value="${question.correct}" />
    						 <form:options items="${correct}" />
						</form:select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="course">Course</label>
					<div class="col-md-7">
					${question.course}
						<form:select path="course" style="text-transform: uppercase">
							<form:option value="${question.course}" />
							<form:options items="${course}" />					 
						</form:select>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-actions floatRight">
					<c:choose>
						<c:when test="${edit}">
							<input type="submit" value="Update" class="btn btn-primary btn-sm"/> or <a href="<c:url value='/list' />">Cancel</a>
						</c:when>
						<c:otherwise>
							<input type="submit" value="Add" class="btn btn-primary btn-sm"/> or <a href="<c:url value='/list' />">Cancel</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
	
		</form:form>
	</div>
</body>
</html>