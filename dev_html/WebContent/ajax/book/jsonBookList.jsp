<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="orm.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//사용자로부터 입력받은 문자열(a,aj,ajx,ajax....) - 초성검색 하기와 초성검색 대상이 아닌 경우
	String book_title = request.getParameter("book_title");
	BookDao bDao = new BookDao();
	Map<String,Object> pMap = new HashMap<>();
	pMap.put("book_title",book_title);
	List<Map<String,Object>> bList = bDao.bookList(pMap);
	Gson g = new Gson();
	String temp = g.toJson(bList);
	out.print(temp);
%>