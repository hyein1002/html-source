<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="orm.dao.SqlCommonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SqlCommonDao scDao = new SqlCommonDao();
	List<Map<String,Object>> zList = scDao.getZDOList();
	Gson g = new Gson();
	String temp = g.toJson(zList);
	out.print(temp);
%>
