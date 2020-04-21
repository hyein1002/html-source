<%@page import="com.dept.EmpDao"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	EmpDao	ed = new EmpDao();
	List<Map<String, Object>> eList = ed.empList();
	Gson	g = new Gson();
	String temp = g.toJson(eList);
	out.print(temp);
%>