<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- jsp주석이라 소스보기를 하면 안보임
	//이름 : mem_name
	//주소 : mem_addr
	//전화번호 : mem_tel
 --%>
 
<%

	List<Map<String, Object>> cusList = new ArrayList<>();
	Map<String, Object> rMap = null;
	Gson g = new Gson();

	rMap = new HashMap<>();
	rMap.put("mem_name", "이순신");
	rMap.put("mem_addr", "서울시 마포구 공덕동");
	rMap.put("mem_tel", "025559990");
	cusList.add(rMap);
	
	rMap = new HashMap<>();
	rMap.put("mem_name", "김유신");
	rMap.put("mem_addr", "서울시 영등포구 당산동");
	rMap.put("mem_tel", "025559991");
	cusList.add(rMap);

	rMap = new HashMap<>();
	rMap.put("mem_name", "강감찬");
	rMap.put("mem_addr", "서울시 금천구 가산동");
	rMap.put("mem_tel", "025559992");
	cusList.add(rMap);

	String result = g.toJson(cusList);
	out.print(result);

%>