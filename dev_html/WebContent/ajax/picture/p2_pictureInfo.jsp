<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("id");
	String names[] = {"picture1.jpg","picture2.jpg","picture3.jpg","picture4.jpg"};
	String cname = null;
	
	for(int i =0;i<names.length;i++){
		if(name.equals(names[i])){
			cname = names[i];
		}
	}
%>
<img src="./<%out.print(cname);%>" width='600px' height='500px' />