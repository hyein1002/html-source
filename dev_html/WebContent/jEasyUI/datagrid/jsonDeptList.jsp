<%@page import="com.dept.DeptVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.dept.DeptDao"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DeptDao	ddao = new DeptDao();
	List<Map<String, Object>> dlist = null;
	dlist = ddao.deptList();
	Gson g = new Gson();
	String temp = g.toJson(dlist);
	out.print(temp);

%>
