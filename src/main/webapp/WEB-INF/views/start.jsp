<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Test Settings</title>
	<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
	<script type="text/javascript">
	
			function checkTotal(){
				var sum = 0;
				
				var ch1 = document.getElementById("ch1").value;
				var ch2 = document.getElementById("ch2").value;
				var ch3 = document.getElementById("ch3").value;
				var ch4 = document.getElementById("ch4").value;
				var ch5 = document.getElementById("ch5").value;
				var ch6 = document.getElementById("ch6").value;
				sum = parseInt(ch1) + parseInt(ch2) + parseInt(ch3) + parseInt(ch4) + parseInt(ch5) + parseInt(ch6); 
				
				console.log(sum);
				if (sum !=40) {
				
					document.getElementById("submitBtn").disabled = true;
				} else {
					document.getElementById("submitBtn").disabled = false;
				}
			}
	
            function changeEnable(){
            	if (document.getElementById("settings").checked) {
            		randomChapters();
            		document.getElementById("ch1").readOnly  = true;
            		document.getElementById("ch2").readOnly  = true;
            		document.getElementById("ch3").readOnly  = true;
            		document.getElementById("ch4").readOnly  = true;
            		document.getElementById("ch5").readOnly  = true;
            		document.getElementById("ch6").readOnly  = true;
				} else {
					document.getElementById("ch1").readOnly  = false;
            		document.getElementById("ch2").readOnly  = false;
            		document.getElementById("ch3").readOnly  = false;
            		document.getElementById("ch4").readOnly  = false;
            		document.getElementById("ch5").readOnly  = false;
            		document.getElementById("ch6").readOnly  = false;
				}
            	
            }
            
            function randomChapters(){
            	
            	var ch1List = [7, 8];
            	var ch2List = [5, 6];
            	var ch3List = [2, 3];
            	var ch4List = [12, 15];
            	var ch5List = [7, 8];
            	var ch6List = [3, 4];
            	
            	var ch1 = ch1List[0];
            	var ch2 = ch2List[0];
            	var ch3 = ch3List[0];
            	var ch4 = ch4List[0];
            	var ch5 = ch5List[0];
            	var ch6 = ch6List[0];
            	
            	var x= 4;
            	
            	
            	
            	var randNum = 0;
            	
            	for (var i = 0; i < x; i++) {
            		
					randNum = Math.round((Math.random() * 5) + 1);	
					switch (randNum) {
					case 1:
						if (document.getElementById("ch1").value != ch1List[ch1List.length -1]) {	
							ch1++;
							document.getElementById("ch1").value = ch1;
							
						} else {
							x++;
						}
						break;
					case 2:
						if (document.getElementById("ch2").value != ch2List[ch2List.length -1]) {
							ch2++;
							document.getElementById("ch2").value = ch2;
							
						} else {
							x++;
						}
						break;
					case 3:
						if (document.getElementById("ch3").value != ch3List[ch3List.length -1]) {
							ch3++;
							document.getElementById("ch3").value = ch3;
							
						} else {
							x++;
						}
						break;
					case 4:
						if (document.getElementById("ch4").value != ch4List[ch4List.length -1]) {
							ch4++;
							document.getElementById("ch4").value = ch4;
							
						} else {
							x++;
						}
						break;
					case 5:
						if (document.getElementById("ch5").value != ch5List[ch5List.length -1]) {
							ch5++;
							document.getElementById("ch5").value = ch5;
							
						} else {
							x++;
						}
						break;
					case 6:
						if (document.getElementById("ch6").value != ch6List[ch6List.length -1]) {
							ch6++;
							document.getElementById("ch6").value = ch6;
							
						} else {
							x++;
						}
						break;
					}
				}
            }
            
            window.onload = function () {
            	randomChapters();
            };
        </script>
</head>
<body style="height:100%; width:100%;">
	<div class="generic-container" style="height: 80%;">
		<%@include file="authheader.jsp" %>
		<div><h4>Please set the settings as you please, or leave them in the default</h4></div>
		<br>
		<br>
		<div>
		
		<form id="myForm" method="post" action="/istqbExams/random">
  		  <div style="position: absolute;">
	  		  <div style="margin-left: 55px">		  
			  <label>Question destribution in chapters</label><br>
			  
				  <table>
					  <thead>
						  <tr>
						  <th></th>
						  <th></th>
						  <th></th>
						  </tr>
					  </thead>
					  <tbody>
						  <tr>
						  	  <td><h5>Chapter 1  </h5></td>
						  	  <td> : </td>
							  <td><input id="ch1" class="form-control" type="number" name="ch1" value="7" readonly="readonly"/></td>
						  </tr>
						  <tr>
						  	  <td><h5>Chapter 2  </h5></td>
						  	  <td> : </td>
							  <td><input id="ch2" class="form-control" type="number" name="ch2" value="5" readonly="readonly"/></td>
						  </tr>
						  <tr>
						  	  <td><h5>Chapter 3  </h5></td>
						  	  <td> : </td>
							  <td><input id="ch3" class="form-control" type="number" name="ch3" value="2" readonly="readonly"/></td>
						  </tr>
						  <tr>
						  	  <td><h5>Chapter 4  </h5></td>
						  	  <td> : </td>
							  <td><input id="ch4" class="form-control" type="number" name="ch4" value="12" readonly="readonly"/></td>
						  </tr>
						  <tr>
						  	  <td><h5>Chapter 5  </h5></td>
						  	  <td> : </td>
							  <td><input id="ch5" class="form-control" type="number" name="ch5" value="7" readonly="readonly"/></td>
						  </tr>
						  <tr>
						  	  <td><h5>Chapter 6  </h5></td>
						  	  <td> : </td>
							  <td><input id="ch6" class="form-control" type="number" name="ch6" value="3" readonly="readonly"/></td>
						  </tr>
					  </tbody>
				  
				  </table>
				  <div>
				  <label>Select Course</label>
				  <select name="course" style="text-transform: uppercase" class="form-control">
						<c:forEach var="item" varStatus="loop" items="${courseList}">
        					<option value="${item}">${item}</option>
   						 </c:forEach>
				  </select>		
				  </div>
				  <!-- <input id="settings" type="checkbox" name="settings" value="" onchange="changeEnable()" checked="checked"><label style="position: relative;vertical-align: middle;margin-left: 5px;">Change manually the chapters questions</label> -->
			  </div>
		  </div>
		  <input id="submitBtn" class="btn btn-primary" type="submit" value="Start" style="position: absolute; bottom:10px; right:49%"/>
		
		</form>
		</div>
	</div>
</body>

</html>