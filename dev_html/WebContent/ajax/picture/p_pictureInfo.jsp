<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String img = request.getParameter("id");
	String imgs[] = {"picture1.jpg","picture2.jpg","picture3.jpg","picture4.jpg"};
	String cimg = null;
	String titles[] ={"추상화1","추상화2","추상화3","추상화4"};
	String ctitle = null;
	String infos[] ={"추상화1에 대한 설명","추상화2에 대한 설명","추상화3에 대한 설명","추상화4에 대한 설명"};
	String cinfo = null;
	for(int i=0;i<imgs.length;i++){
		if(img.equals(imgs[i])){
			cimg = imgs[i];
		}
	}
	for(int i=0;i<titles.length;i++){
		if(imgs[i].indexOf(i)==titles[i].indexOf(i)){
			ctitle = titles[i];
		}
	}
	for(int i=0;i<infos.length;i++){
		if(imgs[i].indexOf(i)==infos[i].indexOf(i)){
			cinfo = infos[i];
		}
	}
%>
<img src="./<%out.print(cimg);%>" width='600px' height='500px' border='1px solid gray'/>
<div>제목 : <% out.print(ctitle); %></div> 
<div>설명 : <% out.print(cinfo); %></div> 