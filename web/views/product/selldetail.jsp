<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.tc.product.model.vo.ProductDetail"%>
	<%@page import="com.kh.tc.product.model.vo.Reply" %>
<% 
ArrayList detail = (ArrayList)request.getAttribute("detail");
ProductDetail p = ((ProductDetail)detail.get(0)) ;
ArrayList<Reply> reply = ((ArrayList<Reply>)detail.get(1));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<style>
a:hover{
	cursor:pointer;
}

#currentpage{
cursor:auto;
}

#replycontent{
color:#333!important;
}

</style>
<link rel="stylesheet" href="/p/css/buying.css">
<link rel="stylesheet" href="/p/css/buying2.css">
<link rel="icon" href="../image/share.ico">
<link href="/p/css/kmongadvertise.css" rel="stylesheet">
<link href="/p/css/kmongadvertise2.css" rel="stylesheet">
<link href="/p/css/kmong.css" rel="stylesheet">
<title>Insert title here</title>
<style>

.btn_bottom { margin-top: 6px; text-align: center; }
.btn_bottom span { display: inline-block; width: 130px; padding: 0; border-radius: 3px; color: #fff; font-size: 16px; font-weight:600; line-height: 40px; background: #2fa0ee; }
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<%float star = p.getStar_point()*20;
	String star2 = star+"%";%>
	<div id="A_Container_Wrap">
		<div id="A_Container">
			<div id="A_Contents_L"></div>
			<div id="A_Contents_C">
				<div class="content">
					<h3><%= p.getP_name() %></h3>
					<div class="view_subTit">
						<%=p.getP_simplecontent() %>
					</div>
					<div class="view_imgTable">
						<dd class="image">
							<p>
								<img src="/p/thumbnail_uploadFiles/<%=p.getP_image() %>"
									id="placeholder2" width="450px" height="295px">
							</p>
							<div class="shareMumber">
								공유번호 :
								<%=p.getP_code() %></div>
							<div class="shareSns"></div>
						</dd>
						<dd class="table">
							<table class="shareTable" cellspacing="0">
								<colgroup>
									<col style="width: 131px;">
									<col style="width:;">
								</colgroup>
								<tbody>
									<tr>
										<th style="text-align: center">동시공유가능수</th>
										<td><%=p.getP_share_count() %></td>
									</tr>
									<tr>
										<th style="text-align: center">재능타입</th>
										<td><%=p.getP_type() %></td>
									</tr>


									<tr>
										<th style="text-align: center">공유만족도</th>
										<td><div
												class="gig-userinfo-rating-right inline-block pull-right text-right"
												style="margin-top: 3px; margin-right: 250px; float: left;"id='starpoint2'  >
												<h6 class="gig-userinfo-rating margin-none" >
													<div class="inline-block ">
														<div
															class="rating-container theme-krajee-fa rating-xs rating-disabled rating-margin-none">
															<div class="rating-stars">
																<span class="empty-stars"> <span class="star"><i
																		class="fa fa-star color-e3"></i></span> <span class="star"><i
																		class="fa fa-star color-e3"></i></span> <span class="star"><i
																		class="fa fa-star color-e3"></i></span> <span class="star"><i
																		class="fa fa-star color-e3"></i></span> <span class="star"><i
																		class="fa fa-star color-e3"></i></span>
																</span> <span class="filled-stars" style="width:<%=star2%> " id='starsize'>
																	<span class="star"><i class="fa fa-star"></i></span> <span
																	class="star"><i class="fa fa-star"></i></span> <span
																	class="star"><i class="fa fa-star"></i></span> <span
																	class="star"><i class="fa fa-star"></i></span> <span
																	class="star"><i class="fa fa-star"></i></span>
																</span>

															</div>
														</div>
													</div>

												</h6>
											</div></td>
									</tr>
									<tr>
										<th style="text-align: center">공유종료일</th>
										<td class="co6393b4"><%=p.getP_deadline() %></td>
									</tr>

									<tr>
										<th style="text-align: center">기본가격</th>
										<td class="font_price"></td>
									</tr>
									<%
									
									
									if(p.getOption() !=null){
										String[] option = p.getOption().split(",");%>
									<tr>
                      
                       			 <th style="text-align: center">주문옵션</th>
                        			<td>
                          
                         			 <select id="j_sel" name="j_sel" style="width:280px;">
                            
                             		 <option value="선택">선택</option>
                             		 <%for(int j=0;j<option.length;j++) {
                             		 String[] arrOption = option[j].split("/");
                             		 %>
                             	 <option value='<%=arrOption[2]%>'>옵션명 : <%=arrOption[1]%> ,추가가격 : <%=arrOption[2]%> ,추가일수 : <%=arrOption[3]%></option>
                             	
                             	 <%}; %>
									 </select>    
                        </td>
                    </tr>
                    <%}; %>
									<tr>

									</tr>
									<tr>
										<th style="text-align: center">수량</th>
										<td style="margin-top: 5px;">
											<p class="amount_btn" style="margin-top: 7px;">
												<a onclick='minus();'><span
													class="glyphicon glyphicon-minus"></span></a> <input
													type="text" name="each" id="each" value="1"
													onchange="eaCheck2();" onkeydown="onlyNumber(this)">
												<a onclick='add();'><span
													class="glyphicon glyphicon-plus"></span></a>
											</p>
											<p class="price_box font_price" id='total' style="margin-top: 10px;">
											 <p name='total2' id='total2' style='display:none'></p>	
												<span id="totText"></span>
											</p>
										</td>
									</tr>
								</tbody>
							</table>
							   <form name="gongu" id="gongu">
                        <div class="btn_bottom">
                           <input type="hidden" name="p_name" id="p_name"  value="<%= p.getP_name() %>"> 
                           <input type="hidden" name="option" id="sel1" value="">
                              <input type="hidden" name="idx" value="<%=p.getP_code() %>"> 
                              <span class="bgff4b5c" onclick="purchase( )">주문하기</span>
 
                           <a href="#" id="modaltrigger3"><span>문의하기</span></a> <span
                              class="bg979797" onclick="cart()">공유바구니</span>
                              
                              <script>
                   function cart() {
 
                      var num = '<%=p.getP_code() %>';  
                       location.href="<%=request.getContextPath() %>/wishbuy.do?num=<%=p.getP_code() %>";
                      
                      } 
                   $("#modaltrigger3").click(function(){
                	  var cId = "<%= p.getC_code() %>";
                	  location.href="/p/gotoMessage.me?cId="+cId;
                   });
                    
                   </script>
                              
                              
						
										
										<div
												class="gig-userinfo-rating-right inline-block pull-right text-right"
												style="margin-top: 3px; margin-right: 250px; float:left;display:none;"id='starpoint3'  >
												<h6 class="gig-userinfo-rating margin-none" >
													<div class="inline-block ">
														<div
															class="rating-container theme-krajee-fa rating-xs rating-disabled rating-margin-none">
															<div class="rating-stars">
																<span class="empty-stars"> <span class="star"><i
																		class="fa fa-star color-e3"></i></span> <span class="star"><i
																		class="fa fa-star color-e3"></i></span> <span class="star"><i
																		class="fa fa-star color-e3"></i></span> <span class="star"><i
																		class="fa fa-star color-e3"></i></span> <span class="star"><i
																		class="fa fa-star color-e3"></i></span>
																</span> <span class="filled-stars" style="width:<%=star2 %>; " id='starsize2'>
																	<span class="star"><i class="fa fa-star"></i></span> <span
																	class="star"><i class="fa fa-star"></i></span> <span
																	class="star"><i class="fa fa-star"></i></span> <span
																	class="star"><i class="fa fa-star"></i></span> <span
																	class="star"><i class="fa fa-star"></i></span>
																</span>

															</div>
														</div>
													</div>

												</h6>
											</div>
											
											</div >
											<div style='display:none;'>
						<table style="text-align:center;font-size:20px;width:95%;margin:auto;" id='replytable2'>
						</table>
						</div>

									<script>
                           
                           var count =1;
                           
    
                           $(function(){
                              $("#j_sel").change(function(){
                                 if($("#j_sel").val() != '선택'){
                                 
                                 var price = "<%=p.getP_price()%>";
                                      var price1 = price*count+Number($("#j_sel").val());
                                     
                                      var total =  Number(price1).toLocaleString('en')
                                      $("#total2").text(price1);
                                  $("#total").text(total+" 원");
                                       $("#each").val(count)   
                                 }else{
                                     var price = "<%=p.getP_price()%>";
                                            var price1 = price*count;
                                           
                                            var total =  Number(price1).toLocaleString('en')
                                            $("#total2").text(price1);
                                        $("#total").text(total+" 원");
                                             $("#each").val(count)
                                    
                                 }
                              })
                           })
                           
                            
                              
                           function replyadd(){
                              var userId = $("#userId").val()
                           
                               
                              var replycontent =$("#replycontent").val();
                              var starpoint = $("#starpoint").val();
                              var p_code = "<%=p.getP_code() %>"
                  
                              if(replycontent==""){
                                 alert("내용을 입력하세요")
                              }else{
                              
                              $.ajax({
                                 url:"/p/replyadd",
                                 data:{userId:userId,
                                    replycontent:replycontent,
                                    starpoint:starpoint,
                                    p_code:p_code},
                                 type:"post",
                                 success:function(data){
                                    var star = data[0].AVGstar*20;
                                    var star2 = star+"%";
                                    console.log(star2)
                                    $("#starsize").css("width",star2)
                                    $('#replyzero').remove()
                                    
                                    var $replytable = $('#replytable2');
                                    console.log($replytable)
                                    
                                      $replytable.html('');
                                    $("#replyul").html('');
                                 
                                      var $tr2 = $("<tr>");
                                         var $th2 =$("<td>").text("작성자").css("padding-top", "20px").css("width",'100px');
                                         var $th3 =$("<td>").text("내용").css("padding-top", "20px").css("width",'700px');
                                         var $th4 =$("<td>").text("날짜").css("padding-top", "20px").css("width",'200px');
                                         var $th5 =$("<td>").text("별점").css("padding-top", "20px").css("width",'100px');
                                         
                                      $tr2.append($th2)
                                      $tr2.append($th3)
                                      $tr2.append($th4)
                                      $tr2.append($th5)
                                      $replytable.append($tr2)
                                     
                              
                                      for(var key in data){
                                       var starsize = data[key].star_point*20;
                                       var starsize2 = starsize+"%"
                                       $("#starpoint3").find("#starsize2").css("width",starsize2)
                                       
                                       var $star = $("#starpoint3").html()
                                       
                                    
                                       
                                       
                                       var $tr = $("<tr>").css("text-align",'center').css('font-size','15px');
                                       var $writerTd =$("<td>").text(data[key].c_code).css("padding-top", "20px");
                                       var $contentTd=   $("<td>").text(data[key].reply_content).css("padding-top", "20px");
                                       var $dateTd = $("<td>").text(data[key].reply_time).css("padding-top", "20px");
                                       var $star_pointTd =$("<td>").css("padding-top", "20px");
                                       
                                       
                                       
                                       
                                       $star_pointTd.append($star);
                                       $tr.append($writerTd);
                                            $tr.append($contentTd);
                                            $tr.append($dateTd);
                                            $tr.append($star_pointTd);
                                            $replytable.append($tr);
                                            $("#replyul").append($replytable);
                                       
                                       
                                    }
                                 },
                                 error:function(data){
                                    
                                    console.log("실패")
                                 }
                                 
                              })
                              
                              }
                           }
                           
                           
                           
                
                   
                   
                   $(function(){
                     var price = "<%=p.getP_price()%>";
                     var price1 =  Number(price).toLocaleString('en');
                     $(".font_price").text(price1+" 원");      
                     
                   })
                   
                   function add(option){
                     if("<%=p.getOption() %>" != "null"){
       
                      if(option==null){
                         if($("#j_sel").val()=='선택'){
                      count++;
                      var price = "<%=p.getP_price()%>";
                      var price1 = price*count;
                      var total =  Number(price1).toLocaleString('en')}
                         else{
                            count++;
                              var price = "<%=p.getP_price()%>";
                              var price1 = price*count+Number($("#j_sel").val());
                              var total =  Number(price1).toLocaleString('en')
                            
                         }
                     
                      
                         $("#total2").text(price1);
                      $("#total").text(total+" 원");
                      $("#each").val(count)
                     
                      }else{
                         var price = "<%=p.getP_price()%>";
                          var price1 = price*count+Number(option);
                          var total =  Number(price1).toLocaleString('en');
                          $("#total2").text(price1);
                          $("#total").text(total+" 원");
                          $("#each").val(count)
                     
                      }}else{
                         count++;
                          var price = "<%=p.getP_price()%>";
                          var price1 = price*count
                          var total =  Number(price1).toLocaleString('en')
                          
                          $("#total2").text(price1);
                           $("#total").text(total+" 원");
                           $("#each").val(count)
                         
                      }
                   }
                   function purchase(option) {
                     var p_code = "<%=p.getP_code()%>"; 
                     var p_price="<%=p.getP_price()%>";
                    var qty = count;
                    var option = $("#j_sel option:selected").text();
                    var totalPrice=$("#total2").text();
                   var p_name="<%= p.getP_name() %>";
                   var c_image="<%=p.getP_image() %>";
                   
                    console.log(option);
                    console.log(totalPrice);
                    console.log(qty);
                    console.log(p_code);
                 
                   if(qty === 1){
                      
                      console.log(option)
                      if(option != ""){
                         totalPrice=p_price;
                      location.href="<%=request.getContextPath() %>/searchProduct.do?qty="+qty+"&p_code="+p_code+"&option="+option+"&totalPrice="+totalPrice+"&p_name=<%= p.getP_name() %>&c_image=<%= p.getP_image() %>&p_price=<%=p.getP_price()%>";
                       
                       }else{
                    	   
                          totalPrice=p_price
                          location.href="<%=request.getContextPath() %>/searchProduct.do?qty="+qty+"&p_code="+p_code+"&totalPrice="+totalPrice+"&p_name=<%= p.getP_name() %>&c_image=<%= p.getP_image() %>&p_price=<%=p.getP_price()%>";
                       
                       }
                      
                   }else {
                      if(option != ""){
                         
                          location.href="<%=request.getContextPath() %>/searchProduct.do?qty="+qty+"&p_code="+p_code+"&option="+option+"&totalPrice="+totalPrice+"&p_name=<%= p.getP_name() %>&c_image=<%= p.getP_image() %>&p_price=<%=p.getP_price()%>";
                       
                       }else{
                    	   console.log(totalPrice)
                          location.href="<%=request.getContextPath() %>/searchProduct.do?qty="+qty+"&p_code="+p_code+"&totalPrice="+totalPrice+"&p_name=<%= p.getP_name() %>&c_image=<%= p.getP_image() %>&p_price=<%=p.getP_price()%>";
                     
                       }
                      
                      
                   }
                    
                
                                                                                                                                                                                        
                   }
                   
                   
                   
                   function minus(){
                      if(count != 1){
                        
                         if("<%=p.getOption() %>" != "null"){
                         
                         if($("#j_sel").val()=='선택'){
                         count--;
                         var price = "<%=p.getP_price()%>";
                         var price1 = price*count;
                         var total =  Number(price1).toLocaleString('en');
                         }
                         else{
                            count--;
                              var price = "<%=p.getP_price()%>";
                              var price1 = price*count+Number($("#j_sel").val());
                              var total =  Number(price1).toLocaleString('en')
                            
                         }
                         $("#total2").text(price1);
                         $("#total").text(total+" 원");
                         $("#each").val(count)
                      }else{
                         
                         count--;
                          var price = "<%=p.getP_price()%>";
                          var price1 = price*count;
                          var total =  Number(price1).toLocaleString('en')
                           $("#total2").text(price1);
                           $("#total").text(total+" 원");
                           $("#each").val(count)
                      }
                   }
                   }
                   
                   $(function(){
                      $("#each").change(function(){
                         
                         count= $("#each").val()
                         var price = "<%=p.getP_price()%>";
                         var price1 = price*count;
                         var total =  Number(price1).toLocaleString('en');
                         $("#total2").text(price1);
                         $("#total").text(total+" 원");
                      })
                   })
                   
                   function onlyNumber(obj) {
                      $(obj).keyup(function(){
                           $(this).val($(this).val().replace(/[^0-9]/g,""));
                      }); 
               }

                   </script>

								</div>
							</form>
						</dd>
					</div>


					<table class="share_info" cellspacing="0">
						<colgroup>
							<col style="width: 123px;">
							<col style="width: 132px;">
							<col style="width: 306px;">
							<col style="width: 132px;">
							<col style="width: 306px;">
						</colgroup>

						<tbody>
							<tr>
								<td rowspan="3" class="p_left6"><img  class="image" src="/p/profile_Images/<%=p.getC_image() %>"></td>
								<th style="text-align: center">공유 판매자</th>
								<td><%= p.getC_name() %></td>
								<th style="text-align: center">회원구분</th>
								<td>개인판매회원</td>
							</tr>
							<tr>
								<th style="text-align: center">총 공유 등록 개수</th>
								<td><%=p.getTotal_sell() %>건</td>
								<th style="text-align: center">공유평점</th>
								<td><%=p.getAvg_star() %> / 5</td>
							</tr>
							<tr>
								<th style="text-align: center">실명인증 여부</th>
								<td><% if(p.getP_time()==null ){%>
									미인증
									<%}else{ %>
									인증
									<%}; %>
								</td>
								<th></th>
								<td></td>
							</tr>
						</tbody>
					</table>
					<ul class="share_tab" id="ul1">
						<li class="on">공유상세정보</li>
						<li>공유구매후기</li>
						<li>주문시 주의사항</li>
					</ul>
					<!-- 공유상세정보 -->
					<div class="share_detail font_subject">
						<%=p.getP_content() %>
					</div>

					<!-- 공유 탭 -->
					<ul class="share_tab" id="ul2">
						<li>공유상세정보</li>
						<li class="on">공유구매후기</li>
						<li>주문시 주의사항</li>
					</ul>

					<!-- 공유구매후기 -->

					
					<ul class="share_review" id='replyul'>
						<%if(reply.size()==0) 
						{%>
						<li id='replyzero'>작성된 후기가 없습니다.</li>
						<%}else{ %>
						<table style="text-align:center;font-size:20px;width:95%;margin:auto;" id='replytable' >
						<tr >
							<td style="width:100px;padding-top:20px">작성자</td>
							<td style="width:700px;padding-top:20px">내용</td>
							<td style="width:200px;padding-top:20px">날짜</td>
							<td style="width:100px;padding-top:20px">별점</td>
							
						</tr>
						
						
						<%for(int i=0;i<reply.size();i++){
						int star5 = reply.get(i).getStar_point()*20;
						String starpoint2 = star5+"%";%>
							<tr style="text-align:center;font-size:15px;">
								<td style='padding-top:20px;'><%=reply.get(i).getC_code() %></td>
								<td style='padding-top:20px;'><%=reply.get(i).getReply_content() %></td>
								<td style='padding-top:20px;'><%=reply.get(i).getReply_time() %></td>
								<td style='padding-top:20px;'>
							<h6 class="gig-userinfo-rating margin-none" style='margin-left:10px;'>
								<div class="inline-block ">  
									<div
										class="rating-container theme-krajee-fa rating-xs rating-disabled rating-margin-none">
										<div class="rating-stars">
											<span class="empty-stars"> <span class="star"><i
													class="fa fa-star color-e3"></i></span> <span class="star"><i
													class="fa fa-star color-e3"></i></span> <span class="star"><i
													class="fa fa-star color-e3"></i></span> <span class="star"><i
													class="fa fa-star color-e3"></i></span> <span class="star"><i
													class="fa fa-star color-e3"></i></span>
											</span> <span class="filled-stars" style="width:<%=starpoint2%>"
											>
												<span class="star"><i class="fa fa-star"></i></span> <span
												class="star"><i class="fa fa-star"></i></span> <span
												class="star"><i class="fa fa-star"></i></span> <span
												class="star"><i class="fa fa-star"></i></span> <span
												class="star"><i class="fa fa-star"></i></span>
											</span>
										</div>
									</div>
								</div>
								</td>
								<%}; %>
							
							
							</tr >
							
							
					
						
						</table>
							<%}; %>
						
					

					</ul>
					<%if(loginUser != null ) {%> 
					<table>
						<tr >
							<td style="width:100px;padding-top:20px"></td>
							<td style="width:700px;padding-top:20px"></td>
							<td style="width:200px;padding-top:20px"></td>
							<td style="width:100px;padding-top:20px"></td>
							
						</tr>
						<tr style="text-align:center;font-size:15px;">
							
							<td style='padding-top:20px;'>내용 :</td>
							<td style='padding-top:20px;'>
							<input type='text' style='width:100%' class="btn btn-default" name='replycontent' id='replycontent' style="color:#333;">
							</td>
							<td style='padding-top:15px;' >
							별점 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<select class="btn btn-default" name='starpoint' id='starpoint' style='color:#333'> 
									<option>0</option>
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
								</select>
							</td>
							<td style='padding-top:15px;'>
								<button class="btn btn-default" onclick='replyadd();' style='color:#333'>등록</button>
								<input type='hidden' value='<%= loginUser.getC_name() %>' id='userId'>
							</td>
							
							</tr>
						</table>
						<%}; %>
				

					<!-- 페이지 -->
					<div class="list_page" style='margin: 30px auto 0; text-align: center; zoom: 1; font-size:17px;'>
						<a onclick='page=1; lastback()' class="first_btn" style='display: inline-block; width: 25px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(https://www.sharepeople.co.kr/image/common/arrow_l.png) no-repeat left top;'>처음</a><a onclick="page--;lastback();" class="first2_btn" style='display: inline-block; width: 24px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(https://www.sharepeople.co.kr/image/common/arrow_l.png) no-repeat -25px top;'>이전</a>&nbsp;
						 <a id='currentpage' style='text-decoration:none;color:black'>1 </a>
						&nbsp;<a onclick="page++; lastback();" class="last2_btn" style=' display: inline-block; width: 25px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(https://www.sharepeople.co.kr/image/common/arrow_r.png) no-repeat left top;'>다음</a><a onclick="page=1000000;lastback();" class="last_btn" style='display: inline-block; width: 24px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(https://www.sharepeople.co.kr/image/common/arrow_r.png) no-repeat -26px top;'>맨뒤</a>
					</div>
					<script>
					var page =1;
					
					function lastback(){
						console.log(page)
						var p_code = <%=p.getP_code() %>;
						
					$.ajax({
						url:"/p/selectReplay",
						data:{currentPage:page,
								p_code:p_code},
								type:"post",
						success:function(data){
							$('#replyzero').remove()
							$("#currentpage").text(data[0].currentPage)
							page=data[0].currentPage;
							
							var $replytable = $('#replytable2');
							console.log($replytable)
							
							  $replytable.html('');
							$("#replyul").html('');
						
							  var $tr2 = $("<tr>");
							 	 var $th2 =$("<td>").text("작성자").css("padding-top", "20px").css("width",'100px');
							 	 var $th3 =$("<td>").text("내용").css("padding-top", "20px").css("width",'700px');
							 	 var $th4 =$("<td>").text("날짜").css("padding-top", "20px").css("width",'200px');
							 	 var $th5 =$("<td>").text("별점").css("padding-top", "20px").css("width",'100px');
							  	
							  $tr2.append($th2)
							  $tr2.append($th3)
							  $tr2.append($th4)
							  $tr2.append($th5)
							  $replytable.append($tr2)
							 
					
							  for(var key in data){
								var starsize = data[key].star_point*20;
								var starsize2 = starsize+"%"
								$("#starpoint3").find("#starsize2").css("width",starsize2)
								
								var $star = $("#starpoint3").html()
								
							
								
								
								var $tr = $("<tr>").css("text-align",'center').css('font-size','15px');
								var $writerTd =$("<td>").text(data[key].c_code).css("padding-top", "20px");
								var $contentTd=	$("<td>").text(data[key].reply_content).css("padding-top", "20px");
								var $dateTd = $("<td>").text(data[key].reply_time).css("padding-top", "20px");
								var $star_pointTd =$("<td>").css("padding-top", "20px");
								
								
								
								
								$star_pointTd.append($star);
								$tr.append($writerTd);
			                    $tr.append($contentTd);
			                    $tr.append($dateTd);
			                    $tr.append($star_pointTd);
			                    $replytable.append($tr);
			                    $("#replyul").append($replytable);
								
								
							}
						},
						error:function(data){
							
						}
					})
					}
					
					
					
					</script>
					
					
					<ul class="share_tab" id="ul3">
						<li>공유상세정보</li>
						<li>공유구매후기</li>
						<li class="on">주문시 주의사항</li>
					</ul>
					<h4 class="share_before">공유 전 확인하세요</h4>
					<div class="sb_contents font_contents2">
						· 판매자의 설명과 옵션을 다시 한번 확인하시기 바랍니다. <br> · 판매자가 직거래를 요구하는 경우, 즉시
						고객센터로 신고해 주십시오. <br> · 쉐어피플의 결제시스템을 이용하지 않고 판매자와 직거래를 하는 경우,
						문제발생 시 아무런 도움을 드릴 수 없습니다.<br> · 직거래로 인한 피해발생시 쉐어피플은 이에 대한 일체의
						책임을 지지 않습니다.<br> · 구매한 공유가 설명과 다르거나 판매자와 연락이 되지 않는 경우, 고객센터로
						연락 주시기 바랍니다.
					</div>
					<div class="btn_list">
						<a href="#" onclick='history.back()'><span>목록</span></a>
					</div>

					<div id="popupModal3" class="popupModal" style="display: none">
						<h2>1:1 공유문의</h2> 

						<div class="popupCon2">


							<form name="chkform" method="post" enctype="multipart/form-data">
								<!--form name="frmRequestForm" method="post" onsubmit="return frmRequestForm_Submit(this);" action="query.asp" enctype="multipart/form-data"-->

								<table class="person_change board_write" cellspacing="0">
									<colgroup>
										<col style="width: 180px">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th>공유명</th>
											<td>스타벅스 2017 루돌프 콜드컵</td>
										</tr>
										<tr>
											<th>제목*</th>
											<td><input type="text" name="strTitle"
												style="width: 100%;" class="f_left"></td>
										</tr>
										<tr>
											<th>작성자</th>
											<td>성보123</td>
										</tr>
										<tr>
											<th>문의내용*</th>
											<td><textarea rows="10" style="width: 100%;"
													name="strContent"
													placeholder="문의를 하시면 판매자분께 알림문자가 통보됩니다. 판매자분께서 답변을 하시면 문의자분께도 알림문자가 통보되며, 답변내용은 마이페이지에서 확인 가능합니다."></textarea>
											</td>
										</tr>
										<tr>
											<th>첨부파일</th>
											<td><input type="file" name="strFile"></td>
										</tr>
									</tbody>
								</table>
								<input type="hidden" name="strinsertid" value="성보123"> <input
									type="hidden" name="strgongu" value="스타벅스 2017 루돌프 콜드컵">
								<input type="hidden" name="strupdateid" value="cay0822">
								<div class="btn_bottom f_right">
									<a href="#"><span>보내기</span></a>
								</div>

							</form>

						</div>

					</div>

				</div>
				<!-- #content END -->

			</div>
			<!-- #A_Contents_C END -->

			<div id="A_Contents_R"></div>
		</div>
		<!-- #A_Container END -->
<% if(loginUser!= null && loginUser.getC_id().equals("admin")){ %>
	<div align="center">
		<button id="agree">등록시키기</button>
		<button id="deleteP">삭제시키기</button>
	</div>
	<script>
	$(function(){
		$("#agree").click(function(){
			var pCode = "<%= p.getP_code() %>";
			console.log(pCode);
			$.ajax({
				url:"/p/requestProductAgree.ad",
				type:"post",
				data:{pCode:pCode},
				success:function(data){
					alert(data);
					location.href="/p/requestProductAgree.ad";
				},
				error:function(data){
					alert(data);
				}
			});
		});
	});
	$(function(){
		$("#deleteP").click(function(){
			var pCode = "<%= p.getP_code() %>";
			$.ajax({
				url:"/p/deleteProduct.ad",
				type:"post",
				data:{pCode:pCode},
				success:function(data){
					alert(data);
					location.href="/p/deleteRequestProductList.ad";
				},
				error:function(data){
					alert(data);
				}
			});
		});
	});
	</script>
	<% } %>
	</div>
	
</body>
</html>