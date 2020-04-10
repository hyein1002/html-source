<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//컬럼의 이름과 값에 ""붙어야 하는데 자바는 인식할수 없어서 \를 앞에 붙여서 구분해줘야 한다.
	//JSON포맷을 javascript코드에서 활용하기 연습
	out.print("[{\"DEPTNO\":10,\"DNAME\":\"영업부\",\"LOC\":\"대전\"},{\"DEPTNO\":20,\"DNAME\":\"개발부\",\"LOC\":\"서울\"},{\"DEPTNO\":30,\"DNAME\":\"총무부\",\"LOC\":\"부산\"}]");
%>