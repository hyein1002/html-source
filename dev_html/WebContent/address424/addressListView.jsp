<%@page import="orm.dao.SqlCommonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax실전연습-[1:ajax,2:html,html+js,js3:myBatis]</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<style type="text/css">
	table{
		border:3px solid #CCAAFF;
	}
	td{
		border:3px solid #CCAAAA;
		text-align:center;
		height:45px;
		width:60px;
	}
	th{
		
		border:3px dotted black;
		
	}
	input{
		width:120px;
	}
	select{
		width:120px;
	}
</style>
<script type="text/javascript">
	function siguIN(){
		$("#d_sigu").change(function(){
			$("#d_sigu optuion:selected").each(function(){
				$("#sigu").val($(this).text());
			});
		});
	}
	function zdoIN(){
		$("#i_zdo").change(function(){
			$("#i_zdo optuion:selected").each(function(){
				$("#zdo").val($(this).text());
			});
		});
	}
	function dongIN(){
		$("#d_dong").change(function(){
			$("#d_dong optuion:selected").each(function(){
				$("#dong").val($(this).text());
			});
		});
	}
</script>
</head>
<body>
<table width="700" height="60" cellpadding="0" cellspacing="0">
	<tr>
		<th width="30px">시/도</th>
		<td><select id="i_zdo"><option value="선택">선택</option></select></td>
		<th width="30px">구</th>
		<td><select id="d_sigu"><option value="선택">선택</option></select></td>
		<th width="30px">동</th>
		<td><select id="d_dong"><option value="선택">선택</option></select></td>
	</tr>
	<tr>
		<th>시/도</th>
		<td><input id="zdo" name="zdo"/></td>
		<th>구</th>
		<td><input id="sigu" name="sigu"/></td>
		<th>동</th>
		<td><input id="dong" name="dong"/></td>
	</tr>
</table>
<div>
	<table id="result" width="900px">

	</table>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			url:'getZDOList.jsp'
			,dataType:'json'
			,success:function(result){
				var data = JSON.stringify(result);
				var j = JSON.parse(data);
				var opt = "";
				for(var i=0;i<j.length;i++){
					opt+="<option value=\""+j[i].ZDO+"\">"+j[i].ZDO+"</option>"
				}
				$("#i_zdo").html(opt);
				
			}
			
		});//end of ajax
		$("#i_zdo").change(function(){
			$("#i_zdo option:selected").each(function(){
				$("#zdo").val($(this).text());
				var p_zdo = $(this).text();
				var param = "zdo="+p_zdo;
				$.ajax({
					method:"post"
					,url:'getSIGUList.jsp'
					,dataType:'json'
					,data:param
					,success:function(result){
						var data = JSON.stringify(result);
						var j = JSON.parse(data);
						var opt = "";
						for(var i=0;i<j.length;i++){
							opt+="<option value=\""+j[i].SIGU+"\">"+j[i].SIGU+"</option>"
						}
						$("#d_sigu").html(opt);
						//siguIN();
					}
				});
			});
		});//end of i_zdo.change
		$("#d_sigu").change(function(){
			$("#d_sigu option:selected").each(function(){
				$("#sigu").val($(this).text());
				var p_sigu = $(this).text();
				var p_zdo = $("#zdo").val();
				var param = "zdo="+p_zdo+"&sigu="+p_sigu;
				
				$.ajax({
					method:"post"
					,url:'getDONGList.jsp'
					,dataType:'json'
					,data:param
					,success:function(result){
						var data = JSON.stringify(result);
						var j = JSON.parse(data);
						var opt = "";
						for(var i=0;i<j.length;i++){
							opt+="<option value=\""+j[i].DONG+"\">"+j[i].DONG+"</option>"
						}
						$("#d_dong").html(opt);
						//siguIN();
					}
				});
			});
		});//end of d_sigu.change
		$("#d_dong").change(function(){
			$("#d_dong option:selected").each(function(){
				$("#dong").val($(this).text());
				var p_sigu = $("#sigu").val();
				var p_zdo = $("#zdo").val();
				var p_dong = $(this).val();
				var param = "zdo="+p_zdo+"&sigu="+p_sigu+"&dong="+p_dong;
				$.ajax({
					method:"post"
					,url:'getZIPList.jsp'
					,dataType:'json'
					,data:param
					,success:function(result){
						var data = JSON.stringify(result);
						var j = JSON.parse(data);
						var opt = "";
							opt+="<tr><th width=80px>우편번호</th>";
							opt+="<th width='50px'>시/도</th>";
							opt+="<th width='50px'>구</th>";
							opt+="<th width='50px'>동</th>";
							//opt+="<th width='50px'>리</th>";
							opt+="<th width='50px'>번지</th>";
							opt+="<th width='221px'>아파트</th>";
							opt+="<th width='221px'>상세주소</th></tr>";
						for(var i=0;i<j.length;i++){
							opt+="<tr>";
							opt+="<td>"+j[i].ZIPCODE+"</td>";
							opt+="<td>"+j[i].ZDO+"</td>";
							opt+="<td>"+j[i].SIGU+"</td>";
							opt+="<td>"+j[i].DONG+"</td>";
							//opt+="<td>"+j[i].RI+"</td>";
							opt+="<td>"+j[i].BUNGI+"</td>";
							opt+="<td>"+j[i].APTNAME+"</td>";
							opt+="<td>"+j[i].ADDRESS+"</td>";
							opt+="</tr>";
						}
						$("#result").html(opt);
						//siguIN();
					}
				});
			});
		});//end of d_dong.change


	});//end of document
</script>

</body>
</html>