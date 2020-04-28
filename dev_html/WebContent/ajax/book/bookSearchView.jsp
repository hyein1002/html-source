<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서검색[자동완성+초성검사]</title>
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/demo/demo.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<style type="text/css">
	#d_search{
		position:absolute;
		border:1px dotted black;
		background:#AACCFF;
	}
	.listIn{
		background:#CCFFFF;
	}
	.listOut{
		background:#FFFFFF;
	}

</style>
<script type="text/javascript">
	function choSeongAccount(str){
		var cho = [
					"ㄱ","ㄲ","ㄴ","ㄷ","ㄸ"
					,"ㄹ","ㅁ","ㅂ","ㅃ","ㅅ"
					,"ㅆ","ㅇ","ㅈ","ㅉ","ㅊ"
					,"ㅋ","ㅌ","ㅍ","ㅎ"
				];
		var code; 
		var result = '';//ㅈㅂ을 반환하는 변수
		//alert(str.charCodeAt());
		for(var i =0;i<str.length;i++){
			code=str.charCodeAt(i)-44032;
			//$("#d_msg").append(code+" , ");
			if(code>-1 && code<11172) {
				result +=cho[Math.floor(code/588)];
			}
		}
		return result;
	}
	function clearMethod(){
		$("#d_search").css("background","#FFFFFF");
		$("#d_search").css("border","none");
		$("#d_search").html("");
	}
</script>
</head>
<body>
	<script type="text/javascript">
	//DOM구성이 되었을 때
		$(document).ready(function(){
			var t = $('.textbox-f');//실제 id값은 _easyui_textbox_input1
			t.textbox('textbox').bind('keyup', function(e){
				var choMode;
				var v_word = $("#_easyui_textbox_input1").val().toUpperCase();
				var choKeyword = choSeongAccount(v_word);
				//초성 검색 구분
				if(v_word!="" && choKeyword==""){
					choMode = "Y";
				}
				else{
					choMode="N";
				}
				//alert("choMode"+choMode);
				var p_word = $('#_easyui_textbox_input1').val();
				//alert(p_word);
				var param = "book_title="+p_word+"&choMode="+choMode;
				$.ajax({
					method:"post"
					,url:"htmlBookList2.jsp"
					,data:param
					,success:function(result){
						//alert(JSON.stringify(result));
						if(p_word==""){
							//$("#d_search").hide();
						}else{
							$("#d_search").show();
							$("#d_search").css("border","1px solid #000000");
							$("#d_search").css("background","#FFFFFF");
							//$("#d_search").css("top",$("#_easyui_textbox_input1").offset().top+"px");
							$("#d_search").html(result);//htmlBookList2.jsp페이지 내용=>result
							var tds = document.getElementsByTagName("td");//array로 전환
							for(var i=0;i<tds.length;i++){
								tds[i].onmouseover = function(){
									this.className = "listIn";
									var b_no = $(this).attr("id");//this는 td
									//alert(b_no);
									
									 var targetURL = '';
									if("4"==$(this).attr("id") ){
										targetURL = 'bookSearchDetail4.jsp';
									}else if("3"==$(this).attr("id")){
										targetURL = 'bookSearchDetail3.jsp';
									}
									$.ajax({
										url:targetURL
										,method:"method"
										,success:function(result){
											if("4"=b_no){
												location.href=targetURL;
											}else if("3"==b_no){
												location.href=targetURL;
											}
										}
									}) 
								};
								tds[i].onmouseout = function(){
									//clearMethod();//$("#d_search").hide();
									this.className = "listOut";
								}
								tds[i].onclick = function(){
									$('#_easyui_textbox_input1').val($(this).text());
									clearMethod();
								}
							}
						}
					}
					,error:function(xhrObject){
						alert(xhrObject.responseText);
					}
				});
			});
			if($("#_easyui_textbox_input1").val().length==0){
				//alert("아무것도 없음.");
			}
		});
	</script>
	<input id="book_title" class="easyui-textbox" style="width:500px;"/>
	<div id="d_over">마우스오버처리화면</div>
	<div id="d_search">조회결과처리화면</div>
</body>
</html>