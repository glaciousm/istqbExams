<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>My Results</title>
	<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['line']});
        google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Day');
        data.addColumn('number', 'Score');

        data.addRows([
        	<c:forEach items="${results}" var="result">		
        		['${result.date}',  ${result.score}],
			</c:forEach>
        ]);
        var options = {
        		backgroundColor: { fill:'transparent' }
        		};
        var chart = new google.charts.Line(document.getElementById('curve_chart'));

        chart.draw(data, google.charts.Line.convertOptions(options));
      };
    </script>
</head>

<body id=body>
	<div class="generic-container" style="height: 95%; width: 96%">
		<%@include file="authheader.jsp" %>	
		<div class="panel panel-default">
			  <!-- Default panel contents -->
		  	<div class="panel-heading">
			  	<div  class="floatLeft" style="display: inline-block;">
			  		<span class="lead">Results for User ${user.firstName} ${user.lastName}</span>
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
			  	<div style="width: 100%;height: 30%;margin-top: 2%">
				  	<div style="width: 10%;height: 100%;display: inline-block;float: left;">
				  		<h5>First Name : ${user.firstName}</h5>
				  		<h5>Last Name : ${user.lastName}</h5>
				  		<h5>Username : ${user.ssoId}</h5>
				  		<h5>Total Tests Taken : ${fn:length(results)}</h5>
				  		<c:forEach items="${results}" var="result">
				  			<c:set var = "average" scope = "request" value = "${(average + result.score)}"/>
				  		</c:forEach>
				  		<h5>Average Score : <fmt:formatNumber type = "number" maxFractionDigits="1" minFractionDigits="1" value = "${average / fn:length(results)}" /></h5>
				  		<c:set var="average" value="0"></c:set>
				  	</div>
				  		<span id="curve_chart" style="float: right;height: 100%;width: 90%"></span>
			  	</div>
		  	</div>
		  	
		  	<div style="overflow:scroll; overflow-x:hidden; height: 50%;width:100%">
			<table class="table table-hover">
	    		<thead>
		      		<tr>
				        <th>User</th>
				        <th>Score</th>
				        <th>Course</th>
				        <th>Date</th>
				        <th>Status</th>
				        <th>Total Time</th>
					</tr>					
		    	</thead>
	    		<tbody>
				<c:forEach items="${results}" var="result">		
					<tr>
						<td>${result.user}</td>
						<td>${result.score}%</td>
						<td>${result.course.name}</td>
						<td>${result.date}</td>	
						<td>${result.status}</td>
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