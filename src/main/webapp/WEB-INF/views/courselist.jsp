<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Course List</title>
	<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>

<body>
	<div class="generic-container">
		<%@include file="authheader.jsp" %>	
		<div class="panel panel-default">
			  <!-- Default panel contents -->
		  	<div class="panel-heading"><span class="lead">List of Users </span></div>
			<table class="table table-hover">
	    		<thead>
		      		<tr>
				        <th>ID</th>
				        <th>Name</th>
				        <sec:authorize access="hasRole('ADMIN') or hasRole('MANAGER')">
				        	<th width="100"></th>
				        </sec:authorize>
				        <sec:authorize access="hasRole('ADMIN') or hasRole('MANAGER')">
				        	<th width="100"></th>
				        </sec:authorize>
				        
					</tr>
		    	</thead>
	    		<tbody>
				<c:forEach items="${courseList}" var="course">
					<tr>
						<td>${course.id}</td>
						<td>${course.name}</td>
					    <sec:authorize access="hasRole('ADMIN') or hasRole('MANAGER')">
							<td><a href="<c:url value='/edit-course-${course.id}' />" class="btn btn-success custom-width">edit</a></td>
				        </sec:authorize>
				        <sec:authorize access="hasRole('ADMIN')">
				        	<td><a onclick="return confirm('Are you sure you want to continue?')" href="<c:url value='/clear-course-${course.id}' />" class="btn btn-warning custom-width">Clear All</a></td>
        				</sec:authorize>
				        <sec:authorize access="hasRole('ADMIN')">
								<td><a onclick="return confirm('Are you sure you want to continue?')" href="<c:url value='/delete-course-${course.id}' />" class="btn btn-danger custom-width">delete</a></td>
        				</sec:authorize>
					</tr>
				</c:forEach>
	    		</tbody>
	    	</table>	    	
		</div>
		<sec:authorize access="hasRole('ADMIN')">
		 	<div class="well">
		 		<a href="<c:url value='/newcourse' />">Add new Course</a>
		 	</div>
	 	</sec:authorize>
   	</div>
</body>
</html>