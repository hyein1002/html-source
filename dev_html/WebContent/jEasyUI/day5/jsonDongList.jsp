<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="orm.dao.SqlCommonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pdong = request.getParameter("dong");
	SqlCommonDao scDao = new SqlCommonDao();
	Map<String,Object> pMap = new HashMap<>();
	//pMap.put("dong",pdong);
	pMap.put("dong","화곡");
	List<Map<String, Object>> dList = scDao.dongList(pMap);
	Gson g = new Gson();
	String temp = g.toJson(dList);
	out.print(temp);
%>