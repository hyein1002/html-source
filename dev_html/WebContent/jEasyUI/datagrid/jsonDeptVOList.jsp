<%@page import="com.dept.DeptVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.dept.DeptDao"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DeptDao	ddao = new DeptDao();
	List<DeptVO> dlist = null;
	dlist = ddao.deptVOList();
	Gson g = new Gson();
	String temp = g.toJson(dlist);
	out.print(temp);
%>
