<%@page import="project.restaurant.RestaurantDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//mapDesign.html문서에서 사용자가 화면에 입력한 아이디 가져오기
	String mem_id = request.getParameter("mem_id");
	String mem_pw = request.getParameter("mem_pw");
	//out.print(mem_id+"님 환영합니다.");
	RestaurantDao	rdao	= new RestaurantDao();
	String msg = null;
	msg=rdao.login(mem_id, mem_pw);
	out.print(msg);
%>