<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link href="<c:url value='/static/css/menu.css' />" rel="stylesheet"></link>

<div class="menuBar">
	<button class="dropbtn" onclick="window.location.href='<c:url value='/home' />'">Home</button>
	<sec:authorize access="hasRole('ADMIN') OR hasRole('MANAGER')">
	<div class="dropdown">
	  <button class="dropbtn">Users</button>
	  <div class="dropdown-content">
	    <a href="<c:url value='/userlist' />">List of Users</a>
	    <a href="<c:url value='/newuser' />">Add new User</a>
	  </div>
	</div>
	</sec:authorize>
	<div class="dropdown">
	  <button class="dropbtn">Results</button>
	  <div class="dropdown-content">
	<sec:authorize access="hasRole('ADMIN') OR hasRole('MANAGER')">
	    <a href="<c:url value='/resultlist' />">Total Results</a>
	</sec:authorize>
	    <a href="<c:url value='/myresults' />">My Results</a>
	  </div>
	</div>
	<sec:authorize access="hasRole('ADMIN') OR hasRole('MANAGER')">
	<div class="dropdown">
	  <button class="dropbtn">Courses</button>
	  <div class="dropdown-content">
	    <a href="<c:url value='/courselist' />">List of Courses</a>
	    <a href="<c:url value='/newcourse' />">Add new Course</a>
	  </div>
	</div>
	</sec:authorize>
	<sec:authorize access="hasRole('ADMIN') OR hasRole('MANAGER')">
	<div class="dropdown">
	  <button class="dropbtn">Questions</button>
	  <div class="dropdown-content">
	    <a href="<c:url value='/list' />">List of Questions</a>
	    <a href="<c:url value='/newquestion' />">Add new Question</a>
	  </div>
	</div>
	</sec:authorize>
	  <button class="dropbtn" onclick="window.location.href='<c:url value='/random' />'">Take a Test</button>
	  <button class="dropbtn" onclick="window.location.href='<c:url value='/profile' />'">Profile</button>
	  <button class="dropbtn" onclick="window.location.href='<c:url value='/logout' />'">Logout</button>
</div>
	
