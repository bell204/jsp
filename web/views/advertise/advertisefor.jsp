<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/p/css/kmongadvertise.css" rel="stylesheet">
<link href="/p/css/kmongadvertise2.css" rel="stylesheet">
<link href="/p/css/kmong.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="global-body">

    
    <script>
        var $globalBody = $('.global-body');
                


        if($('#penaltyDetailBanner').length > 0){
            $('#kmongNavBar').css('margin-top',$('#penaltyDetailBanner').height() + 'px');
            $('#penaltyDetailBanner').css({
                'position' : 'fixed',
                'top' : 0,
                'z-index' : 100
            });
        }
        
        
                

    </script>
    

    <div class="container position-relative">
        <div id="fixedEmtyBox" style="width: 110%; height: 0.1px; display: none"></div>
    <div id="quickMenuFixed" class="inline-block text-center kmong-quick-menu">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <div class="kmong-quick-menu-wrap fixed">
            <div class="panel panel-default margin-bottom-10">
                <div class="panel-body padding-all-15">
                                                                <div class="row margin-bottom-15">
                            <div class="col-xs-12">
                                <div class="padding-bottom-15 border-bottom-solid">
                                    <a class="plain font-color-lighter cursor sendGAEventClz" data-toggle="modal" data-target="#kmongManual" data-name="퀵 메뉴 - 구매방법" onclick="sendGAEvent('quickMenu', '구매방법', '/ad_request');">
                                        <img class="width-20px" src="/img/quick_menu/ic_kmong_how.png">
                                        <div class="margin-top-5">구매방법</div>
                                    </a>
                                </div>
                            </div>
                        </div>
                                        <div class="row">
                        <div class="col-xs-12">
                            <nav id="kmongNotificationMenuDiv" style="">
    <div class="row position-relative margin-none">
        <div class="col-xs-12 padding-all-0 position-relative text-center cursor sendGAEventClz" data-name="퀵 메뉴 - 크몽안내" onclick="sendGAEvent('quickMenu', '크몽안내', kmongCurrentPath);">
            <div class="">
               
                <img class="width-25px" src="/img/quick_menu/ic_FAQ.png">
                <img class="width-25px hidden" src="/img/quick_menu/ic_FAQ_active.png">


            </div>
            <h6 class="margin-none font-color-lighter margin-top-5" style="font-size: 10px !important;">
                크몽안내
            </h6>

            <div class="position-absolute kmong-KB-notification-menu-unread-count cursor" style="display: none">
                <span class="bg-color-count-red color-white border-round font-size-h6">0</span>
            </div>
        </div>
        <div class="kmong-KB-message-box cursor" style="display: none">
            <div class="bg-color-light-yellow word-break kmong-KB-unread-notification-body NGB card-font-size-small" style="">
                
                
            </div>
        </div>
    </div>
</nav>



<div id="kmongKnowledgeBase" class="bg-color-fa border-left kmong-KB text-left font-size-h5" style="display: none; height: 794px;">
    <div id="kmongKnowledgeBaseCarousel" class="carousel slide" data-ride="carousel" data-interval="false">
        <div class="row margin-left-0 margin-right-0 kmong-KB-nav-shadow">
            <div class="col-xs-11 padding-left-0 padding-right-0">
                <ul class="nav text-center bg-color-white kmong-KB-nav" role="tablist">
                                            <li role="presentation" class="kmongKBNav col-xs-6 active"><a id="kmongFAQLink" class="font-color-lighter font-size-h4" href="#kmongFAQ" aria-controls="home" role="tab" data-toggle="tab" onclick="$('#kmongKnowledgeBaseCarousel').carousel(0);">자주 묻는 질문</a></li>
                        <li role="presentation" class="kmongKBNav col-xs-6"><a id="kmongHelpCenterLink" class="font-color-lighter font-size-h4" href="#kmongHelpCenter" aria-controls="profile" role="tab" data-toggle="tab" onclick="$('#kmongKnowledgeBaseCarousel').carousel(0);">크몽 고객센터</a></li>
                                    </ul>
            </div>
            <div class="col-xs-1 bg-color-white text-right padding-bottom-10 padding-left-0 cursor" style="margin-top:11px">
                <i class="fa fa-close color-gray-d1 font-size-20"></i>
            </div>
        </div>
        <div class="carousel-inner" role="listbox">
            
            <div class="item active kmong-KB-menu" data-index="0" style="height: 794px;">
                <div id="kbCategoryBody" class="row margin-left-0 margin-right-0 overflow-y" style="height: 754px;">
                    <div class="col-xs-12 padding-left-0 padding-right-0">
                        <div class="tab-content">
                            <div role="tabpanel" class="kmongKBTab tab-pane position-relative active" id="kmongFAQ">
                                <div class="padding-left-15 padding-right-15">
                                    <div id="kbCategoryHeader">
                                        <div class="font-size-20 NGB margin-top-30">문의 전 확인</div>
                                        <h5 class="margin-top-5">아래 검색창을 통해 원하시는 답변을 빠르게 찾아 보실 수 있습니다.</h5>
                                    </div>
                                    <div class="form-group input-text-group margin-top-30">
                                        <span class="twitter-typeahead" style="position: relative; display: inline-block;"><input type="text" class="form-control padding-left-30 input-sm text-left-imp kb_search_bar border-radius-0 tt-input" placeholder="검색어를 입력해주세요" autocomplete="off" spellcheck="false" dir="auto" style="position: relative; vertical-align: top;"><pre aria-hidden="true" style="position: absolute; visibility: hidden; white-space: pre; font-family: &quot;NotoSansKR Regular&quot;; font-size: 13px; font-style: normal; font-variant: normal; font-weight: 400; word-spacing: 0px; letter-spacing: 0px; text-indent: 0px; text-rendering: auto; text-transform: none;"></pre><div class="tt-menu" style="position: absolute; top: 100%; left: 0px; z-index: 100; display: none;"><div class="list-group margin-none margin-none-0"></div></div></span>
                                        <div class="kmong-KB-search-icon">
                                            <i class="fa fa-search font-color-lighter" aria-hidden="true"></i>
                                        </div>
                                        <div class="inline-block kb-category-close cursor" style="display: none;">
                                            <span>
                                                <i class="fa fa-times font-color-lighter" aria-hidden="true"></i>
                                            </span>
                                        </div>
                                    </div>

                                </div>
                                <div class="panel-group margin-none border-radius-none margin-top-30" id="kbCategoryAccordion" role="tablist" aria-multiselectable="true">
                                    

                                    <div class="row margin-left-0 margin-right-0 bg-color-white padding-top-15 padding-bottom-15 border-top-solid" style="display: none">
                                        <div class="col-xs-12 padding-right-0 padding-left-20 text-left">
                                            <h5 class="margin-top-0 font-color-lighter">원하는 결과를 찾지 못했나요?</h5>
                                            <button class="btn btn-primary padding-top-10 padding-bottom-10 padding-left-15 padding-left-15" onclick="$('#kmongKnowledgeBaseCarousel').carousel(0);$('#kmongHelpCenterLink').trigger('click');$('#kbCategoryBody').scrollTop(0);">크몽 고객센터</button>
                                        </div>
                                    </div>
                                </div>
                                <ul id="kbCategoryQueryBody" class="list-group list-unstyled overflow-y margin-none padding-left-15 position-relative" style="display: none;">
                                    

                                    <li class="border-bottom-solid padding-bottom-15 padding-top-15 bg-color-transparent border-radius-none kmong-kb-search cursor padding-left-0 padding-right-0">
                                        <h5 class="margin-top-0 font-color-lighter">원하는 결과를 찾지 못했나요?</h5>
                                        <button class="btn btn-primary padding-top-10 padding-bottom-10 padding-left-15 padding-left-15" onclick="$('#kmongKnowledgeBaseCarousel').carousel(0);$('#kmongHelpCenterLink').trigger('click');$('#kbCategoryBody').scrollTop(0);">크몽 고객센터</button>
                                    </li>


                                </ul>
                            </div>

                            <div role="tabpanel" class="kmongKBTab tab-pane kmong-KB-menu-margin-adjust" id="kmongHelpCenter">
                                <div class="row margin-none bg-color-fa">
                                    <div class="col-xs-12 padding-right-15 padding-left-15">
                                        <div class="font-size-20 NGB margin-top-30">안녕하세요, 크몽 고객센터입니다.</div>
                                        <h5 class="line-height margin-top-5">문의 내용을 상세히 작성하여 보내주시면, 입력된 이메일 주소를 통해 빠르게 답변해드리도록 하겠습니다. </h5>
                                    </div>
                                </div>

                                <div class="row margin-none">
                                    <div class="col-xs-12 padding-all-20">
                                        <h6 class="font-color-lighter">이메일</h6>
                                        <div id="helpCenter_from_email" class="form-group margin-bottom-10">
                                            <input type="text" class="form-control input-sm" placeholder="이메일">
                                            <span id="helpCenter_from_email_error" class="help-block padding-left-0" style="display: none"><i class="fa fa-exclamation-triangle"></i>&nbsp;이메일을 입력해주세요.</span>
                                        </div>

                                        <div id="helpCenter_title" class="form-group margin-bottom-10">
                                            <h6 class="margin-top-15 font-color-lighter">제목</h6>
                                            <div class="form-group input-text-group">
                                                <span class="input-inner-text-sm-no-label bg-color-white padding-left-5 color-primary cursor" style="pointer-events: auto; display: none;" onclick="$('#related_kb').toggle();">                                                    관련 답변들(0개)                                                    <i class="fa fa-chevron-circle-down" aria-hidden="true"></i>
                                                </span>
                                                <input type="search" class="form-control input-sm text-left-imp" placeholder="제목을 작성해주세요.">
                                            </div>
                                            <span id="helpCenter_title_error" class="help-block padding-left-0" style="display: none"><i class="fa fa-exclamation-triangle"></i>&nbsp;제목을 입력해주세요.</span>
                                        </div>

                                        <ul id="related_kb" class="list-group overflow-y margin-none" style="display: none;">
                                            
                                            <li class="list-group-item border-radius-none bg-color-gray border-top-none text-right" onclick="$('#kmongFAQLink').trigger('click');" style="display: none;">
                                                <span class="cursor font-color-lighter font-size-h6">
                                                    관련문의더보기
                                                </span>
                                            </li>
                                        </ul>


                                        <div id="helpCenter_body" class="form-group margin-all-0">
                                            <h6 class="margin-top-15 font-color-lighter">내용</h6>
                                            <textarea class="form-control border-radius-bottom-none" placeholder="문의 내용을 작성해주세요." rows="7"></textarea>
                                            <span id="helpCenter_body_error" class="help-block padding-left-0" style="display: none"><i class="fa fa-exclamation-triangle"></i>&nbsp;내용을 입력해주세요.</span>
                                        </div>


                                        <div class="border-solid border-top-none padding-all-10">
                                            <div class="row dropzone-preview-helpcenter margin-top-5"></div>
                                            <a id="dropzoneFileHelp" class="btn btn-default sendBtn btn-xs dz-clickable">파일첨부</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="row margin-none">
                                    <div class="col-xs-12 padding-left-20 padding-right-20">
                                        <a id="sendHelpCenterForm" class="btn btn-primary btn-sm btn-block">문의하기</a>
                                    </div>
                                </div>

                                <div class="row margin-none margin-top-10">
                                    <div class="col-xs-12">
                                        <ul class="font-size-h6 font-color-lighter padding-left-25">
                                            <li>주말·공휴일은 답변이 늦어질 수 있습니다.</li>
                                            <li>파일첨부는 최대 4개까지 가능합니다.</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div role="tabpanel" class="kmongKBTab tab-pane kmong-KB-menu-margin-adjust" id="kmongNotifications">
                                <ul class="list-group">
                                    
                                </ul>

                                <div id="kmongNotificationLoadingDiv" class="row margin-left-0 margin-right-0" style="display: none;">
                                    <div class="col-xs-12 padding-all-20 text-center margin-top-50">
                                        <div class="la-ball-fall color-black"><div></div><div></div><div></div></div>
                                        <h5>불러오는 중</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>

            
            <div class="item bg-color-fa kmong-KB-menu kmong-KB-menu-margin-adjust" data-index="1" style="height: 794px;">
                <div id="kmongNotificationDetailBody" class="row margin-left-0 margin-right-0 overflow-y" style="display: none; height: 699px;">
                    <div class="col-xs-12 padding-left-0 padding-right-0">
                        <ul class="nav kmong-KB-nav" role="tablist">
                            <li role="presentation" class="col-xs-12 cursor font-color-lighter padding-top-30 padding-bottom-30" onclick="$('#kmongKnowledgeBaseCarousel').carousel(0);">
                                <span class="padding-left-15">
                                    <i class="fa fa-arrow-left" aria-hidden="true"></i>
                                    안내 목록 보기
                                </span>
                            </li>
                        </ul>
                    </div>
                    <div class="col-xs-12 padding-left-20 padding-right-20 padding-bottom-20">
                        <h5 class="font-color-lighter"></h5>
                        

                        

                        
                    </div>
                </div>

                <div id="kmongNotificationDetailFooter" class="row margin-left-0 margin-right-0 bg-color-black padding-top-15 padding-bottom-15 kmong-KB-footer">
                    <div class="col-xs-6 padding-right-0 padding-left-20 text-left">
                        <a id="kmongNotificationPrevBtn" class="plain-color-white" href="javascript:void(0)"> 이전</a>
                    </div>
                    <div class="col-xs-6 padding-left-0  padding-right-20 text-right">
                        <a id="kmongNotificationNextBtn" class="plain-color-white" href="javascript:void(0)">다음 </a>
                    </div>
                </div>


                <div id="kmongNotificationDetailLoadingBody" class="row margin-left-0 margin-right-0 overflow-y" style="height: 754px;">
                    <div class="col-xs-12 padding-all-20 text-center margin-top-50">
                        <div class="la-ball-fall color-black"><div></div><div></div><div></div></div>
                        <h5>불러오는 중</h5>
                    </div>
                </div>
            </div>

            <div class="item bg-color-fa overflow-y kmong-KB-menu kmong-KB-menu-margin-adjust" data-index="2" style="height: 794px;">
                <div class="row margin-left-0 margin-right-0">
                    <div class="col-xs-11 padding-left-15 padding-right-0">
                        <ul class="nav kmong-KB-nav" role="tablist">
                            <li role="presentation" class="col-xs-12 cursor padding-top-20 padding-bottom-20" onclick="$('#kmongKnowledgeBaseCarousel').carousel(0);">
                                <i class="fa fa-arrow-left color-gray-d1" aria-hidden="true"></i>&nbsp;
                                <span class="font-color-lighter">                                                                    </span>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="row margin-left-0 margin-right-0">
                    <div class="col-xs-12 padding-left-15 padding-right-15">
                        <div class="font-size-20 NGB margin-bottom-15 kmong-kb-images-size">                                                    </div>
                        <div class="knowledgeBaseDetailContent font-size-h5 text-justify style-style padding-bottom-40"></div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function clickKBCategoryHeader(index){
        $('#kbCategoryBody').animate({scrollTop: 49 + 30 + 40 + 30 + 30 + (index * 57)});
    }
</script>

<style>
    .knowledgeBaseDetailContent p {
        margin-bottom:0;
    }

    .knowledgeBaseDetailContent > img {
        width: 100%;
    }

    .twitter-typeahead {
        width: 100%;
    }
    .tt-menu {
        width: 100%;
        border-top: 2px solid #ffd400;
        text-align: left;
        position: relative;
        z-index: 2;
    }
    .tt-cursor:hover,
    .tt-cursor:focus,
    .tt-cursor{
        color: #F49165 !important;
        cursor: pointer;
    }
    .kmong-kb-search{
        color: #666;
    }
    .kmong-kb-search:focus,
    .kmong-kb-search:hover{
        color: #F49165;
    }

    .kmong-kb-search span{
        color: #888;
    }
    .kmong-kb-search:focus span,
    .kmong-kb-search:hover span{
        color: #444 !important;
    }
</style>
<!-- Include AlgoliaSearch JS Client and autocomplete.js library -->
<script src="https://cdn.jsdelivr.net/algoliasearch/3/algoliasearch.min.js"></script>
<script src="https://cdn.jsdelivr.net/typeahead.js/0.11.1/typeahead.jquery.min.js"></script>
<script src="/js/dropzone.js"></script>


<script>
    function openToggleFindPassword() {
        var $subFindPasswordDiv = $('#subFindPasswordDiv');
        if($subFindPasswordDiv.length > 0) {
            if($subFindPasswordDiv.is(':visible')) {
                $subFindPasswordDiv.fadeOut();
            } else {
                $subFindPasswordDiv.fadeIn();
            }
        } else {
            var content = '';
            if(master_vue.knowledge_bases.length > 0) {
                for(var i in master_vue.knowledge_bases) {
                    var knowledgeBase = master_vue.knowledge_bases[i];
                    if(typeof knowledgeBase !== 'undefined' && typeof knowledgeBase.kb !== 'undefined') {
                        if(knowledgeBase.kb.length > 0) {
                            for(var j in knowledgeBase.kb) {
                                if(knowledgeBase.kb[j].id == 116) {
                                    content = knowledgeBase.kb[j].content;
                                    break;
                                }
                            }
                        }
                    }

                }
            }

            $('#findPasswordToggleLink').parent().append('<div id="subFindPasswordDiv" class="padding-left-30 margin-top-10">' + content + '</div>')
        }
    }
</script>                        </div>
                    </div>
                </div>
            </div>
            <div id="quickMenuTop">
                <a href="javascript:void(0);" class="plain font-size-h6 font-color-light sendGAEventClz" data-name="퀵 메뉴 - TOP">
                <span>TOP</span>
                    <img class="width-10px position-relative" style="top: -1px" src="/img/quick_menu/ic_quick_top.png">
                </a>
            </div>
        </div>
    </div>







    </div>

    

    <div id="ad_request">
        <div class="container ad-request-bg">
            <div class="row">
                <div class="col-xs-12">
                    <ul class="adNaviList list-inline padding-bottom-0 margin-bottom-0">
                        <li class="margin-right-10">
                            <a class="ad-request-nav naviHeader ad-request-active" data-target="position">노출위치</a>
                        </li>

                        <li class="margin-right-10">
                            <a class="ad-request-nav naviHeader" data-target="price">상품가격</a>
                        </li>

                        <li class="margin-right-10">
                            <a class="ad-request-nav naviHeader" data-target="effect">광고효과</a>
                        </li>

                        <li class="margin-right-10">
                            <a class="ad-request-nav naviHeader" data-target="howto">구매방법</a>
                        </li>

                        <li class="pull-right margin-top-5">
                            <a class="btn btn-primary btn-xss btn-block" href="https://kmong.com/seller/order_advertisement_gig">
                                <i class="fa fa-check">&nbsp;</i>광고신청
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="ad-request-trick-yellow overflow-hidden">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 position-relative">
                        <div class="ad-request-main">
                             <img src="https://kmong.com/img/ad_request/ad_top_right2.png?1.1" title="플러스광고">
                            <div class="bg-color-gray ad-request-trick-gray"></div>
                        </div>

                    </div>
                </div>
                <h1 class="margin-top-100">
                    전문가님, <br>
                    <b>광고</b>를 통한 <b>수익 증가</b>를<br>
                    경험해보세요!
                </h1>
                <h3 class="text-style margin-top-80">
                    <span class="font-size-h2"><b>ㅡ</b></span><br>
                    대한민국 N0.1 서비스 마켓플레이스 크몽 <br>
                    마켓 점유율 1위! 전문가 만족도 1위

                </h3>
            </div>
        </div>
        <div class="container position-relative" id="position" style="top: -45px;">
            <div class="row text-center">
                <h1 class="font-size-40">01</h1>
                <h2 class="NGB margin-top-0">광고는 어디에 노출되나요 ?</h2>
                <h3>광고 상품 구매 시 4가지 위치 모두에 동시노출 됩니다.</h3>
            </div>
            <div class="row margin-top-50 text-center">
                <div class="col-xs-6">
                    <img class="ad-request-step" src="/img/ad_request/ad_step_01.png?1.1" title="메인페이지">
                    <h3 class="NGB margin-top-30">01. 메인페이지</h3>
                    <h4 class="text-style">로그인 이 후 메인 페이지 중앙에 위치하는 광고로써, 주목도가 가장 높습니다.</h4>
                </div>
                <div class="col-xs-6">
                    <img class="ad-request-step" src="/img/ad_request/ad_step_02.png?1.1" title="카테고리 리스트">
                    <h5 class="NGB color-danger margin-top-30">(100% 노출 보장)</h5>
                    <h3 class="NGB margin-top-0">02. 카테고리 리스트</h3>
                    <h4 class="text-style">카테고리 리스트 상단에 위치하는 광고로써,<br>해당 카테고리를 선택한 타겟 의뢰인들에게 <br> 가장 먼저 소개될 수 있습니다.</h4>
                </div>
            </div>
            <div class="row margin-top-50 text-center">
                <div class="col-xs-6">
                    <img class="ad-request-step" src="/img/ad_request/ad_step_03.png?1.1" title="키워드 검색 리스트">
                    <h5 class="NGB color-danger margin-top-30">(100% 노출 보장)</h5>
                    <h3 class="NGB margin-top-0">03. 키워드 검색 리스트</h3>
                    <h4 class="text-style">검색 리스트 상단에 위치하는 광고로써, <br> 관련 검색어를 통해 유입된 의뢰인들에게 <br> 가장 먼저 소개 될 수 있습니다.</h4>
                </div>
                <div class="col-xs-6">
                    <img class="ad-request-step" src="/img/ad_request/ad_step_04.png?1.1" title="키워드 검색 리스트">
                    <h5 class="NGB color-danger margin-top-30">(100% 노출 보장)</h5>
                    <h3 class="NGB margin-top-0">04. 모바일페이지</h3>
                    <h4 class="text-style">모바일 메인 + 카테고리 리스트 + 키워드 검색 리스트 <br> 상단에 노출됩니다.</h4>
                </div>
            </div>
        </div>
        <div>
            <img class="width-100" src="/img/ad_request/ad_cross.png?1.1">
        </div>
        <div class="bg-color-yellow-400">
            <div class="container position-relative ad-title-up" id="price">
                <div class="row">
                    <div class="row text-center">
                        <h1 class="font-size-40">02</h1>
                        <h2 class="NGB margin-top-0">광고 상품에는 어떤 것들이 있나요 ?</h2>
                    </div>
                </div>
                <div class="row margin-top-70 text-center">
                    <div class="col-xs-12 position-relative">
                        <img src="https://kmong.com/img/ad_request/desktop/ad_request_plus_gig.png?1.1" title="일반형">
                        <div class="ad-request-pay text-center">
                            <h2 class="margin-bottom-0 margin-top-30 font-color-lighter">
                                - 플러스광고 1주일기준 -
                            </h2>
                                                            <div class="ad-request-pay-title margin-top-30 color-red">
                                    99,000 원
                                </div>
                                                    </div>
                    </div>
                    <div class="col-xs-12 margin-top-30">
                        <img src="https://kmong.com/img/ad_request/desktop/ad_request_premium_gig_ver2.png?1.1" title="프리미엄형">
                        <div class="ad-request-pay text-center">
                            <h2 class="margin-bottom-0 margin-top-30 font-color-lighter">
                                - 프리미엄광고 1주일기준 -
                            </h2>
                                                            <div class="ad-request-pay-title margin-top-30 color-red">
                                    499,000 원
                                </div>
                                                    </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <img class="width-100" src="/img/ad_request/ad_cross_bottom.png?1.1">
        </div>
        <div class="container position-relative ad-title-up" id="effect">
            <div class="row">
                <div class="row text-center">
                    <h1 class="font-size-40">03</h1>
                    <h2 class="NGB margin-top-0">광고 효과는 좋은가요 ?</h2>
                    <h4 class="text-style">광고 전과 후의 놀라운 수익금 차이, 직접 경험한 전문가님들의 후기를 통해서도 확인할 수 있습니다.</h4>
                </div>
            </div>
            <div class="row margin-top-70 text-center">
                <div class="col-xs-6">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <img src="/img/ad_request/ad_gra_01.jpg?1.1" title="만족도조사">
                        </div>
                    </div>

                </div>
                <div class="col-xs-6">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <img src="/img/ad_request/ad_gra_02.jpg?1.1" title="수익금효과">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row text-center margin-top-40">
                <div class="col-xs-4">
                    <img src="/img/ad_request/ad_pro_sens.png?1.1" title="플러스광고 효과로 인한 수익금">
                    <h5 class="NGB font-color-lighter margin-top-15">쎈쓰박 님 (로고디자이너)</h5>
                    <h4 class="NGB text-style margin-top-20">광고 신청한 뒤로 단골 의뢰인분들도 생기고 <br> 거래량이 확실히 늘었어요.</h4>
                </div>
                <div class="col-xs-4">
                    <img src="/img/ad_request/ad_pro_adfinder.png?1.1" title="플러스광고 효과로 인한 수익금">
                    <h5 class="NGB font-color-lighter margin-top-15">애드파인더 님 (광고효과 상승 전문가)</h5>
                    <h4 class="NGB text-style margin-top-20">고민하다가 광고 신청한건데, <br> 확실히 문의건이랑 거래 건이 늘었네요!.</h4>
                </div>
                <div class="col-xs-4">
                    <img src="/img/ad_request/ad_pro_hand.png?1.1" title="플러스광고 효과로 인한 수익금">
                    <h5 class="NGB font-color-lighter margin-top-15">weeklyccy 님 (핸드메이드 디자이너)</h5>
                    <h4 class="NGB text-style margin-top-20">광고 이후에도 한동안은 <br> 의뢰인분들 소개로 또 다른 거래가 생겨 <br> 수익이 유지가 되는 것 같아요.</h4>
                </div>
            </div>
        </div>
        <div>
            <img class="width-100" src="/img/ad_request/ad_cross.png?1.1">
        </div>
        <div class="bg-color-yellow-400">
            <div class="container position-relative ad-title-up" id="howto">
                <div class="row">
                    <div class="row text-center">
                        <h1 class="font-size-40">04</h1>
                        <h2 class="NGB margin-top-0">광고는 어떻게 구매하나요 ?</h2>
                        <h4 class="text-style">승인이 완료되어 판매 중인 서비스만 있다면, 간단하게 광고를 구매 할 수 있습니다.</h4>
                    </div>
                </div>
                <div class="row margin-top-70 text-center">
                    <div class="col-xs-12">
                        <img src="https://kmong.com/img/ad_request/buy_how.png?1.1" title="광고구매 방법">
                    </div>
                </div>
            </div>
        </div>
        <div class="ad-request-arrow"></div>
        <div class="container">
            <div class="row text-center margin-top-50">
                <div class="col-xs-4"></div>
                <div class="col-xs-4">
                    <a href="https://kmong.com/seller/order_advertisement_gig" class="btn btn-primary btn-block"><span class="font-size-h3">광고 신청 하러 가기</span></a>
                </div>
                <div class="col-xs-4"></div>
            </div>
        </div>
    </div>
    <!-- 하단 -->


    <script>

      var $naviHeader = $('.naviHeader');

        $(document).ready(function(){

            $naviHeader.click(function(){
                $naviHeader.removeClass('ad-request-active');
                $naviHeader.each(function(index,value){
                    if($(value).hasClass('color-base')){
                        $(value).removeClass('color-base').addClass('font-color-lighter');
                    }
                });
                $(this).addClass('ad-request-active').removeClass('font-color-lighter').addClass('color-base');
                var target = $(this).data('target');
                $('html, body').animate({scrollTop : $('#'+target)[0].offsetTop - 200}, 500);
            });

          $(window).scroll(function () {
            var windowScroll = $(this).scrollTop()
            var position = $('#position').offset().top-200;
            var price = $('#price').offset().top-230;
            var effect = $('#effect').offset().top-230;
            var howto = $('#howto').offset().top-230;

            if(windowScroll > position && windowScroll < price) {
              $naviHeader.removeClass('ad-request-active').eq(0).addClass('ad-request-active');
            } else if(windowScroll > price && windowScroll < effect) {
              $naviHeader.removeClass('ad-request-active').eq(1).addClass('ad-request-active');
            } else if(windowScroll > effect && windowScroll < howto) {
              $naviHeader.removeClass('ad-request-active').eq(2).addClass('ad-request-active');
            } else if(windowScroll > howto) {
              $naviHeader.removeClass('ad-request-active').eq(3).addClass('ad-request-active');
            }
          })
        })
    </script>
</div>


</body>
</html>