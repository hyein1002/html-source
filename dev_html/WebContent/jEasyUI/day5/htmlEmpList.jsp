<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="orm.dao.SqlMapEmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SqlMapEmpDao eDao = new SqlMapEmpDao();
	List<Map<String,Object>> eList = eDao.empList(null);
%>
<table border="1" bordercolor="red">
<%
	//조회결과가 없을 때
	if(eList==null){
%>
	<tr>
		<td>조회결과가 없습니다.</td>
	</tr>
<%
}else{//조회결과가 있을 때 
	for(int i=0;i<eList.size();i++){
		Map<String,Object> rMap = eList.get(i);
%>
	<tr>
		<td><%out.print(rMap.get("ENAME")); %></td>
	</tr>
<% 
	}
}
%>
</table>