<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="orm.dao.SqlCommonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String param = request.getParameter("zdo");
	SqlCommonDao scDao = new SqlCommonDao();
	Map<String, Object> pMap = new HashMap<String, Object>();
	pMap.put("zdo",param );
	List<Map<String,Object>> sList = scDao.getSIGUList(pMap);
	Gson g = new Gson();
	String temp = g.toJson(sList);
	out.print(temp);
%>
    