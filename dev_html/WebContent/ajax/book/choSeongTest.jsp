<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	가 - 44032
	
 -->
 <div id="d_msg"></div>
 
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
	var a = choSeongAccount("자바");
	alert(a);
</script>
</body>
</html>