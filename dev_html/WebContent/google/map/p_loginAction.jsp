<%@page import="project.restaurant.RestaurantDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String u_id = request.getParameter("mem_id");
	String u_pw = request.getParameter("mem_pw");
	RestaurantDao rd = new RestaurantDao();
	String msg = null;
	msg = rd.login(u_id, u_pw);
	out.print(msg);
%>
