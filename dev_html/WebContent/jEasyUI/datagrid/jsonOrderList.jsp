<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.orderbasket.OrderBaskDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	OrderBaskDao obd = new OrderBaskDao();
	List<Map<String, Object>> olist = null;
	olist = obd.orderbasketList();
	Gson g = new Gson();
	String temp = g.toJson(olist);
	out.print(temp);
	
%>