<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="orm.dao.SqlMapEmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SqlMapEmpDao eDao = new SqlMapEmpDao();
	List<Map<String,Object>> eList = eDao.empList(null);
	Gson g = new Gson(); 
	String temp = g.toJson(eList);
	out.print(temp);
	
%>