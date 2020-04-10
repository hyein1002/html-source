<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="project.restaurant.RestaurantDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	RestaurantDao	rDao	= new RestaurantDao();
	List<Map<String,Object>> mrList = rDao.mapRestList();
	Gson	g	= new Gson();
	String imsi = g.toJson(mrList);
	out.print(imsi);
	//out.print(mrList);//gson타입으로 바꾸지 않으면 출력되지않는다. 
%>