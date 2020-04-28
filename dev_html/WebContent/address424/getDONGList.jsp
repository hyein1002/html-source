<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="orm.dao.SqlCommonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String zdo = request.getParameter("zdo");
	String sigu = request.getParameter("sigu");
	SqlCommonDao scDao = new SqlCommonDao();
	Map<String, Object> pMap = new HashMap<String, Object>();
	pMap.put("zdo",zdo );
	pMap.put("sigu",sigu);
	List<Map<String,Object>> dList = scDao.getDONGList(pMap);
	Gson g = new Gson();
	String temp = g.toJson(dList); 
/* 	for(int i=0;i<dList.size();i++){
		out.print(dList.get(i));
	} */
	out.print(temp);
%>
    