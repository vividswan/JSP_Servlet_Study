<%@ page contentType="text/html; charset=UTF-8"%>
<%
String nowTitle = "홈";
%>
<!DOCTYPE html>
<html>
<head>
<title>Book Service System</title>
<style>
#heaer {
	width: 100%;
	height: 40px;
}

#nav {
widht:30%;
height:100px;
float:left;	
}
#content{
width:70%;
height: 100px;
float:right;
}
</style>
</head>
<body>
	<div id="header">
		<h1 align="center"><%=nowTitle%></h1>
	</div>
	<div id="nav">
	<jsp:include page="navigation.jsp" />
	</div>
	<div id="content">
	</div>

</body>
</html>