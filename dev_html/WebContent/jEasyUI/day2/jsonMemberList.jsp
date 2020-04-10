<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="jeasyui.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- html땅 => jsp주석으로 반드시 처리할것 --%>
<%
	//스크립틀릿-자바땅
	MemberDao	mdao = new MemberDao();
	List<Map<String, Object>> mList = null;
	mList = mdao.procMemberList();
	Gson	g = new Gson();
	String temp = g.toJson(mList);
	out.print(temp);

%>