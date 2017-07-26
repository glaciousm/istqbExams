<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Users List</title>
	<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
	<script type="text/javascript">
            function changeColor(index, name){
            	var blocks = document.getElementsByClassName("questionBox");
            	
            	var button = document.getElementById("submitButton");
            	
            	var choiseA = document.getElementsByClassName("choiseA");
            	var choiseB = document.getElementsByClassName("choiseB");
            	var choiseC = document.getElementsByClassName("choiseC");
            	var choiseD = document.getElementsByClassName("choiseD");
            	var choiseE = document.getElementsByClassName("choiseE");
            	
            	if (choiseE[index] == null || typeof  choiseE[index] == 'undefined') {

            		if (choiseA[index].checked || choiseB[index].checked || choiseC[index].checked || choiseD[index].checked) {   
                		
                		if ((choiseA[index].checked && choiseB[index].checked) || (choiseA[index].checked && choiseC[index].checked) || (choiseA[index].checked && choiseD[index].checked) || (choiseB[index].checked && choiseC[index].checked) || (choiseB[index].checked && choiseD[index].checked) || (choiseC[index].checked && choiseD[index].checked)){
    						button.disabled = true;
    						if (name==="choiseA") {
								choiseB[index].checked = false;
								choiseC[index].checked = false;
								choiseD[index].checked = false;
								choiseE[index].checked = false;
							} else if(name==="choiseB"){
								choiseA[index].checked = false;
								choiseC[index].checked = false;
								choiseD[index].checked = false;
								choiseE[index].checked = false;
							} else if(name==="choiseC"){
								choiseB[index].checked = false;
								choiseA[index].checked = false;
								choiseD[index].checked = false;
								choiseE[index].checked = false;
							} else if(name==="choiseD"){
								choiseB[index].checked = false;
								choiseC[index].checked = false;
								choiseA[index].checked = false;
								choiseE[index].checked = false;
							} else if(name==="choiseE"){
								choiseB[index].checked = false;
								choiseC[index].checked = false;
								choiseD[index].checked = false;
								choiseA[index].checked = false;
							}
    					} else {
    						blocks[index].style.background = "#d8ebff";
    						button.disabled = false;    						
    					}
                	} else {
                		blocks[index].style.background = "#e3e4e8";
                		button.disabled = false;
                		   	}
            		
				} else {
					if (choiseA[index].checked || choiseB[index].checked || choiseC[index].checked || choiseD[index].checked || choiseE[index].checked) {   
						
	            		if ((choiseA[index].checked && choiseB[index].checked) || (choiseA[index].checked && choiseC[index].checked) || (choiseA[index].checked && choiseD[index].checked) || (choiseA[index].checked && choiseE[index].checked) || (choiseB[index].checked && choiseC[index].checked) || (choiseB[index].checked && choiseD[index].checked) || (choiseB[index].checked && choiseE[index].checked) || (choiseC[index].checked && choiseD[index].checked) || (choiseC[index].checked && choiseE[index].checked) || (choiseD[index].checked && choiseE[index].checked)){
    						button.disabled = true;
    						if (name==="choiseA") {
								choiseB[index].checked = false;
								choiseC[index].checked = false;
								choiseD[index].checked = false;
								choiseE[index].checked = false;
							} else if(name==="choiseB"){
								choiseA[index].checked = false;
								choiseC[index].checked = false;
								choiseD[index].checked = false;
								choiseE[index].checked = false;
							} else if(name==="choiseC"){
								choiseB[index].checked = false;
								choiseA[index].checked = false;
								choiseD[index].checked = false;
								choiseE[index].checked = false;
							} else if(name==="choiseD"){
								choiseB[index].checked = false;
								choiseC[index].checked = false;
								choiseA[index].checked = false;
								choiseE[index].checked = false;
							} else if(name==="choiseE"){
								choiseB[index].checked = false;
								choiseC[index].checked = false;
								choiseD[index].checked = false;
								choiseA[index].checked = false;
							}
						} else {
							blocks[index].style.background = "#d8ebff";
							button.disabled = false;							
						}
	            	} else {
	            		blocks[index].style.background = "#e3e4e8";
	            		button.disabled = false;	            		
	            	}
					
				}
            	var counter = 0;
            	for (var i = 0; i < blocks.length; i++) {
					if (blocks[i].style.background == "rgb(216, 235, 255)") {
						counter++;
					}
				}
            	document.getElementById("remainingQ").innerHTML = counter + "/40";
				if (counter ==40) {
					document.getElementById("remainingQ").style.color = "#03c103"
				}
            }
            
            function startTimer(duration, display) {
                var timer = duration, minutes, seconds;
                setInterval(function () {
                    minutes = parseInt(timer / 60, 10)
                    seconds = parseInt(timer % 60, 10);

                    minutes = minutes < 10 ? "0" + minutes : minutes;
                    seconds = seconds < 10 ? "0" + seconds : seconds;

                    display.textContent = minutes + ":" + seconds;
					if (minutes<10) {
						document.getElementById("time").style.color = "#e21802"
					}
					if (minutes==0 && seconds ==0) {
						document.getElementById("myForm").submit();
					}
                    if (--timer < 0) {
                        timer = duration;
                    }
                }, 1000);
            }

            window.onload = function () {
                var countTime = 60 * 60,
                    display = document.querySelector('#time');
                startTimer(countTime, display);
            };
        </script>
</head>

<body>
	<div class="generic-container" style="height:95%;width:95%;left:1%">
		<%@include file="authheader.jsp" %>	
		<div class="panel panel-default"  style="overflow:scroll; overflow-x:hidden; height:90%;width:100%">
			  <!-- Default panel contents -->
		  	<div class="panel-heading" style="position: absolute; width: 95.5%"><span class="lead">Random Test </span><div style ="float: right;"><font size ="4">Remaining Time : <span id="time" style="color: #03c103">60:00</span> minutes</font></div></div>		  	
		  	<form:form id="myForm" method="POST" modelAttribute="random" action="/istqbExams/testresults" class="form-horizontal">			
			<br>
			<br>
			<br>
			<c:forEach items="${random.questionList}" var="questions" varStatus="loop">
				<div class="questionBox" style="background-color:#e3e4e8; margin: 10px;">
				<h3>Question ${loop.index+1}  [Ch.${questions.chapter}]</h3>
				<form:input type="hidden" path="questionList[${loop.index}].id" id="id${loop.index}" />
				<h4>${questions.context}</h4>				
				<h4><b>Answer</b></h4>
				<form:input type="hidden" path="questionList[${loop.index}].correct" id="correct${loop.index}" />
				<h4><form:checkbox name="selected" value="a" path="questionList[${loop.index}].selected" class="choiseA" onChange="changeColor(${loop.index}, 'choiseA')"/> <b>A.</b> ${questions.answera}</h4>
				<h4><form:checkbox name="selected" value="b" path="questionList[${loop.index}].selected" class="choiseB" onChange="changeColor(${loop.index}, 'choiseB')"/> <b>B.</b> ${questions.answerb}</h4>
				<h4><form:checkbox name="selected" value="c" path="questionList[${loop.index}].selected" class="choiseC" onChange="changeColor(${loop.index}, 'choiseC')"/> <b>C.</b> ${questions.answerc}</h4>
				<h4><form:checkbox name="selected" value="d" path="questionList[${loop.index}].selected" class="choiseD" onChange="changeColor(${loop.index}, 'choiseD')"/> <b>D.</b> ${questions.answerd}</h4>
    			<c:choose><c:when test="${not empty questions.answere}"><h4><form:checkbox name="selected" value="e" path="questionList[${loop.index}].selected" class="choiseE" onChange="changeColor(${loop.index}, 'choiseE')"/> <b>E.</b> ${questions.answere}</h4></c:when><c:otherwise><h4 style="display: none" ><form:checkbox name="selected" value="e" path="questionList[${loop.index}].selected" class="choiseE" onChange="changeColor(${loop.index}, 'choiseE')"/> <b>E.</b> ${questions.answere}</h4></c:otherwise></c:choose>
    			</div>
			</c:forEach>
			
			<input type="submit" value="Submit" class="btn btn-primary btn-sm" id="submitButton"/>
			</form:form>			
		</div>		 	
		<div><font size ="3">Answered questions: <span id ="remainingQ" style="color: #e21802">0/40</span></font></div>
   	</div>
</body>
