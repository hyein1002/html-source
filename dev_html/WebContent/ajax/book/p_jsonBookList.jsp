<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="orm.dao.P_BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	P_BookDao bDao = new P_BookDao();
	String title = request.getParameter("book_title");
	Map<String,Object> pMap = new HashMap<>();
	pMap.put("book_title",title);
	List<Map<String,Object>> bList = bDao.bookList(pMap);
	Gson g = new Gson();
	String temp = g.toJson(bList);
	out.print(temp);
%>