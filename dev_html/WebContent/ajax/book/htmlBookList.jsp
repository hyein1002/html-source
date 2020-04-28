<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="orm.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BookDao bDao = new BookDao();
	List<Map<String,Object>> bList = bDao.bookList(null);
%>
<table border="1" bordercolor="red">
<tr>
<th>책제목</th>

</tr>
<%
	for(int i=0;i<bList.size();i++){
		Map<String,Object> rMap = bList.get(i);
%>
<tr>
<td><% out.print(rMap.get("BOOK_TITLE")); %></td>
</tr>
<% 
	}
%>
</table>