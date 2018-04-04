<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" import="java.util.*, com.kh.tc.product.model.vo.product"%>
<%ArrayList<product> proList = (ArrayList<product>)request.getAttribute("proList");   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/p/css/kmongadvertise.css" rel="stylesheet">
<link href="/p/css/kmongadvertise2.css" rel="stylesheet">
<link href="/p/css/kmong.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>

.pimg{
   width:260px;
   border:1px solid black;
   margin:20px;
   
}
.pcontent{
  /*  background:blue;
   border:1px solid black; */
   margin:20px;
   border-top-left-radius:     1em 1em;
   border-top-right-radius:    1em 1em;
   border-bottom-right-radius: 1em 1em;
   border-bottom-left-radius:  1em 1em;
   text-align:right;
}
#ppoto{
   width:258px;
   height:200px;
}
#product{
  position:static;
   height:420px;
   width:300px;
   /* border:1px solid black;  */
   margin-left:15px;
   margin-right:15px;  
   padding-top:5px; 
   border-top-left-radius:     1em 1em;
   border-top-right-radius:    1em 1em;
   border-bottom-right-radius: 1em 1em;
   border-bottom-left-radius:  1em 1em;
}
#product:hover{
position:static;
   box-shadow: 0px 0px 10px 5px  #D3D3D3;
}
.ptitle{
   /* background:yellow; */
   /* border:1px solid black; */
   font-weight: bold;
   font-size:25px;
   text-align:center;
   margin:10px; 
   border-top-left-radius:     1em 1em;
   border-top-right-radius:    1em 1em;
   border-bottom-right-radius: 1em 1em;
   border-bottom-left-radius:  1em 1em;
}
.item{
   height:500px;
}
.table1{
width:1100px;
    margin:auto
}
.table2 th{
   width:250px;   
   height:60px;
   text-align:center;
}
.table2 th:hover{
   cursor:pointer;
   background: #2d9fee;
    color: #ffffff;
}
.table3 {
   align:center;
}
.table3 th{
   width:320px;
   height:250px;
   align:center;
}
.tcenter{
   border-left:1px solid black;
   border-right:1px solid black;
}
.row4 form{
   border-top:1px solid black;
}
.qdiv{
   width:320px;
   overflow: hidden;
   padding:0 10px;
}
.qdiv > p {
   float:left;
}
.qdiv > input{
   float:right;
}
.tright{
   padding-left:20px;
   padding-top:10px;
}
#A_Container {
   width: 1300px;
   margin: auto;
   margin-top: 50px;
   
   margin-bottom: 20px;
   clear: both;
   overflow: hidden;
   min-height: 500px;
    margin-left:335px;  
} 
</style>
<title>오늘의 동료</title>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div class='outer' style='margin:auto'>
<br><br>
<%-- <%@ include file="../common/header.jsp" %> --%>
   <div class="row" style='width:100%;margin:auto'>
      <!-- <div class="row1 lg-col-1" id="rowww"></div> -->
      <div class="row1 lg-col-10">
        <div class="container" style='width:100%'>
           <div id="myCarousel" class="carousel slide" data-ride="carousel">
             <!-- Indicators -->
             <ol class="carousel-indicators">
               <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                  <li data-target="#myCarousel" data-slide-to="1"></li>
                  <li data-target="#myCarousel" data-slide-to="2"></li>
             </ol>
          <!-- Wrapper for slides -->
          <div class="carousel-inner">
           <div class="item active">
           <img src="/p/Pimages/city1.PNG" alt="Los Angeles" style="width:100%;">
           </div>

      <div class="item">
        <img src="/p/Pimages/city1.PNG" alt="Chicago" style="width:100%;">
      </div>
    
      <div class="item">
        <img src="/p/Pimages/city1.PNG" alt="New york" style="width:100%;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
      </div>
      <!-- <div class="row1 lg-col-1"></div> -->
      
      <hr>
   </div>
   <br>
   <!-- 서비스 영역 -->
 <div class='body' style='width:1100px;margin:auto'>
   <div class="row">
      <!-- <div class="row2 lg-col-1"></div> -->
      <div class="row2 lg-col-10">
          <table class="table2" border="1px solid black" text-align="center" align="center" >
            <tr>
               <th><h4 style="font-weight:bold" onclick='viewProduct(1)'>인기서비스</h4></th>
               <th><h4 style="font-weight:bold" onclick='viewProduct(2)'>신규서비스</h4></th>
               <th><h4 style="font-weight:bold" onclick='viewProduct(3)'>추천서비스</h4></th>
               <th><h4 style="font-weight:bold" onclick='viewProduct(4)'>베스트서비스</h4></th>
            </tr>
         </table>
      </div>
      <!-- <div class="row2 lg-col-1"></div> -->
   </div>
   <br>
   <script>
         function viewProduct(num){
            var num1 = num;
            var acheck =1;
            
            $.ajax({
               url:"/p/selectMain",
               type:"post",
               data:{num:num1,
                  acheck:acheck},
               success:function(data){
                  $("#zerodiv").children().html('');
                  if(data.length>0){
                  for(var i=0;i<data.length;i++){
                     var star = data[i].star_point*20;
                     var star2 = star+"%";
                     var ad_code=data[i].ad_code;
      
                     var div1 = $("#example1").children().eq(0);
                     var pprice = Number(data[i].p_price).toLocaleString('en')
                     
                     
                     div1.find("#savefile3").attr("src","/p/thumbnail_uploadFiles/"+data[i].saveFiles);
                     div1.find("#savefile2").attr("src","/p/thumbnail_uploadFiles/"+data[i].saveFiles);
                     div1.find("#imghref").attr("href","/p/selldetail?p_code="+data[i].p_code)
                     div1.find("#simplecontent").text(data[i].p_name);
                     div1.find("#price5").text('₩ '+pprice);
                     div1.find("#sharecount").text("동시 : "+data[i].p_share_count);
                     div1.find("#star").css("width",star2);
                     div1.find("#people").text('('+data[i].people+')')
                      
                     if(ad_code === 1){
                     div1.find("#advertise").attr("src","https://kmong.com/img/gigs/gig_plus_ver3.png")
                     div1.find("#advertise").attr("title","플러스광고")
                     }else if(ad_code === 2){
                        div1.find("#advertise").attr("src","https://kmong.com/img/gigs/gig_premium_ver3.png")
                        div1.find("#advertise").attr("title","프리미엄광고")
                     }else{
                        div1.find("#advertise").attr("src","")
                        div1.find("#advertise").attr("title","")
                     }
                     
                     if(i==0){
                  
                  $("#zerodiv").children().eq(0).append(div1.html())
                        }
                        else if(i==1){
                           
                  $("#zerodiv").children().eq(1).append(div1.html())
                        }else if(i==2){
                  
                  $("#zerodiv").children().eq(2).append(div1.html())
                        }else if(i==3){
                  
                  $("#zerodiv").children().eq(3).append(div1.html())
                        }else if(i==4){
                   
                  $("#zerodiv").children().eq(4).append(div1.html())
                        }else if(i==5){
                   
                  $("#zerodiv").children().eq(5).append(div1.html())
                        }else if(i==6){
                  
                  $("#zerodiv").children().eq(6).append(div1.html())
                        }else if(i==7){
                  
                  $("#zerodiv").children().eq(7).append(div1.html())
                        }else if(i==8){
                  $("#zerodiv").children().eq(4).append("<br>")
                  $("#zerodiv").children().eq(4).append(div1.html())
                        }else if(i==9){
                  $("#zerodiv").children().eq(5).append("<br>")
                  $("#zerodiv").children().eq(5).append(div1.html())
                        }else if(i==10){
                  $("#zerodiv").children().eq(6).append("<br>")
                  $("#zerodiv").children().eq(6).append(div1.html())
                        }else if(i==11){
                  $("#zerodiv").children().eq(7).append("<br>")
                  $("#zerodiv").children().eq(7).append(div1.html())
                                 }
                        
                     }
                  
                     
                  }
               },
               error:function(data){
                  
               }
            })
            
         }
         
         
   
   </script>
 
   
   </div>
   
   
   <!--  샘플   --><div id='A_Container'>

      <div class='col-xs-10' id='zerodiv'>

         <%for(int i =0; i<proList.size(); i++) {
      float star = proList.get(i).getStar_point()*20;
      String star2 = star+"%";%>
         <div
            class="kmong-grid-4-20 gig-wrapper margin-top-20 position-relative"
            data-ga-issend="1" data-ga-category="category"
            data-ga-action="6 - 서비스 클릭" data-ga-label="/category/6"
            id='firstdiv'>

            <div class=" bg-color-white gig-wrapper-default  position-relative">
                 <%if(proList.get(i).getAd_code() == 2 ) {%>
               <div class="gig-premium-img">
                  <img class="width-30px" src="https://kmong.com/img/gigs/gig_premium_ver3.png"
                     title="프리미엄광고">
               </div>
               <%}else if(proList.get(i).getAd_code() == 1){ %>
               <div class="gig-premium-img">
                  <img class="width-30px" src="https://kmong.com/img/gigs/gig_plus_ver3.png"
                     title="플러스광고">
               </div>
               <%}; %> 

               <a class="plain" href="<%=request.getContextPath()%>/selldetail?p_code=<%=proList.get(i).getP_code()%>">

                  <div class="gig-image position-relative">
                     <div class="gig-profile">
                        <div class="position-relative">
                           <div class="gig-list-profile-background-border"></div>
                           <div class="gig-list-profile userProfileRanking SEMIPRO">
                              <img
                                 class="gig-list-user-profile border-round position-relative"
                                 src="/p/thumbnail_uploadFiles/<%=proList.get(i).getSaveFiles() %>"
                                 title="onoffplatform"
                                 onerror="this.onerror=null;this.src='/img/tools/main_user_gray.png'"
                                 >

                           </div>
                        </div>
                     </div>


                     <img class="width-100"
                        src="/p/thumbnail_uploadFiles/<%=proList.get(i).getSaveFiles() %>"
                        title="돈을 벌어다 주는 앱제작과 수익을 낼 수 있는 방법까지 제공 해드립니다"
                        onerror="this.onerror=null;this.src='/img/404/no_gig_sm_image.jpg'"
                        style="width: 225.5px; height: 169.125px"
                        >
                  </div>
               </a>
               <div>
                  <div id="tiong" class="gig-title ">

                     <a class="plain" 
                        >
                        <div class="GigLineClamp line-clamp-default-2 position-relative"
                           style="line-height: 20px !important; height: 40px !important;"
                           >
                           <%=proList.get(i).getP_name() %></div>
                     </a>
                  </div>
               </div>

               <div class="padding-left-15 padding-right-15 padding-bottom-15">
                  <div class="inline-block">
                     <button type="button"
                        class="test inline-block border-none bg-color-transparent font-size-h4 padding-all-0"
                        disabled="">
                        <i class="fa fa-heart-o color-white"></i>
                     </button>
                  </div>
                  <div class="pull-right inline-block">
                     <b class="font-size-h4" id='price1'><span class="NGB">₩</span>&nbsp;<%=String.format("%,d", proList.get(i).getP_price()) %></b><span
                        class="font-size-"> </span>
                  </div>
               </div>

               <div class="border-top-solid padding-left-15 padding-right-15"
                  style="padding-top: 4px; padding-bottom: 4px">
                  <a class="inline-block plain color-dark-gray"
                     style="margin-top: 4px; margin-bottom: 2px;"> <img
                     class="padding-right-5 width-30px"
                     style="vertical-align: inherit !important;">

                     <div class="gig-username font-size-h6"
                        style="max-width: 37px !important; white-space: nowrap; max-width: 55px; text-overflow: ellipsis; float: left; overflow-x: visible;"
                        >
                        동시 : <%=proList.get(i).getP_share_count() %>
                     </div>
                  </a>

                  <div
                     class="gig-userinfo-rating-right inline-block pull-right text-right"
                     style="margin-top: 4px;">
                     <h6 class="gig-userinfo-rating margin-none">
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
                                 </span> <span class="filled-stars" style="width:<%= star2 %>; "
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
                        <div
                           class="inline-block color-dark-gray gig-rating-count font-size-h6">
                           (<%=proList.get(i).getPeople() %>)</div>
                     </h6>
                  </div>
               </div>
            </div>
         </div>
         <%}; %>
         
         

      </div>
   </div>
   
   <br><br>
   <div >
               <span class="glyphicon glyphicon-plus-sign"></span>
      <div class="row4" >
         <form>
            <table class="table3" align="center">
            <th><h3>&nbsp;NOTICE</h3>
            <br>
                   <p>스타벅스 모바일 쿠폰 발송하였... 2017-12-25</p>
                   <p>스타벅스 모바일 쿠폰 발송하였... 2017-12-25</p>
                   <p>스타벅스 모바일 쿠폰 발송하였... 2017-12-25</p>
                   <p>스타벅스 모바일 쿠폰 발송하였... 2017-12-25</p>
               </th>
               <th class="tcenter" >
                  <h3>&nbsp;QnA</h3>
                  <br>
                  <div class="qdiv"><p style="float:left; width:270">공간 등록 수수료 관련 문의</p><input type="button" value="답변완료" class="qbtn" align="right"></div>
                  <div class="qdiv"><p>판매자 등록 완료?</p><input type="button" value="답변완료" class="qbtn"></div>
                  <div class="qdiv"><p>구매자가 판매자에게 처음 문의할 ...</p><input type="button" value="답변완료" class="qbtn"></div>
                  <div class="qdiv"><p>스벅 이벤트</p><input type="button" value="답변완료" class="qbtn"></div>
               </th>
               <th class="tright">
                  <h3>CUSTOMER CENTER</h3>
                  <hr>
                  <h2>010-9904-3929</h2>
                  <hr>
                  <h5>fax : 02-123-4567</h5>
                  <h4>평일 09:00~18:00(토/일/공휴일 휴무)</h4>
               </th>
            </table>
         </form>
      </div> 
      </div>
      <!-- 임시용 -->
         <div class='col-xs-10' id='example1' style="display:none;">
         <div class="kmong-grid-4-20 gig-wrapper margin-top-20 position-relative" data-ga-issend="1" data-ga-category="category" data-ga-action="6 - 서비스 클릭" data-ga-label="/category/6" 
         id="example2" >

            <div class=" bg-color-white gig-wrapper-default  position-relative">
               <div class="gig-premium-img">
                  <img class="width-30px" title="프리미엄광고" id='advertise' onerror="this.style.display='none'" alt=''>
               </div>

               <a class="plain" id='imghref'>

                  <div class="gig-image position-relative">
                     <div class="gig-profile">
                        <div class="position-relative">
                           <div class="gig-list-profile-background-border"></div>
                           <div class="gig-list-profile userProfileRanking SEMIPRO">
                              <img class="gig-list-user-profile border-round position-relative" src="/p/thumbnail_uploadFiles/2018030917360369600.png" title="onoffplatform" onerror="this.onerror=null;this.src='/img/tools/main_user_gray.png'" id='savefile3'>

                           </div>
                        </div>
                     </div>


                     <img class="width-100" src="/p/thumbnail_uploadFiles/2018030917360369600.png" onerror="this.onerror=null;this.src='/img/404/no_gig_sm_image.jpg'" style="width: 225.5px; height: 169.125px" id='savefile2'>
                  </div>
               </a>
               <div>
                  <div id="tiong" class="gig-title ">

                     <a class="plain" >
                        <div class="GigLineClamp line-clamp-default-2 position-relative" style="line-height: 20px !important; height: 40px !important;"
                        id='simplecontent'>
                           345345</div>
                     </a>
                  </div>
               </div>

               <div class="padding-left-15 padding-right-15 padding-bottom-15">
                  <div class="inline-block">
                     <button type="button" class="test inline-block border-none bg-color-transparent font-size-h4 padding-all-0" disabled="">
                        <i class="fa fa-heart-o color-white"></i>
                     </button>
                  </div>
                  <div class="pull-right inline-block" >
                     <b class="font-size-h4" id='price5'><span class="NGB" >₩</span>&nbsp;999</b><span class="font-size-"> </span>
                  </div>
               </div>

               <div class="border-top-solid padding-left-15 padding-right-15" style="padding-top: 4px; padding-bottom: 4px">
                  <a class="inline-block plain color-dark-gray" style="margin-top: 4px; margin-bottom: 2px;"> <img class="padding-right-5 width-30px" style="vertical-align: inherit !important;">

                     <div class="gig-username font-size-h6" style="max-width: 37px !important; white-space: nowrap; max-width: 55px; text-overflow: ellipsis; float: left; overflow-x: visible;" id='sharecount'>
                     </div>
                  </a>

                  <div class="gig-userinfo-rating-right inline-block pull-right text-right" style="margin-top: 4px;">
                     <h6 class="gig-userinfo-rating margin-none">
                        <div class="inline-block ">
                           <div class="rating-container theme-krajee-fa rating-xs rating-disabled rating-margin-none">
                              <div class="rating-stars">
                                 <span class="empty-stars"> <span class="star"><i class="fa fa-star color-e3"></i></span> <span class="star"><i class="fa fa-star color-e3"></i></span> <span class="star"><i class="fa fa-star color-e3"></i></span> <span class="star"><i class="fa fa-star color-e3"></i></span> <span class="star"><i class="fa fa-star color-e3"></i></span>
                                 </span> <span class="filled-stars" style="width:0.0%; " id='star'>
                                    <span class="star"><i class="fa fa-star"></i></span> <span class="star"><i class="fa fa-star"></i></span> <span class="star"><i class="fa fa-star"></i></span> <span class="star"><i class="fa fa-star"></i></span> <span class="star"><i class="fa fa-star"></i></span>
                                 </span>
                              </div>
                           </div>
                        </div>
                        <div class="inline-block color-dark-gray gig-rating-count font-size-h6" id='people'>
                           (70)</div>
                     </h6>
                  </div>
               </div>
            </div>
         </div>
         </div>
      
</body>




<%@ include file="../common/footer.jsp" %>
</html>