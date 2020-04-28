<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원관리 - [jEasyUI활용]</title>
<%@ include file="./JEasyUICommon.jsp" %>
<script type="text/javascript">
//여기가 전변자리이다.
	var g_address='';//사용자가 선택한 주소 정보 담기
	function empINS(){
		$("#dlg_ins").dialog({
			closed:false
		});
	}
	function empUPD(){
		$("#dlg_upd").dialog('open');
	}
	function empDEL(){
		$("#dlg_del").dialog({
			closed:false
		});
	}
	function empList(){
		$("#dg_emp").datagrid({
		onLoadSuccess: function(data){
				//alert("새로고침 처리 성공"+JSON.stringify(data));
				//alert("새로고침 처리 성공"+data);
			}
		});
	}
	function getRowIndex(target){
	    var tr = $(target).closest('tr.datagrid-row');
	    return parseInt(tr.attr('datagrid-row-index'));
	}
	function editrow(target){
	    $('#dg_emp').datagrid('beginEdit', getRowIndex(target));
	}
	function deleterow(target){
	    $.messager.confirm('Confirm','Are you sure?',function(r){
	        if (r){
	            $('#dg_emp').datagrid('deleteRow', getRowIndex(target));
	        }
	    });
	}
	function saverow(target){
	    $('#dg_emp').datagrid('endEdit', getRowIndex(target));
	}
	function cancelrow(target){
	    $('#dg_emp').datagrid('cancelEdit', getRowIndex(target));
	}
	function empnoSearch(){
		//alert("empnoSearch호출");
		var s_empno = $("#s_empno").val();
		$("#dg_emp").datagrid({
			url:'jsonEmpList.jsp?empno='+s_empno
		});
	}
	function zipcode_search(){
		//alert("우편번호찾기");
		var pdong = $("#dong").val();
		$("#dg_zipcode").datagrid({
			url:'jsonDongList.jsp?dong='+pdong
			,onDblClickRow:function(index,row){
				//var zipcode $("#dg_zipcode").datagrid('setValue','row');
				//alert(zipcode);
			}
		});	
	}
	//사원정보 등록 처리
	function emp_ins(){
		//alert("저장호출");
		$("#f_ins").attr("method","post");
		$("#f_ins").attr("action","empInsert.jsp");
		$("#f_ins").submit();
	}

</script>
</head>
<body>
<div id="tbar_emp">
	<form id="f_search" name="f_search">
	<table>
		<tr>
			<td width="190px">
				<label width="80px">사원번호</label>
				<input id="s_empno" name="s_empno" class="easyui-searchbox" 
				data-options="prompt:'사원번호', searcher:empnoSearch" style="width:110px"/>
			</td>
		</tr>
		<tr>
			<td>
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="empList()">사원조회</a>
			   <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-man" plain="true" onclick="empINS()">사원등록</a>
			   <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="empUPD()">사원수정</a>
			   <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="empDEL()">사원삭제</a>
			</td>
		</tr>
	</table>
	</form>
</div>
	<table id="dg_emp" width="900px"></table>
	<script type="text/javascript">
		$(document).ready(function(){
			var t = $('#dong');
			t.textbox('textbox').bind('keydown', function(e){
				if (e.keyCode == 13){
					//alert("엔터");
					//t.textbox('setValue', $(this).val());
					$("#dg_zipcode").datagrid({
						url:'jsonDongList.jsp?dong='+$(this).val()
						,singleSelect:true
						,onSelect:function(index,row){//index=>서랍번호(row번호),row엔 컬럼정보(ename, empno등)
							//alert(index+","+row.ADDRESS);
							g_address = row.ADDRESS;//필드명은 mybatis를 사용했으니까 꼭 대문자
						}
						,onDblClickCell:function(index,field,value){
							//var zipcode = row.ZIPCODE;
							//var addr = row.ADDRESS;
							if("ZIPCODE"==field){//너 우편번호 셀(컬럶)을 선택한거니?
								//더블클릭이벤트 핸들러를 셀을 선택했으니까 세번째 파라미터의 value는 
								//사용자가 선택한 로우에 그 셀에 값을 가짐
								$("#mem_addr").textbox('setValue',g_address);
								$("#zipcode").textbox('setValue',value);//(메소드이름,값)
								$("#dg_zipcode").datagrid("clearSelections");
							}
								$("#dlg_zipcode").dialog('close');
						}
					});	
				}
			});
			$('#dg_zipcode').datagrid({
				title:'우편번호 찾기 검색 결과'
				,columns:[[
					{field:'ZIPCODE',title:'우편번호',width:100, align:'center'}
					,{field:'ADDRESS',title:'주소',width:400,align:'left'}
				]]
			});
			$('#btn_zipcode').linkbutton({
				onClick:function(){
					$("#dlg_zipcode").dialog({
					//alert("우현번호 찾기 버튼 클릭");
					open:true,
					title:"우편번호 검색기"
					,closed:false
					});
				}
			});

			$('#dlg_ins').dialog({
				modal:true
			});
			$('#dlg_upd').dialog({
				closed:true
			});
			$('#dlg_zipcode').dialog({
				closed:true
				,title:'우편번호 검색기'
				,width:550
			});
			
			$('#dg_emp').datagrid({
				url:"jsonEmpList.jsp"
				,title:'사원관리 - 자바스크립트 만으로 구성하기'
				,toolbar:'#tbar_emp'
			    ,columns:[[
			        {field:'CK',checkbox:true,width:50,align:'center'},
			        {field:'EMPNO',title:'사원번호',width:80,align:'center', editor:'numberbox'},
			        {field:'ENAME',title:'이름',width:100,align:'center', editor:'text'},
			        {field:'JOB',title:'JOB',width:120,align:'center', editor:'text'},
			        {field:'HIREDATE',title:'입사일자',width:130,align:'center', editor:'text'},
			        {field:'MGR',title:'MGR',width:90,align:'center', editor:'numberbox',hidden:true},
			        {field:'SAL',title:'급여',width:80,align:'center', editor:'numberbox'},
			        {field:'COMM',title:'인센티브',width:80,align:'center', editor:'numberbox'},
			        {field:'DEPTNO',title:'부서번호',width:80,align:'center'
			        	, editor:{
			        		type:'combobox'
			        		,options:{
			        			valueField:'DEPTNO'//실제 서버에 넘어가는 필드
			        			,textField:'DNAME'//화면에 출력되는 필드
			        			,url:'./jsonDeptList.jsp'
			        			,required:true
			        		}
			        	},
			        	}
			        ,{field:'action',title:'Action',width:120,align:'center',
		                formatter:function(value,row,index){
		                    if (row.editing){
		                        var s = '<a href="javascript:void(0)" onclick="saverow(this)">Save</a> ';
		                        var c = '<a href="javascript:void(0)" onclick="cancelrow(this)">Cancel</a>';
		                        return s+c;
		                    } else {
		                        var e = '<a href="javascript:void(0)" onclick="editrow(this)">Edit</a> ';
		                        var d = '<a href="javascript:void(0)" onclick="deleterow(this)">Delete</a>';
		                        return e+d;
		                    }
		                }
		            }
			    ]]
			,onEndEdit:function(index,row){
	            var ed = $(this).datagrid('getEditor', {
	                index: index,
	                field: 'productid'
	            });
	            row.productname = $(ed.target).combobox('getText');
	        },
	        onBeforeEdit:function(index,row){
	            row.editing = true;
	            $(this).datagrid('refreshRow', index);
	        },
	        onAfterEdit:function(index,row){
	            row.editing = false;
	            $(this).datagrid('refreshRow', index);
	        },
	        onCancelEdit:function(index,row){
	            row.editing = false;
	            $(this).datagrid('refreshRow', index);
	        }
			,rownumbers:true
			});				
			});
	</script>
<div id="dlg_zipcode" style="width:100%; max_width:600px; padding:30px 30px">
	<input id="dong" name="dong" labelPosition="top" class="easyui-textbox" data-options="prompt:'동 이름이나 주소 정보를 입력...'" style="width:210px;"/>
	<a id="btn_search" class="easyui-linkbutton" href="javascript:zipcode_search();" data-options="iconCls:'icon-search'">찾기</a>
	<div style="margin-botton:10px;"></div>
	<table id="dg_zipcode"></table>
</div>
<!-- 사원등록시작 -->
<div id="dlg_ins" class="easyui-dialog" data-options="closed:true, title:'사원정보등록', modal:'true',footer:'#d_ins'" style="width:100%; max-width:600px;padding:30px 60px;">
	<form id="f_ins">
		<div style="margin-bottom:10px;">
			<input class="easyui-textbox" id="empno" name="empno" label="사원번호" labelPosition="top" data-options="prompt:'Enter a EmpNO'" style="width:210px"/>
		</div>
		<div style="margin-bottom:10px;">
			<input class="easyui-textbox" id="ename" name="ename" label="사원명" labelPosition="top" data-options="prompt:'Enter a ENAME'" style="width:300px"/>
		</div>
		<div style="margin-bottom:10px;">
			<input class="easyui-textbox" id="job" name="job" label="JOB" labelPosition="top" data-options="prompt:'Enter a JOB'" style="width:300px"/>
		</div>
		<div style="margin-bottom:10px;">
			<input class="easyui-textbox" id="hiredate" name="hiredate" label="입사일자" labelPosition="top" data-options="prompt:'Enter a 입사일자'" style="width:300px"/>
		</div>
		<div style="margin-bottom:10px;">
			<input class="easyui-textbox" id="sal" name="sal" label="급여" labelPosition="top" data-options="prompt:'Enter a 급여'" style="width:300px"/>
		</div>
		<div style="margin-bottom:10px;">
			<input class="easyui-textbox" id="comm" name="comm" label="인센티브" labelPosition="top" data-options="prompt:'Enter a 인센티브'" style="width:300px"/>
		</div>
		<div style="margin-bottom:10px;">
			<input class="easyui-combobox" id="deptno" name="deptno" label="부서번호" labelPosition="top" data-options="prompt:'Enter a 부서번호', url:'./jsonDeptList.jsp'
				,valueField:'DEPTNO',textField:'DNAME',onSelect:function(rec){
					
				}
				" style="width:300px"/>
		</div>
		<div style="margin-bottom:10px;">
			<input class="easyui-textbox" id="zipcode" name="zipcode" label="우편번호" labelPosition="top" data-options="prompt:'Enter a ZIPCODE'" style="width:180px"/>
			<a id="btn_zipcode" href="#" class="easyui-linkbutton">우편번호조회</a>
		</div>
		<div style="margin-bottom:10px;">
			<input class="easyui-textbox" id="mem_addr" name="mem_addr" label="주소" labelPosition="top" data-options="prompt:'Enter a ADDRESS'" style="width:400px"/>
		</div>
	</form>
	<div id="d_ins" style="margin-bottom:10px">
	<a id="btn_save" href="javascript:emp_ins()" class="easyui-linkbutton" data-options="iconCls:'icon-save'" >저장</a>
	<a id="btn_close" href="javascript:$('#dlg_ins').dialog('close')" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">닫기</a>
	</div>
</div>
<!-- 사원등록끝-->
<!-- 사원수정시작 -->
<div id="dlg_upd" class="easyui-dialog"  style="width:100%; max-width:480px;padding:30px 60px;">
	<form id="f_upd">
		수정		
	</form>
</div>
<!-- 사원수정끝-->
<!-- 사원삭제시작 -->
<div id="dlg_del" class="easyui-dialog" data-options="closed:true" style="width:100%; max-width:480px;padding:30px 60px;">
	<form id="f_del">
		삭제
	</form>
</div>
<!-- 사원삭제끝-->
</body>
</html>