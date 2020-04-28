<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="orm.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String book_title = request.getParameter("book_title");
	String choMode = request.getParameter("choMode");
	BookDao	bDao = new BookDao();
	Map<String,Object> pMap = new HashMap<>();
	pMap.put("book_title",book_title);
	pMap.put("choMode",choMode);
	List<Map<String,Object>> bList = bDao.bookList(pMap);
	//out.print(bList);
%>
<table border="1" >

	<%
		for(int i=0;i<bList.size();i++){
			Map<String,Object> bMap = bList.get(i);
	%>
	<tr>
	<td id="<%=bMap.get("BOOK_NO")%>"><img src="./<% out.print(bMap.get("BOOK_IMG")); %> " width="100px" height="150px"/></td>
	<td><% out.print(bMap.get("BOOK_TITLE")); %></td>
	<td><% out.print(bMap.get("BOOK_AUTHOR")); %></td>
	<td><% out.print(bMap.get("BOOK_PUBLISH")); %></td>
	<td><% out.print(bMap.get("BOOK_DATE")); %></td>
	<td><% out.print(bMap.get("BOOK_PRICE")); %></td>
	</tr>
	<% } %>

</table>
