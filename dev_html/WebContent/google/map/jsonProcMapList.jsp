<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="project.restaurant.RestaurantDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	RestaurantDao	rd	= new RestaurantDao();
	Gson	g = new Gson();
	List<Map<String,Object>> rList = rd.procRestList();
	String temp = g.toJson(rList);
	out.print(temp);
%>