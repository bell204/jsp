<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>전체 메세지</title>
<style>
#A_Container_L {
	float: left;
	width: 200px;
}

#A_Container_C {
	width: 770px;
	float: left;
	overflow: hidden;
}

#A_Container {
	width: 1000px;
	margin: 0 auto;
	margin-top: 50px;
	margin-bottom: 20px;
	clear: both;
	overflow: hidden;
	min-height: 500px;
}

#A_Container_Wrap {
	width: 100%;
	clear: both;
	height: 100%;
}

/*  */

.allMessageOuter{
	float:left;
	width:800px;
	/* border:1px solid black; */
	height:1000px;
}
.topArea{
	/* border:1px solid red; */
	width:800px;
	height:80px;
	margin-top:30px;
}
.Select{
	width:140px;
	height:40px;
	padding-left:20px;
	margin-left:50px;
	border-radius:10px;
}
.showMessageList{
	margin-left:50px;
	/* border:1px solid red; */
	width:770px;
	height:500px;
	overflow-y:scroll;
}
.showListTable{
	width:750px;
	height:auto;
}
.tableTh{
	text-align:center;
	background:#e6e6e6;
	height:50px;
	padding-right:10px;
}
.showListTable td{
	text-align:center;
	height:50px;
	border-bottom:1px solid #cccccc;
	padding-right:10px;
}
.showListTable tr:hover{
	cursor:pointer;
	background:#e6e6e6
}
.searchBtn:hover{
	cursor:pointer;
	border:1px outset black;
	border-style:outset;
	box-shadow: 5px 6px #888888;
}
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div id='A_Container_Wrap'>
		<div id='A_Container'>
			<%@ include file="../mypage/mypageleft.jsp"%>

			<div class="allMessageOuter">
			<br>
			<h2 class="MessageTitle" id="MessageTitle" style="margin-left:50px;">전체 메세지</h2>
				<div class="topArea">
					<select class="Select" id="Select">
						<option checked value="all">전체수신함</option>
						<option value='star'>별표수신함</option>
						<option value="unCheck">미확인 수신함</option>
					</select>
					<!-- 휴지통 -->
					<label style="margin-left:10px; margin-right:10px;">
						<i class="fa fa-trash-o fa-lg font-color-lighter" aria-hidden="true"></i>
					</label>
					<input id="searchText" class="searchText" type="text" placeholder="상대방 닉네임 입력"style="width:200px; height:40px;">
					<img alt="검색" id="searchBtn" class="searchBtn" src="/p/Pimages/search.PNG" style="height:40px;">
				</div>
				<!-- 리스트 보여주는 테이블 -->
				<div class="showMessageList">
					<table class="showListTable" style="border:1px solid #cccccc;">
						
					</table>
				</div>
			</div>
			</div>
			</div>
		<%@ include file="../common/footer.jsp" %>
<script>
	$(function(){
		var userId = "<%= loginUser.getC_id() %>";
		$.ajax({
			url:"/p/selectAllMessageRoom.me",
			data:{userId:userId},
			type:"get",
			success:function(data){
				var $showMessageList = $('.showListTable');
				$showMessageList.html('');
				var $tr1 = $('<tr>');
				var $th = $('<th class="tableTh">');
				var $th_input = $('<input class="deleteCheck" id="deleteCheck" type="checkbox">');
				var $th_star = $('<th class="tableTh">').text("★"); 
				var $th_con = $('<th class="tableTh" style="width:300px">').text("내용");
				var $th_nick = $('<th class="tableTh">').text("닉네임");
				var $th_time =$('<th class="tableTh">').text("시간");
				var $th_check =$('<th class="tableTh">').text('');
				$th.append($th_input);
				$tr1.append($th);
				$tr1.append($th_star);
				$tr1.append($th_con);
				$tr1.append($th_nick);
				$tr1.append($th_time);
				$tr1.append($th_check);
				$showMessageList.append($tr1);
				for(var key in data){
					var $table_tr = $('<tr id="messageRow">');
					var $td1 = $('<td>')
					var $input1 = $('<input class="deleteCheck" id="deleteCheck" type="checkbox">');
					var $td_starCh = $('<td id="starCheck">');
					if(data[key].starCheck == 'N'){
						var $div_starCh = $('<div id="starCheck2" class="starCheck2">').text("☆");
					}else{
						var $div_starCh = $('<div id="starCheck2" class="starCheck2">').text("★");
					}
					var $td_me_con = $('<td id="MsgContent" class="MsgContent" style="width:300px">');
					var $div_me_con = $('<div id="MsgContent">').text(data[key].msgContent);
					var $td_re = $('<td id="receveId">');
					if(userId == data[key].receveCode){
						var $div_re = $('<div id="receveId2">').text(data[key].cCode);
					}else{
						var $div_re = $('<div id="receveId2">').text(data[key].receveCode);
					}
					var $td_time = $('<td>').text(data[key].sendTime);
					if(data[key].check == 'N'){
						var $td_check = $('<td id="check1"style="color:green; margin-right:10px;">').text("1");
					}else{
						var $td_check = $('<td id="check1"style="color:green">').text('');
					}
					$td1.append($input1);
					$td_starCh.append($div_starCh);
					$td_me_con.append($div_me_con);
					$td_re.append($div_re);
					
					$table_tr.append($td1);
					$table_tr.append($td_starCh);
					$table_tr.append($td_me_con);
					$table_tr.append($td_re);
					$table_tr.append($td_time);
					$table_tr.append($td_check);
					
					$showMessageList.append($table_tr);
				}
			},
			error:function(msg){
				console.log(msg);
			}
		});
	});
	$(function(){
		$(document).on('click', '.fa', function(){
			var num = $("#deleteCheck:checked").length;
			var receveId = new Array();
			for(var i=0; i<num ;i++){
				receveId[i] = $("#deleteCheck:checked").eq(i).parent().parent().children("#receveId").children("#receveId2").text();
				console.log(receveId[i]);
			}
			console.log(receveId);
			var userId = "<%= loginUser.getC_id() %>";
			if(deleteCheck != null){
				$.ajax({
					url:"/p/deleteMessage.me",
					type:'get',
					data:{userId:userId,receveId:JSON.stringify(receveId)},
					success:function(data){
						$.ajax({
							url:"/p/selectAllMessageRoom.me",
							data:{userId:userId},
							type:"get",
							success:function(data){
								var $showMessageList = $('.showListTable');
								$showMessageList.html('');
								var $tr1 = $('<tr>');
								var $th = $('<th class="tableTh">');
								var $th_input = $('<input class="deleteCheck" id="deleteCheck" type="checkbox">');
								var $th_star = $('<th class="tableTh">').text("★"); 
								var $th_con = $('<th class="tableTh" style="width:300px">').text("내용");
								var $th_nick = $('<th class="tableTh">').text("닉네임");
								var $th_time =$('<th class="tableTh">').text("시간");
								var $th_check =$('<th class="tableTh">').text('');
								$th.append($th_input);
								$tr1.append($th);
								$tr1.append($th_star);
								$tr1.append($th_con);
								$tr1.append($th_nick);
								$tr1.append($th_time);
								$tr1.append($th_check);
								$showMessageList.append($tr1);
								for(var key in data){
									var $table_tr = $('<tr id="messageRow">');
									var $td1 = $('<td>')
									var $input1 = $('<input class="deleteCheck" id="deleteCheck" type="checkbox">');
									var $td_starCh = $('<td id="starCheck">');
									if(data[key].starCheck == 'N'){
										var $div_starCh = $('<div id="starCheck2" class="starCheck2">').text("☆");
									}else{
										var $div_starCh = $('<div id="starCheck2" class="starCheck2">').text("★");
									}
									var $td_me_con = $('<td id="MsgContent" class="MsgContent" style="width:300px">');
									var $div_me_con = $('<div id="MsgContent">').text(data[key].msgContent);
									var $td_re = $('<td id="receveId">');
									if(userId == data[key].receveCode){
										var $div_re = $('<div id="receveId2">').text(data[key].cCode);
									}else{
										var $div_re = $('<div id="receveId2">').text(data[key].receveCode);
									}
									var $td_time = $('<td>').text(data[key].sendTime);
									if(data[key].check == 'N'){
										var $td_check = $('<td id="check1"style="color:green; margin-right:10px;">').text("1");
									}else{
										var $td_check = $('<td id="check1"style="color:green">').text('');
									}
									$td1.append($input1);
									$td_starCh.append($div_starCh);
									$td_me_con.append($div_me_con);
									$td_re.append($div_re);
									
									$table_tr.append($td1);
									$table_tr.append($td_starCh);
									$table_tr.append($td_me_con);
									$table_tr.append($td_re);
									$table_tr.append($td_time);
									$table_tr.append($td_check);
									
									$showMessageList.append($table_tr);
								}
							},
							error:function(msg){
								console.log(msg);
							}
						});	
					},
					error:function(msg){
						console.log("메세지 삭제 실패");
					}
				});
			}
		});
	});
	
	//검색
	$(function(){
		$(document).on('click', '.searchBtn', function(){
			var keyWord = $(".searchText").val();
			var checkOption = $("#Select option:selected").val();
			var userId = "<%= loginUser.getC_id() %>";
			if(checkOption==='star'){
				$.ajax({
					url:"/p/selectStar.me",
					type:'get',
					data:{userId:userId},
					success:function(data){
						var $title = $(".MessageTitle");
						$title.html('별표메세지');
						var $showMessageList = $('.showListTable');
						$showMessageList.html('');
						var $tr1 = $('<tr>');
						var $th = $('<th class="tableTh">');
						var $th_input = $('<input class="deleteCheck" id="deleteCheck" type="checkbox">');
						var $th_star = $('<th class="tableTh">').text("★"); 
						var $th_con = $('<th class="tableTh" style="width:300px">').text("내용");
						var $th_nick = $('<th class="tableTh">').text("닉네임");
						var $th_time =$('<th class="tableTh">').text("시간");
						var $th_check =$('<th class="tableTh">').text('');
						$th.append($th_input);
						$tr1.append($th);
						$tr1.append($th_star);
						$tr1.append($th_con);
						$tr1.append($th_nick);
						$tr1.append($th_time);
						$tr1.append($th_check);
						$showMessageList.append($tr1);
						for(var key in data){
							var $table_tr = $('<tr id="messageRow">');
							var $td1 = $('<td>')
							var $input1 = $('<input class="deleteCheck" id="deleteCheck" type="checkbox">');
							var $td_starCh = $('<td id="starCheck">');
							if(data[key].starCheck == 'N'){
								var $div_starCh = $('<div id="starCheck2" class="starCheck2">').text("☆");
							}else{
								var $div_starCh = $('<div id="starCheck2" class="starCheck2">').text("★");
							}
							var $td_me_con = $('<td id="MsgContent" class="MsgContent" style="width:300px">');
							var $div_me_con = $('<div id="MsgContent">').text(data[key].msgContent);
							var $td_re = $('<td id="receveId">');
							if(userId == data[key].receveCode){
								var $div_re = $('<div id="receveId2">').text(data[key].cCode);
							}else{
								var $div_re = $('<div id="receveId2">').text(data[key].receveCode);
							}
							var $td_time = $('<td>').text(data[key].sendTime);
							if(data[key].check == 'N'){
								var $td_check = $('<td id="check1"style="color:green; margin-right:10px;">').text("1");
							}else{
								var $td_check = $('<td id="check1"style="color:green">').text('');
							}
							$td1.append($input1);
							$td_starCh.append($div_starCh);
							$td_me_con.append($div_me_con);
							$td_re.append($div_re);
							
							$table_tr.append($td1);
							$table_tr.append($td_starCh);
							$table_tr.append($td_me_con);
							$table_tr.append($td_re);
							$table_tr.append($td_time);
							$table_tr.append($td_check);
							
							$showMessageList.append($table_tr);
						}
					},
					error:function(msg){
						alert("별표 메세지 조회 실패");
					}
				});	
			}else if(checkOption==='unCheck'){
				$.ajax({
					url:"/p/selectUnCheck.me",
					type:'get',
					data:{userId:userId},
					success:function(data){
						var $title = $(".MessageTitle");
						$title.html('새로운 메세지');
						var $showMessageList = $('.showListTable');
						$showMessageList.html('');
						var $tr1 = $('<tr>');
						var $th = $('<th class="tableTh">');
						var $th_input = $('<input class="deleteCheck" id="deleteCheck" type="checkbox">');
						var $th_star = $('<th class="tableTh">').text("★"); 
						var $th_con = $('<th class="tableTh" style="width:300px">').text("내용");
						var $th_nick = $('<th class="tableTh">').text("닉네임");
						var $th_time =$('<th class="tableTh">').text("시간");
						var $th_check =$('<th class="tableTh">').text('');
						$th.append($th_input);
						$tr1.append($th);
						$tr1.append($th_star);
						$tr1.append($th_con);
						$tr1.append($th_nick);
						$tr1.append($th_time);
						$tr1.append($th_check);
						$showMessageList.append($tr1);
						for(var key in data){
							var $table_tr = $('<tr id="messageRow">');
							var $td1 = $('<td>')
							var $input1 = $('<input class="deleteCheck" id="deleteCheck" type="checkbox">');
							var $td_starCh = $('<td id="starCheck">');
							if(data[key].starCheck == 'N'){
								var $div_starCh = $('<div id="starCheck2" class="starCheck2">').text("☆");
							}else{
								var $div_starCh = $('<div id="starCheck2" class="starCheck2">').text("★");
							}
							var $td_me_con = $('<td id="MsgContent" class="MsgContent" style="width:300px">');
							var $div_me_con = $('<div id="MsgContent">').text(data[key].msgContent);
							var $td_re = $('<td id="receveId">');
							if(userId == data[key].receveCode){
								var $div_re = $('<div id="receveId2">').text(data[key].cCode);
							}else{
								var $div_re = $('<div id="receveId2">').text(data[key].receveCode);
							}
							var $td_time = $('<td>').text(data[key].sendTime);
							if(data[key].check == 'N'){
								var $td_check = $('<td id="check1"style="color:green; margin-right:10px;">').text("1");
							}else{
								var $td_check = $('<td id="check1"style="color:green">').text('');
							}
							$td1.append($input1);
							$td_starCh.append($div_starCh);
							$td_me_con.append($div_me_con);
							$td_re.append($div_re);
							
							$table_tr.append($td1);
							$table_tr.append($td_starCh);
							$table_tr.append($td_me_con);
							$table_tr.append($td_re);
							$table_tr.append($td_time);
							$table_tr.append($td_check);
							
							$showMessageList.append($table_tr);
						}
					},
					error:function(msg){
						alert("새로운 메세지 조회 실패");
					}
				});	
			}else{
				$.ajax({
					url:"/p/selectAllMessageRoom.me",
					data:{userId:userId},
					type:"get",
					success:function(data){
						var $showMessageList = $('.showListTable');
						$showMessageList.html('');
						$title.html('전체메세지');
						var $tr1 = $('<tr>');
						var $th = $('<th class="tableTh">');
						var $th_input = $('<input class="deleteCheck" id="deleteCheck" type="checkbox">');
						var $th_star = $('<th class="tableTh">').text("★"); 
						var $th_con = $('<th class="tableTh" style="width:300px">').text("내용");
						var $th_nick = $('<th class="tableTh">').text("닉네임");
						var $th_time =$('<th class="tableTh">').text("시간");
						var $th_check =$('<th class="tableTh">').text('');
						$th.append($th_input);
						$tr1.append($th);
						$tr1.append($th_star);
						$tr1.append($th_con);
						$tr1.append($th_nick);
						$tr1.append($th_time);
						$tr1.append($th_check);
						$showMessageList.append($tr1);
						for(var key in data){
							var $table_tr = $('<tr id="messageRow">');
							var $td1 = $('<td>')
							var $input1 = $('<input class="deleteCheck" id="deleteCheck" type="checkbox">');
							var $td_starCh = $('<td id="starCheck">');
							if(data[key].starCheck == 'N'){
								var $div_starCh = $('<div id="starCheck2" class="starCheck2">').text("☆");
							}else{
								var $div_starCh = $('<div id="starCheck2" class="starCheck2">').text("★");
							}
							var $td_me_con = $('<td id="MsgContent" class="MsgContent" style="width:300px">');
							var $div_me_con = $('<div id="MsgContent">').text(data[key].msgContent);
							var $td_re = $('<td id="receveId">');
							if(userId == data[key].receveCode){
								var $div_re = $('<div id="receveId2">').text(data[key].cCode);
							}else{
								var $div_re = $('<div id="receveId2">').text(data[key].receveCode);
							}
							var $td_time = $('<td>').text(data[key].sendTime);
							if(data[key].check == 'N'){
								var $td_check = $('<td id="check1"style="color:green; margin-right:10px;">').text("1");
							}else{
								var $td_check = $('<td id="check1"style="color:green">').text('');
							}
							$td1.append($input1);
							$td_starCh.append($div_starCh);
							$td_me_con.append($div_me_con);
							$td_re.append($div_re);
							
							$table_tr.append($td1);
							$table_tr.append($td_starCh);
							$table_tr.append($td_me_con);
							$table_tr.append($td_re);
							$table_tr.append($td_time);
							$table_tr.append($td_check);
							
							$showMessageList.append($table_tr);
						}
					},
					error:function(msg){
						console.log("전체메세지 조회 실패");
					}
				});
			}
		});
	});
	//별표메세지
	$(function(){
		$(document).on('click','.starCheck2',function(){
			var receveId = $(this).parent().parent().children("#receveId").children("#receveId2").html();
			var userId = "<%= loginUser.getC_id() %>";
			
			if($(this).text()==="☆"){
				$.ajax({
					url:"/p/starUpdate1.me",
					data:{userId:userId,receveId:receveId},
					type:"get",
					success:function(data){
						$(this).text("★");
					},
					error:function(msg){
						alert("별표 메세지 실패1");
					}
				});
			}else{
				$.ajax({
					url:"/p/starUpdate2.me",
					data:{userId:userId, receveId:receveId},
					type:"get",
					success:function(data){
						$(this).text("☆");			
					},
					error:function(msg){
						alert("별표 메세지 실패2");
					}	
				});
			}
		});
	});
	
	//상세 메세지로 가기
	$(function(){
		$(document).on('click','#MsgContent div',function(){
			var receveId = $(this).parent().parent().children("#receveId").children("#receveId2").html();
			console.log("뷰븁"+receveId);
			var userId = "<%= loginUser.getC_id() %>";
			$.ajax({
				url:"/p/messageCheck.me",
				data:{userId:userId, receveId:receveId},
				type:"get",
				success:function(data){
					$(this).parent().children("#check1").text('');
					location.href="/p/selectOne.me?receveId="+receveId+"&userId="+userId;
				},
				error:function(msg){
					alert("메세지 읽기 실패ㄴ");
				}
			});
		});
	});
</script>


</body>
</html>