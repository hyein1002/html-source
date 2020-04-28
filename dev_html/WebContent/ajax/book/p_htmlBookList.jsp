<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="orm.dao.P_BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	P_BookDao bDao = new P_BookDao();
	List<Map<String,Object>> bList = bDao.bookList(null);
%>
<table>
	<tr>
		<th>도서제목</th>
	</tr>
<%
	for(int i =0;i<bList.size();i++){
		Map<String,Object> rMap = bList.get(i);	
%>
	<tr>
		<td><% out.print(rMap.get("BOOK_TITLE")); %></td>
	</tr>
	<% } %>
</table>