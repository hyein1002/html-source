<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//화면이 없어도 단위테스트가 가능해야한다.
//디자이너가 내 페이지를 아직 못 만들었다고 해도 나는 코딩할 수 있다.
//클래스 쪼개기
//localhost:8000/dev_html/ajax/picture/pictureInfo.jsp?id=picture2.jpg
	String img = request.getParameter("id");
	//out.print(img);//picture2.jpg
	String imgs[] = {"picture1.jpg","picture2.jpg","picture3.jpg","picture4.jpg"};
	String cimg = null;
	for(int i=0;i<imgs.length;i++){
		//equals
		if(img.equals(imgs[i])){
			cimg = imgs[i];
		}
	}
	
%>
<img src="./<%out.print(cimg);%>" width='600px' height='470px' border='1'/>