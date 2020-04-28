<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="orm.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BookDao bDao = new BookDao();
	List<Map<String,Object>> bList = bDao.bookList(null);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<style type="text/css">
	table{
		width:800px;
	}
	img{
		width:100px;
		height:150px;
	}
</style>
</head>
<body>
<table border="1" >
	<tr>
		<th>도서이미지</th>
		<th>도서명</th>
		<th>저자</th>
		<th>출판사</th>
		<th>출간일</th>
		<th>가격</th>
	</tr>
	<%
		for(int i=0;i<bList.size();i++){
			Map<String,Object> bMap = bList.get(i);
	%>
	<tr>
	<td ><img src="./<% out.print(bMap.get("BOOK_IMG")); %>"/></td>
	<td><% out.print(bMap.get("BOOK_TITLE")); %></td>
	<td><% out.print(bMap.get("BOOK_AUTHOR")); %></td>
	<td><% out.print(bMap.get("BOOK_PUBLISH")); %></td>
	<td><% out.print(bMap.get("BOOK_DATE")); %></td>
	<td><% out.print(bMap.get("BOOK_PRICE")); %></td>
	</tr>
	<% } %>

</table>
</body>
</html>