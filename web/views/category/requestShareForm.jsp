<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
@charset "euc-kr";
/*@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);*/

@font-face {
  font-family: 'Nanum Gothic';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Regular.eot);
  src: url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Regular.eot?#iefix) format('embedded-opentype'),
       url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Regular.woff2) format('woff2'),
       url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Regular.woff) format('woff'),
       url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Regular.ttf) format('truetype');
}
@font-face {
  font-family: 'Nanum Gothic';
  font-style: normal;
  font-weight: 700;
  src: url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Bold.eot);
  src: url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Bold.eot?#iefix) format('embedded-opentype'),
       url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Bold.woff2) format('woff2'),
       url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Bold.woff) format('woff'),
       url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Bold.ttf) format('truetype');
}
@font-face {
  font-family: 'Nanum Gothic';
  font-style: normal;
  font-weight: 800;
  src: url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-ExtraBold.eot);
  src: url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-ExtraBold.eot?#iefix) format('embedded-opentype'),
       url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-ExtraBold.woff2) format('woff2'),
       url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-ExtraBold.woff) format('woff'),
       url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-ExtraBold.ttf) format('truetype');
}



/* common */
* {margin:0; padding:0; list-style:none; text-decoration:none; font-family: 'Nanum Gothic', sans-serif;}
ul>li>a { text-decoration:none; }
/* table { border-collapse: collapse; }*/
a { color:#666666;}
/*span { color:#666; font-size:12px; }*/

/* LAYOUT */
#A_Wrap       { width:100%; height:100%; }
#A_Header     { width:100%; clear:both; }
#A_Container_Wrap  { width:100%; clear:both; }
#A_Container   { width:1000px; margin:0 auto; margin-top:50px; margin-bottom:20px; clear:both; overflow: hidden; min-height:500px;}

#A_Container_L{ /* 占쏙옙占쏙옙 */
   float:left;   width:200px; padding-right:30px;
}
#A_Container_C{ /* 占쏙옙占쏘데 */
   width:770px; /*占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占싸삼옙占쏙옙占쏙옙*/
   float:left;
   overflow:hidden;
}
#A_Container_R{ /* 占쏙옙占쏙옙占쏙옙 */
   float:right;
   display:none; /* 占쏙옙占쏙옙占십울옙占쏙옙 占쏙옙占쏙옙 */
}
#A_Footer     { width:100%; clear:both; background:#e8e8e8;}

/* header */
.top_login { width:100%; height:34px; border-bottom:1px solid #eeeeee; overflow:hidden; background:#f9f9f9; }
.top_login div { width:1000px; height:34px; margin:0 auto;}
.sns { float:left; height:34px; line-height: px;}
.sns li { float:left; padding:0 2px; }
.sns img { padding-top:5px;}
.login { float:right; height:34px; line-height: 32px;}
.login li{ background:url(../image/common/top_login.gif) no-repeat right center; float:left; padding:0 8px; }
.login li a{ font-size:12px; color:#666; font-weight:600; }
.login li:nth-child(3){ /*padding-right:0;*/ background:none; }

.logo_search { width:1000px; height:80px; margin:0 auto; }
.logo { padding-top:21px; }
.search { padding:6px 0 0 9px; }
.logo_search form { margin:26px 306px 0 0; width:388px; height:36px; float:right; background:#104acf; /*background:#2fa0ee;占쏙옙占쏙옙占시뤄옙*/ overflow:hidden; }
.logo_search input[type=text] { height:30px; width:334px; float:left; border:0px; margin:3px 0 0 3px; outline:none; padding-left:10px; font-size:14px; font-weight:600; color:#000; }
.logo_search input[type=text]::-webkit-input-placeholder{color:#8eaabd; font-size:12px; font-weight:600; }
.logo_search input[type=text]::-moz-placeholder {color:#8eaabd; font-size:12px; font-weight:600; }

/* 占쏙옙占쏙옙 占쌨댐옙 */
.gnb { width:100%; background:#104acf; position:relative;}
.gnb_btn {width:1000px; margin:0 auto; overflow:hidden;}
.gnb_btn>li  { background:url(../image/common/gnb_bar.gif) no-repeat right center; line-height:55px; float:left; font-size:18px; /* text-align:center; */ padding:0 37.2px;}
.gnb_btn>li:nth-child(7){background:none; }
.gnb_btn>li:nth-child(8){ background:#0eade7; width:152px; height:34px; margin:10px; line-height:34px; font-size:14px; padding:0; border-radius:3px; text-align:center; }

.gnb_btn>li>a { font-size:16px; font-weight:600; color:#fff; display:block; line-stacking:-0.25px; /*padding: 20px 22px 17px;*/}
.gnb_btn>li:first-child { border-left:none;}
.gnb_btn>li:hover>.sub_navwrap { display:block;}

/* .sub_navwrap { width:100%; height:176px; display:none; position:absolute; left:0; top:55px; background:rgba(255,255,255,0.8); border-bottom:2px solid #2d9fee; z-index:100; padding-top:20px;} */

.sub_navwrap { /* height:176px; */ display:none; position:absolute; /* left:50%; margin-left:-500px; */ top:55px; background:rgba(255,255,255,0.95); border-bottom:2px solid #2d9fee; z-index:100; padding-top:20px;}

.sub_nav { /* width:1000px; */ margin:0 auto; overflow:hidden; }

.go_box ul { float:left; margin-bottom:15px; margin-left:20px;  width:120px;/* clear:both;  */}
.go_box li {/* float:left;*/ color:#666; font-size:13px; font-weight:600; padding:2px 0; line-height:17px !important; }
.go_box li:first-child { /*width:34px;*/ padding-left:0; text-align:left; }
.go_box li a { color:#666; font-size:13px; font-weight:600; }
.go_box li a:hover, .go_box li a.over { color:#2fa0ee; }
.go_box li b { float:right; }
.titleL li:first-child { width:87px;}
.titleMM li:first-child { width:60px;}
.titleM li:first-child { width:50px;}
.enter {margin-left:43px;}

/* footer */
.foot_btn { width:100%; height:40px; background:#d3d3d3; }
.fb_size { width:1000px; height:40px; margin:0 auto; }
.fb_size ul { float:left; height:40px; line-height:40px; }
.fb_size li { float:left; background:url(../image/common/foot_bar.gif) no-repeat center right; padding:0 13px; }
.fb_size li a{ font-size:12px; color:#666;   font-weight:bold; }
.fb_size li:nth-child(1){ padding-left:0; }
.fb_size li:last-child{   background:none; }
.foot_comInfo { width:1000px; margin:0 auto; height:150px; background:#e8e8e8; position:relative;}
.fc_info {   width:1000px;    margin:0 auto; }
.fc_info li { float:left;}
.fc_info li:first-child { width:800px; padding-top:32px; }
.fc_info li:last-child { float:right; padding-top:30px; }
.fc_info p{ font-size:12px; color:#898989; font-weight:500; margin-bottom:2px; line-height:17px; }

.foot_comInfo .seoul_icon { position:absolute; top:43px; right:145px;}

/* ???? - ??????? */
.star_score { background: url(../image/common/mark.png) no-repeat left -21px; width: 83px; height: 16px; position: relative; margin-top: 2px;}
.star_score em { position: absolute; background: url(../image/common/mark.png) no-repeat; height: 14px; }
.star_count { padding-left:5px; font-size:12px; font-weight:600; color:#666; }
.point_0 { width: 00%; }
.point_1 { width: 20%; }
.point_2 { width: 40%; }
.point_3 { width: 60%; }
.point_4 { width: 80%; }
.point_5 { width:100%; }

/* ????占쏙옙 */
.list_page { margin: 30px auto 0; text-align: center; zoom: 1; }
.list_page .first_btn { display: inline-block; width: 25px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(../image/common/arrow_l.png) no-repeat left top; }
.list_page .first2_btn { display: inline-block; width: 24px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(../image/common/arrow_l.png) no-repeat -25px top; }
.list_page ul { display: inline-block; overflow: hidden; padding: 0 7px; vertical-align: bottom;}
.list_page li { float: left; margin: 0 5px;}
.list_page li:hover a, .list_page li a.on { color: #fff; background: #0eade7;}
.list_page li a { display: block; width: 24px; height: 24px; font-size: 12px; color: #444; text-align: center; line-height: 25px; }
.list_page .last2_btn { display: inline-block; width: 25px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(../image/common/arrow_r.png) no-repeat left top; }
.list_page .last_btn { display: inline-block; width: 24px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(../image/common/arrow_r.png) no-repeat -25px top; }

/* ????? ????????? / ??????? */
.select_btn { width:142px; line-height:24px; /* border:1px solid #ff4b5c; */ border:1px solid #e0e0e0; border-radius:2px; padding-left:6px; background: url(../image/common/bg_select.gif) no-repeat right center; }
.select_btn p { width:120px; text-overflow:ellipsis; overflow:hidden; white-space:nowrap; }
.select_box { display:none; position:absolute; top:22px; width:150px;  z-index:100; }
.select_box a dd { clear:both; background:white; border:1px solid #e0e0e0; padding-left:10px; font-size: 11px; font-weight: normal; }
.select_box a:last-child dd { border-top:none; }
.select_box a dd:hover { background:#2d9fee; }
.select_box a { color:#666666; line-height:24px;}
.select_box a:hover { color:#ffffff; }


/* 怨듭쑀��湲곗쨷 */
.pn_btn { margin-bottom:4px; display:inline-block; padding:6px; background:#444; color:#fff; border-radius:2px; }



/* ?????????? ????? ????? */
.f_left {float:left;}
.f_right { float:right; }

.w110px{width:110px;}
.w150px {width:150px;}
.w290px {width:290px;}
.w400px {width:400px;}

.m_0auto { margin:0 auto; }
.m_top0 {margin-top:0px !important;}
.m_top4 {margin-top:4px !important;}
.m_top13 {margin-top:13px !important;}
.m_top15 {margin-top:15px !important;}
.m_top20 {margin-top:20px !important;}
.m_top30 {margin-top:30px !important;}
.m_top50 {margin-top:50px !important;}
.m_top80 {margin-top:80px !important;}
.m_left0 {padding-left:0px !important;}
.m_right0 {padding-right:0px !important;}
.m_right4 {padding-right:4px !important;}
.m_bottom4 {margin-bottom:4px !important;}
.m_bottom20 {margin-bottom:20px !important;}
.m_bottom40 {margin-bottom:40px !important;}
.m_bottom80 {margin-bottom:80px !important;}
.mlb20 {margin-left:20px !important;  margin-bottom:10px !important;}
.ml10 {margin-left:10px !important; }
.ml20 {margin-left:20px !important; }
.mb10 {margin-bottom:10px !important;}
.mb20 {margin-bottom:20px !important;}
.ml40 {margin-left:40px !important; }
.mlb40 {margin-left:40px !important; margin-bottom:10px }
.mtb3 {margin-top:3px !important;  margin-bottom:3px !important;}
.mt20mb5 {margin-top:20px !important; margin-bottom:20p5x !important;}

.p_left6 {padding-left:6px !important;}
.p_left20 {padding-left:20px !important;}
.p_bottom10 {padding-bottom:10px !important;}
.p_bottom65 {padding-bottom:65px !important;}

.bgnone     { background:none !important; }
.bg444444 { background:#444444 !important; } /*?????*/
.bg979797 { background:#979797 !important; }
.bgff4b5c { background:#ff4b5c !important; }
.bg6393b4 { background:#6393b4 !important; } /*????*/
.bg2fa0ee { background:#2fa0ee !important; } /*???*/
.bge14948 { background:#e14948 !important; } /*????*/
.bgff4b5c { background:#ff4b5c !important; } /*???*/
.bg4b4b4c { background:#4b4b4c !important; }
.bgff8400 { background:#ff8400 !important; } /*??????*/

.bg41aaf2 { background:#41aaf2 !important; }
.bg888888 { background:#888 !important; }
.bga7a7a7 { background:#a7a7a7 !important; }

.co444444 { color:#444444 !important; } /*?????*/
.co6393b4 { color:#6393b4 !important; } /*????*/
.co2fa0ee { color:#2fa0ee !important; } /*???*/
.coff4b5c { color:#ff4b5c !important; } /*???*/
.coe14948 { color:#e14948 !important; } /*????*/

.bor_none { border:none !important; }
.bor_top4ff { border-top: 4px solid #ffffff; }
.bor_btm266 { border-bottom: 2px solid #666666; }
.bor_r {border-right:1px solid #dbdbdb !important;}
.cursor { cursor:pointer; }

/* ???? ???? */
.font_cate       { font-size:12px; font-weight:600; color:#6393b4; }
.font_userId    { font-size:12px; font-weight:600; color:#666; }
.font_hit       { font-size:12px; font-weight:600; color:#666;}
.font_subject    { font-size:14px;  color:#666;  }
.font_subject2    { font-size:16px; font-weight:600; color:#666; }
.font_price      { font-size:18px !important; font-weight:600 !important; color:#ff4b5c !important; }
.font_contents   { font-size:13px; font-weight:   ; color:#888;  }
.font_contents2   { font-size:13px; font-weight:600; color:#666;  }

.font_12no66   { font-size:12px; font-weight:normal; color:#666666; }
.font_12no2f   { font-size:12px; font-weight:normal; color:#2fa0ee; }



/* modal window styles */
#lean_overlay         { position:fixed; top:0px; left:0px; display: none; width:100%; height:100%; background:#000; z-index:100;}
.popupModal            { position:relative; overflow:hidden; width:1080px; height:450px; border:2px solid #2fa0ee; box-sizing:border-box; background: #fff;}
.popupModal *         { box-sizing:border-box; }
.popupModal h2         { position:relative; width:100%; height:40px; line-height:40px; padding-left:20px; color:#fff; font-size:16px; font-weight:600; background:#2fa0ee; margin-top:0 !important; border:none !important;}
.popupModal .popupCon   { position:relative; width:100%; height:100%; }
.popupModal .popupCon dd { position:relative; float:left;  height:100%; padding:10px; border-right:1px solid #cacaca; }
.popupModal .popupCon dd:last-child { border-right:none; }
.popupModal .popup_close      { position:absolute; top:0; right:0; padding:11px; cursor:pointer}

.allCate { position:relative; width:100%; }
.allCate>li { width:100px; padding-left:10px; }
.allCate a {font-size:13px; font-weight:normal; color:#666666;}
.allCate a:hover {color:#2fa0ee;}
.allCate .allCate_tit01    { width:100%; line-height:34px; background:#f7f7f7; border-bottom:1px solid #cacaca; font-size:15px; font-weight:600; color:#272727; }

.tit452 { width:492px; line-height:34px; background:#f7f7f7; border-bottom:1px solid #cacaca; font-size:15px; font-weight:600; color:#272727; padding-left:10px; }
.con452 { position:relative; width:452px; }
.tit252 { width:180px; line-height:34px; background:#f7f7f7; border-bottom:1px solid #cacaca; font-size:15px; font-weight:600; color:#272727; padding-left:10px; }
.con252 { position:relative; width:120px; }
.con452 ul { float:left; width:20%; }
.con252 ul{width:20%; width:96px; float:left;}
.con252 ul:nth-child(2) {float: right; width:20%; }

.allCate_tit02    { padding:10px 0 5px 0; }
.allCate_tit02 a    { font-size:15px !important; font-weight:600; color:#333 !important; padding-bottom:10px;}


/* 등록버튼 */
.tab_step         { zoom:1}
.tab_step:after      { content:""; clear:both; display:block;}
.tab_step li      { position:relative;  float:left; width:25%; box-sizing:border-box; color:#666; }
.tab_step li .tab   { padding:23px 0 17px 15px; border:1px solid #c6c6c6; border-top:1px solid #666666; border-left:0;}
.tab_step li:first-child .tab { border-left:1px solid #c7c7c7;}
.tab_step li h3      { font-size:24px;}
.tab_step li p      { position:absolute; left:90px; top:31px; font-size:16px; font-weight:600; }
.tab_step li img   { position:absolute; right:10px; bottom:16px;}
.tab_step li.on      { color:#fff;}
.tab_step li.on .tab{ background:#0eade7; border-bottom:1px solid #0eade7;}
.tab_step li.on h3   { color:#fff}

div.textarea { margin-bottom:30px; padding:15px; border:1px solid #e6e6e6; }
div.textarea textarea      { width:100%; height:145px; overflow-y:auto; border:0; color:#666; font-size:14px; font-weight:600; line-height:140%; }
.agreeCk               { margin:-20px 0 30px 0; color:#666; font-size:12px; font-weight:600;}
.agreeCk input            { vertical-align:top}

.btn_joinL { margin-top: 20px; text-align: center; }
.btn_joinL span { display: inline-block; width: 190px; padding: 0; border-radius: 3px; color: #fff; font-size: 18px; font-weight:600; line-height: 50px; background: black; }

/* 기본정보입력란 */
.person_change { width:100%; border:1px solid #dedede; border-bottom:none; margin-bottom:30px; font-size:13px;}
.person_change th{ text-align:left; background:#efefef;   color:#666;   font-weight:normal; padding-left:25px; border-bottom:1px solid #e6e6e6; height:40px; }
.person_change td{ position:relative; padding:6px 0 6px 9px; color:#666; border-bottom:1px solid #e6e6e6; }
.person_change p {   margin-left:10px;}
.person_change input {   border:1px solid #c6c6c6;   outline:none;   height:26px;    padding-left:5px;}
.gongU {border: none !important;  width: 230px;}
.person_change input.max { width:98%; }
.person_change textarea.max { width:98%; height:180px; border: 1px solid #c6c6c6; }
.person_change select {   border:1px solid #c6c6c6;   outline:none;   height:28px;    padding-left:5px;}
.person_change textarea {   border:1px solid #e6e6e6;   outline:none;   height:100px;    width:96%;   padding-left:5px;}
.person_change input[type=password] {   width:235px;}
.person_change input[type=email], .person_change input[type=url] {   width:290px;}
.person_change input[type=tel]{   width:80px;}
.phone_vide {   color:#888;}
.ph{   width:78px;}
.address{   margin-right:4px;   width:177px;   float:left;}
.address_btn{   display:block;   float:left;   margin-top:5px;   cursor:pointer;}
.address_detail01 {   width:350px;}
.address_detail02 {   margin-left:5px;   width:350px;}
.job{   width:293px;}
.last_grade{   width:240px;}
.career {   width:61px;   margin-bottom:7px;}
.new{   position:relative;   top:9px;   margin-left:10px;   margin-right:5px;}
.btn_joinS { display: inline-block; padding:0 10px; border-radius: 2px; color: #fff; font-size: 12px; line-height: 28px; background: #2fa0ee; background:#979797;}

.share { text-align:center; margin-top:30px;     display: inline-block;
    width: 100%;}

.share .btn_joinS {  display: inline-block; padding:0 25px; border-radius: 2px; color: #fff; font-size: 16px; line-height:45px; background: #2fa0ee;}


/*카테고리 선택 */
.register_txtbox {width:95.8%; background:#efefef; border:1px solid #dedede; padding:15px 20px; margin-bottom:40px; }
.register_txtbox li { line-height:30px; background: url(../image/common/list_dot.png) no-repeat left center; padding-left:15px; font-size:14px; color:#666666; text-align:left; }

.register_cate { width:100%; display:inline-block; margin-bottom:40px; }
.register_cate li { float:left; width:23.5%; margin-right:20px; }
.register_cate li:last-child { float:left; margin-right:0px; }
.register_cate select { width:100%;   border:1px solid #c6c6c6;   outline:none;   height:26px;    padding-left:5px; color:#666;}

.register_file img { width:80px; height:53px; float:left;}
.register_file .file_choice { margin:12px 0 0 20px; }
.rf_coment { position:absolute; top:15px; left:180px; line-height:18px;}
.rf_delete { position:absolute; top:24px;  right:30px; }

.register_option { display:table; margin:0 auto; clear:both; margin-bottom:40px; }
.register_option ul { width:240px; border:1px solid #c6c6c6; margin:0 auto; background:#efefef; padding:5px 20px; font-size:13px; color:#666666; float:left; margin-right:10px;}
.register_option ul:last-child {margin-right:0;}
.register_option ul li { position:relative; line-height:40px; }
.register_option ul li:nth-last-child(2) { padding-bottom:20px;}
.register_option ul li:last-child { text-align:center; line-height:60px; border-top:1px solid #c6c6c6; }
.register_option select { border:1px solid #c6c6c6;   outline:none; width:100%;   height:28px;    padding-left:5px;  font-size:12px; color:#666666;}
.register_option input { border:1px solid #c6c6c6;   outline:none; width:160px;   height:26px;    padding-left:5px; }
.register_option div input { position:absolute; right:0; top:6px;}
.register_option a { display: inline-block; padding:0 10px; border-radius: 2px; color: #fff; font-size: 12px; line-height: 28px; background: #2fa0ee; background:#979797;}
.bor_none .share_star {color: #666; float: right;font-weight: 100;  font-size: 12px;}

* {
	margin: 0;
	padding: 0;
	list-style: none;
	text-decoration: none;
	font-family: 'Nanum Gothic', sans-serif;
}

h1, p, h2, h3 {
	font-family: 'Nanum Pen Script', cursive;
}

table, textarea {
	width: 100%;
}

ol {
	background-color: #dddddd;
	margin: 0;
	padding: 20px;
	list-style-type: none;
}

li {
	margin: 10px;
}

#h1 {
	color: #444;
	font-size: 26px;
	font-weight: 600;
	padding-bottom: 20px;
}

#h2 {
	color: #444;
	font-size: 18px;
	font-weight: 600;
	margin-top: 60px;
	border-bottom: 2px solid #666;
	line-height: 40px;
}

#h3 {
	color: #666;
	font-size: 16px;
	font-weight: 600;
}

#h4 {
	color: #666;
	font-size: 14px;
	font-weight: 600;
}

#option3 {
	display: inline;
	width: 20%;
	flow: left;
}

#category {
	margin: 10px;
	display: inline;
}

ul {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

h1, h2, h3 {
	margin-top: 60px;
}

#option1, #option2 {
	padding: 10px;
	background-color: #dddddd;
	border: 1px solid gray;
}

th {
	text-align: left;
	background: #efefef;
	color: #666;
	font-weight: normal;
	padding-left: 25px;
	border-bottom: 1px solid #e6e6e6;
	height: 40px;
}

#Container1 {
	width: 1100px;
	margin: 0 auto;
	margin-top: 50px;
	margin-bottom: 20px;
	clear: both;
	overflow: hidden;
	min-height: 500px;
}

.bor_none {
	border: none !important;
}

.bor_top4ff {
	border-top: 4px solid #ffffff;
}

.bor_btm266 {
	border-bottom: 2px solid #666666;
}

.bor_r {
	border-right: 1px solid #dbdbdb !important;
}

.cursor {
	cursor: pointer;
}

.m_0auto {
	margin: 0 auto;
}

.m_top0 {
	margin-top: 0px !important;
}

.m_top4 {
	margin-top: 4px !important;
}

.m_top13 {
	margin-top: 13px !important;
}

.m_top15 {
	margin-top: 15px !important;
}

.m_top20 {
	margin-top: 20px !important;
}

.m_top30 {
	margin-top: 30px !important;
}

.m_top50 {
	margin-top: 50px !important;
}

.m_top80 {
	margin-top: 80px !important;
}

.m_left0 {
	padding-left: 0px !important;
}

.m_right0 {
	padding-right: 0px !important;
}

.m_right4 {
	padding-right: 4px !important;
}

.m_bottom4 {
	margin-bottom: 4px !important;
}

.m_bottom20 {
	margin-bottom: 20px !important;
}

.m_bottom40 {
	margin-bottom: 40px !important;
}

.m_bottom80 {
	margin-bottom: 80px !important;
}

.mlb20 {
	margin-left: 20px !important;
	margin-bottom: 10px !important;
}

.ml10 {
	margin-left: 10px !important;
}

.ml20 {
	margin-left: 20px !important;
}

.mb10 {
	margin-bottom: 10px !important;
}

.mb20 {
	margin-bottom: 20px !important;
}

.ml40 {
	margin-left: 40px !important;
}

.mlb40 {
	margin-left: 40px !important;
	margin-bottom: 10px
}

.mtb3 {
	margin-top: 3px !important;
	margin-bottom: 3px !important;
}

.mt20mb5 {
	margin-top: 20px !important;
	margin-bottom: 20p5x !important;
}

.p_left6 {
	padding-left: 6px !important;
}

.p_left20 {
	padding-left: 20px !important;
}

.p_bottom10 {
	padding-bottom: 10px !important;
}

.p_bottom65 {
	padding-bottom: 65px !important;
}

.bgnone {
	background: none !important;
}

.bg444444 {
	background: #444444 !important;
} /*?????*/
.bg979797 {
	background: #979797 !important;
}

.bgff4b5c {
	background: #ff4b5c !important;
}

.bg6393b4 {
	background: #6393b4 !important;
} /*????*/
.bg2fa0ee {
	background: #2fa0ee !important;
} /*???*/
.bge14948 {
	background: #e14948 !important;
} /*????*/
.bgff4b5c {
	background: #ff4b5c !important;
} /*???*/
.bg4b4b4c {
	background: #4b4b4c !important;
}

.bgff8400 {
	background: #ff8400 !important;
} /*??????*/
.bg41aaf2 {
	background: #41aaf2 !important;
}

.bg888888 {
	background: #888 !important;
}

.bga7a7a7 {
	background: #a7a7a7 !important;
}

.register_option {
	display: table;
	margin: 0 auto;
	clear: both;
	margin-bottom: 40px;
}

.register_option ul {
	width: 280px;
	border: 1px solid #c6c6c6;
	margin: 0 auto;
	background: #efefef;
	padding: 5px 20px;
	font-size: 13px;
	color: #666666;
	float: left;
	margin-right: 10px;
}

.register_option ul:last-child {
	margin-right: 0;
}

.register_option ul li {
	position: relative;
	line-height: 40px;
	margin: auto;
}

.register_option ul li:nth-last-child(2) {
	padding-bottom: 20px;
}

.register_option ul li:last-child {
	text-align: center;
	line-height: 60px;
	border-top: 1px solid #c6c6c6;
}

.register_option select {
	border: 1px solid #c6c6c6;
	outline: none;
	width: 100%;
	height: 28px;
	padding-left: 5px;
	font-size: 12px;
	color: #666666;
}

.register_option input {
	border: 1px solid #c6c6c6;
	outline: none;
	width: 175px;
	height: 26px;
	padding-left: 5px;
}

.register_option div input {
	position: absolute;
	left: 60px;
	top: 6px;
}

.register_option a {
	display: inline-block;
	padding: 0 10px;
	border-radius: 2px;
	color: #fff;
	font-size: 12px;
	line-height: 28px;
	background: #2fa0ee;
	background: #979797;
}

.bor_none .share_star {
	color: #666;
	float: right;
	font-weight: 100;
	font-size: 12px;
}

#max {
	width: 100%;
}

#max2 {
	width: 100%;
	height: 180px;
	border: 1px solid #c6c6c6;
}

.register_option {
	display: none;
}



</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<br><br><br>

<div id="A_Container_Wrap">
        <div id="A_Container">
            <div id="A_Contents_L">

            </div>

            <div id="A_Contents_C">
              
<!--form name="frmRequestForm" method="post" onsubmit="return frmRequestForm_Submit(this);" action="query.asp" enctype="multipart/form-data"-->

<link href="../_css/jquery-ui.css" rel="stylesheet" type="text/css">
<script src="../js/jquery-ui.js"></script>
<script type="text/javascript">


$(function() {
 $(".datepicker").datepicker({
    dateFormat: 'yy-mm-dd',
    changeMonth:'true',
    changeYear:'true',
    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
    });
});
</script>
<script>
	$(function() {
		$("#category1").change(function() {
			var cate1 = $("#category1 option:selected").val();
			var $select = $("#category2");
			$select.find("option").remove();
			$select.append("<option>2차 카테고리 선택</option>");
			var $select = $("#category3");
			$select.find("option").remove();
			$select.append("<option>3차 카테고리 선택</option>");
			var $select = $("#category4");
			$select.find("option").remove();
			$select.append("<option>4차 카테고리 선택</option>");

			$.ajax({
				url : "/p/cate1",
				data : {
					cate1 : cate1,
					msg : "2차"
				},
				type : "get",
				success : function(data) {
					if (data != null) {
						var $select = $("#category2");
						$select.find("option").remove();

						for (var i = 0; i < data.length; i++) {
							var $option = $("<option>");
							if (i == 0) {
								$select.append("<option>2차 카테고리 선택</option>");
							}

							$option.text(data[i]);

							$select.append($option);
						}
					} else {
						var $select = $("#category2");
						$select.find("option").remove();
						$select.append("<option>2차 카테고리 선택</option>");
						var $select = $("#category3");
						$select.find("option").remove();
						$select.append("<option>3차 카테고리 선택</option>");
						var $select = $("#category4");
						$select.find("option").remove();
						$select.append("<option>4차 카테고리 선택</option>");

					}
				},
				error : function(data) {
					console.log("실패")
				}
			})

		})

		$("#category2").change(function() {
			var cate1 = $("#category2 option:selected").val();
			
			var $select = $("#category3");
			$select.find("option").remove();
			$select.append("<option>3차 카테고리 선택</option>");
			var $select = $("#category4");
			$select.find("option").remove();
			$select.append("<option>4차 카테고리 선택</option>");

			$.ajax({
				url : "/p/cate1",
				data : {
					cate1 : cate1,
					msg : "3차"
				},
				type : "get",
				success : function(data) {
					if (data != null) {
						var $select = $("#category3");
						$select.find("option").remove();

						for (var i = 0; i < data.length; i++) {
							var $option = $("<option>");
							if (i == 0) {
								$select.append("<option>3차 카테고리 선택</option>");
							}

							$option.text(data[i]);

							$select.append($option);
						}
					} else {
						var $select = $("#category3");
						$select.find("option").remove();
						$select.append("<option>3차 카테고리 선택</option>");
						
						var $select = $("#category4");
						$select.find("option").remove();
						$select.append("<option>4차 카테고리 선택</option>");

					}
				},
				error : function(data) {
					console.log("실패")
				}
			})

		})
		$("#category3").change(function() {
			var cate1 = $("#category3 option:selected").val();
			
			var $select = $("#category4");
			$select.find("option").remove();
			$select.append("<option>4차 카테고리 선택</option>");

			$.ajax({
				url : "/p/cate1",
				data : {
					cate1 : cate1,
					msg : "4차"
				},
				type : "get",
				success : function(data) {
					if (data != null) {
						var $select = $("#category4");
						$select.find("option").remove();

						for (var i = 0; i < data.length; i++) {
							var $option = $("<option>");
							if (i == 0) {
								$select.append("<option>4차 카테고리 선택</option>");
							}

							$option.text(data[i]);

							$select.append($option);
						}
					} else {
						var $select = $("#category4");
						$select.find("option").remove();
						$select.append("<option>4차 카테고리 선택</option>");

					}
				},
				error : function(data) {
					console.log("실패")
				}
			})

		})
	})

</script>
<h1>재능요청등록</h1>
            <ul class="register_txtbox">
                <li>공유 요청 아닌 홍보성 글이나 무성의한 글은 승인이 거절됩니다.</li>
                <li>직거래를 유도하는 공유 요청은 사전 경고없이 삭제 처리되며, 회원 이용에 제안이 있을 수 있습니다.</li>
                <li>연락처, 이메일 등 개인정보가 포함된 글은 관리자에 의해 임으로 삭제될 수 있습니다.</li>
            </ul>

         <h2 class="bor_none m_top20">재능 카테고리 선택</h2>
      

  
   <input type='hidden' value='<%=loginUser.getC_code()%>' name='c_code'>
			<ul>
				<li id="category" class='cate1'><select id='category1'
					class="btn btn-default" name='category'>
						<option>1차 카테고리 선택</option>
						<option>시간</option>
						<option>재능</option>
						<option>물건</option>
						<option>공간</option>
						<option>차량</option>
				</select></li>

				<li id="category" class='cate2'><select id='category2'
					class="btn btn-default" name='category'>
						<option>2차 카테고리 선택</option>
				</select></li>

				<li id="category" class='cate3'><select id='category3'
					class="btn btn-default" name='category'>
						<option>3차 카테고리 선택</option>
				</select></li>

				<li id="category" class='cate4'><select id='category4'
					class="btn btn-default" name='category'>
						<option>4차 카테고리 선택</option>
				</select></li>

			</ul>

	<form action="<%=request.getContextPath()%>/insertRequest.do" method="post">
	 
  <input name="category" type="hidden" value="">
            <h2 class="bor_none m_top20">재능 기본정보 입력</h2>
         <table class="person_change m_bottom40" cellspacing="0">
            <colgroup>
               <col style="width:150px">
               <col>
            </colgroup>
                <tbody><tr>
   
               <th>재능명 </th>
               <td><input class="max" type="text" name="p_name"></td>
            </tr>
            <tr>
            <!-- 요청선택 -->
            <input type="hidden" name="req_status" value="Y">
            </tr>
                <tr>
               <th class="active">재능요청마감일 *</th>
					<td><input class="btn btn-default" type="date" name="p_date"
						id="dp1520352382982">&nbsp; 
						<input class="btn btn-default"
						type="time" name="p_date2" id="tp1520352382989"> </td>
			                
            </tr>
                <tr>
               <th>희망가격 *</th>
               <td><input class="w400px" type="number" name="p_price"> 원</td>
            </tr>
            <tr>
               <th>재능상세설명 *</th>
               <td><textarea class="max" name="p_simplecontent" placeholder="판매를 원하시는 분들은 공유요청이 아닌 공유등록 기능을 이용해주세요."></textarea></td>
            </tr>

         </tbody></table>

         <div class="btn_joinL">
           <button type="submit">등록</button>
     
         </div>
</form>

	<script type="text/javascript">
	/* 폼 정규화 처리 */
	function formcheck(){
		
		var $cate1 = $("#category1 option:selected");
		var $cate2 = $("#category2 option:selected");
		var $cate3 = $("#category3 option:selected");
		var $cate4 = $("#category4 option:selected");
		
		var $title = $("#max");
		
		var $date = $("#dp1520352382982");
		var $time = $("#tp1520352382989");
	
		var $sellstate= $("input[name=sellstate]");
		
		var $titleImg =$("#titleImg");
		
		var $price = $("#price");
		
		var $sharecount = $("#sharecount");
		
		
		
		 if($cate1.val()=="1차 카테고리 선택"||$cate2.val()=="2차 카테고리 선택"||$cate3.val()=="3차 카테고리 선택"||$cate4.val()=="4차 카테고리 선택"){
			alert("카테고리를 선택하세요");
			$cate1.focus();
			return false;
		}else if($title.val()==""){
			alert("재능명을 입력하세요");
			 $title.focus();
			 return false;
		}else if($date.val()==""){
			alert("마감일을 정하세요");
			$date.focus();
			return false;
		}else if($time.val()==""){
			alert("마감시간을 정하세요");
			$time.focus();1
			return false;
		}else if(!$sellstate.is(":checked")){
			alert("판매상태를 체크하세요");
			$sellstate.focus();
			return false;
		}else if($titleImg.attr('src')==null){
			alert("대표이미지를 선택하세요");
			$("#thumbnail1").focus();
			return false; 
		}else if($price.val()==""){
			alert("기본 가격을 입력하세요");
			$("#price").focus();
			return false;
		}else if($sharecount.val()==""){
			alert("공유가능 횟수를 입력하세요");
			$("#sharecount").focus();
			return false;
		}
			
			$("#editor").text(CKEDITOR.instances.editor.getData());
			
			
			return true;
		
		
	} 
</script>

    
<br><br><br><br>
<%@ include file="../common/footer.jsp" %>
</body>
</html>