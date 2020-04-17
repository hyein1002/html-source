<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String,Object>> cusList = new ArrayList<>();
	Map<String,Object> rMap = null;
	rMap = new HashMap<>();
	rMap.put("mem_name", "유재석");
	rMap.put("mem_addr", "서울시 금천구 가산동");
	rMap.put("mem_tel", "021112222");
	cusList.add(rMap);
	rMap = new HashMap<>();
	rMap.put("mem_name", "강호동");
	rMap.put("mem_addr", "서울시 강서구 우장산동");
	rMap.put("mem_tel", "022223333");
	cusList.add(rMap);
	rMap = new HashMap<>();
	rMap.put("mem_name", "신동엽");
	rMap.put("mem_addr", "서울시 강남구 압구정동");
	rMap.put("mem_tel", "024445555");
	cusList.add(rMap);
	
	Gson g = new Gson();
	String temp = g.toJson(cusList);
	out.print(temp);


%>