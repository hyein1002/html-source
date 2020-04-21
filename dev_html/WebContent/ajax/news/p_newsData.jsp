<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
	int x = 1;
	public String newsList(String news[]){
		StringBuilder sb = new StringBuilder();
		sb.append(news[0]+" / 취재기자 : "+news[1]);
		return sb.toString();
	}
%>
<%
	String news1[] = {"코로나19 확진자 13명 늘어 1만674명…서울 47일만에 0명(종합)","abbie","https://news.naver.com/main/read.nhn?mode=LPOD&mid=sec&oid=001&aid=0011559000&isYeonhapFlash=Y&rc=N"};
	String news2[] = {"\'코로나 여파\' 3월 지방 주택거래량 전달보다 10.6% 줄어","banana","https://news.naver.com/main/read.nhn?mode=LPOD&mid=sec&oid=001&aid=0011559012&isYeonhapFlash=Y&rc=N"};
	String news3[] = {"\'세월호 구조실패\' 김석균 전 해경청장 \"과실 없다\" 혐의 부인","bookmania","https://news.naver.com/main/read.nhn?mode=LPOD&mid=sec&oid=001&aid=0011559118&isYeonhapFlash=Y&rc=N"};
	String news4[] = {"정총리 \"사회적 거리두기 완화, 세심한 방역조치 뒷받침돼야\"","ses","https://news.naver.com/main/read.nhn?mode=LPOD&mid=sec&oid=001&aid=0011558689&isYeonhapFlash=Y&rc=N"};
	String news5[] = {"초등 1∼3학년 오늘 온라인개학…초중고 540만명 원격수업 시대","hyo","https://news.naver.com/main/read.nhn?mode=LPOD&mid=sec&oid=001&aid=0011558399&isYeonhapFlash=Y&rc=N"};
	String datas = "";
	
	switch(x){
	case 1: 
		datas=newsList(news1);
		x++;
		break;
	case 2: 
		datas=newsList(news2);
		x++;
		break;
	case 3: 
		datas=newsList(news3);
		x++;
		break;
	case 4: 
		datas=newsList(news4);
		x++;
		break;
	case 5: 
		datas=newsList(news5);
		x=1;
		break;
	}
	out.clear();
	out.print(datas);
%>
