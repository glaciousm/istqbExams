<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<div class="authbar">
		<span>Welcome  <strong>${loggedinuser} </strong>.</span><sec:authorize access="hasRole('ADMIN') OR hasRole('MANAGER')"><a href="<c:url value='/newuser' />">      Add New User </a> / <a href="<c:url value='/userlist' />">      List of Users </a>  / <a href="<c:url value='/resultlist' />">      Total Results </a></sec:authorize><span class="floatRight"><a href="<c:url value="/logout" />">Logout</a></span><span class="floatRight"><a href="<c:url value='/newquestion' />">Add New Question</a></span><span class="floatRight"><a href="<c:url value='/random' />">Take a Test</a></span><span class="floatRight"><a href="<c:url value='/home' />">Home</a></span><span class="floatRight"><a href="<c:url value='/list' />">List of Questions</a></span>
	</div>
	
	
