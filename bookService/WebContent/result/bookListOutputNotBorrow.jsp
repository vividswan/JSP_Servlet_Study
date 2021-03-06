<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.bookService.vo.BookVO"%>
<%
	String nowTitle="대여 가능한 책";
boolean isLast = false;
int lastID = 0;
%>
<!DOCTYPE html>
<html>
<head>
<title>Book List System</title>
<style>
#heaer {
	width: 100%;
	height: 40px;
}

#nav {
	widht: 30%;
	height: 100px;
	float: left;
}

#emptySpace {
	width: 70%;
	height: 30px;
	float: right;
}

#content {
	width: 70%;
	height: 70px;
	float: right;
}

table,th,td {
	border:1px solid black;
	border-collapse:collapse;
	text-align: center;
}
</style>
</head>
<body>
	<div id="header">
		<h1 align="center"><%=nowTitle%></h1>
	</div>
	<div id="nav">
		<jsp:include page="../navigation.jsp" />
	</div>
	<div id="emptySpace"></div>
	<div id="content">
		<%
			ArrayList<BookVO> list = (ArrayList<BookVO>) request.getAttribute("list");
				if (!list.isEmpty()) {
		%>
		<table style="width:95%">
			<tr>
				<th>ID</th>
				<th>이름</th>
				<th>저자</th>
				<th>가격</th>
				<th>대여 가능</th>
				<th>대여 횟수</th>
			</tr>
			<%
				for (int i = 0; i < list.size(); i++) {
					BookVO book = list.get(i);
					isLast = book.isLastData();
					lastID=book.getID();
			%>
			<tr>
				<td><%=book.getID()%></td>
				<td><%=book.getName()%></td>
				<td><%=book.getAuthor()%></td>
				<td><%=book.getPrice()%></td>
				<td>
					<%
						if (book.isBorrowed())
						out.print("N");
					else
						out.print("Y");
					%>
				</td>
				<td><%=book.getBorrowCnt()%></td>
			</tr>
			<%
				}
			} else {
				out.print("<h3>등록된 책 정보가 없습니다.</h3>");
			}
			%>
		</table>
			<%if(!isLast&&!list.isEmpty()){ %>
			<a href='pageUtil.jsp?path=notBorrowedBookPage&LAST_SEQ_NO=<%=lastID %>'>다음 페이지</a>
		<%} %>
	</div>

</body>
</html>