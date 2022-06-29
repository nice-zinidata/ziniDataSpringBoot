<%--
    PageName    :
    FileName    : index_m.jsp
    Description : 나이스비즈맵 인터넷 환경 모바일 메인페이지
    Author      : 
    Make DT     :
    Modify DT   :
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ include file = "/loginCheck.jsp"%>--%>
<%
    response.setHeader("cache-control","no-cache"); //-- HTTP 1.1
    response.setHeader("expires","-1");             //-- HTTP 1.0
    response.setHeader("pragma","no-cache");

    request.setCharacterEncoding("euc-kr");

    String http = request.getScheme();
    StringBuffer url = request.getRequestURL();
    String parameter = request.getQueryString();
%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="euc-kr" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>NICEbizmap 상권분석서비스</title>
    <!-- Favicon -->
    <link href="/bizmap/assets/bizmap/images/favicon.png" rel="icon" type="image/png" />

    <!-- css 모음 -->
    <%@ include file="/WEB-INF/views/bizmap/include/head.jsp" %>

	<script>
	</script>
    <style>
        html, body {position: relative;}
    </style>
</head>

<body>
<!--skipNavi-->
<dl id="skipNavi">
    <dt><strong>바로가기 메뉴</strong></dt>
    <dd><a href="#contents">본문으로 바로가기</a></dd>
</dl>

<div id="main">
    <div id="nav_box">
        <div>
            <div id="logo_box">
                <img src="/bizmap/assets/bizmap/images/logo.svg" alt="나이스비즈맵" height="100%" width="auto">
            </div>
        </div>
    </div>
    <div id="contents">

        <h1>file upload</h1>
        <form name="fileUploadForm" id="fileUploadForm" method="post" action="/bizmap/common/file/upload" enctype="multipart/form-data">
            <input type="file" name="uploadFile" multiple="multiple">
        </form>

        <button class="btn" id="fileUpload" onclick="fileUpload();" title="파일 업로드">파일업로드</button>
        <a href="javascript:;" id="fileDownLoad" onclick="fileDownLoad();">파일 다운로드</a>

        <div class="top">
            <div class="inner">
                <div class="msg slide-top">
                    <h1>우리동네 상권을<br/>한눈에</h1>
                    <p>나이스비즈맵을 통해 우리동네 상권을 한눈에 알아보세요.</p>
                </div>
            </div>
        </div>
        <div id="s3" class="section">
            <div class="inner2">
                <div class="msg_s">
                    <p class="tag">My Report</p>
                    <h2>나만의 상권보고서</h2>
                    <p class="sub">원하시는 업종과 지역의 상권보고서<br>를 매월 받아보세요.</p>
                    <div class="btn_box">
<%--                        <a class="btn" tabindex="0" id="subscribe_1" onclick="subscribeWin(this.id);" onkeydown="enterCheck(event, this.id);" title="보고서 생성">보고서 생성</a>--%>
                        <a class="btn" tabindex="0" id="subscribe_1" onclick="fn_analysisFree();" title="보고서 생성">보고서 생성</a>
                    </div>
                </div>
                <div class="img_grp">
                    <div class="img_grp_wrap">
                        <div class="surf_deco">
                            <img class="bling1" src="/bizmap/assets/bizmap/images/s3_back_bling1.svg" alt="데코레이션">
                            <img class="bling2" src="/bizmap/assets/bizmap/images/s3_back_bling2.svg" alt="데코레이션">
                            <img class="card" src="/bizmap/assets/bizmap/images/s3_back_card.svg" alt="데코레이션">
                            <img class="chart" src="/bizmap/assets/bizmap/images/s3_back_chart.svg" alt="데코레이션">
                            <img class="check" src="/bizmap/assets/bizmap/images/s3_back_check.svg" alt="데코레이션">
                        </div>
                        <div class="phone_inner">
                            <div class="phone_inner_wrap">
                                <img src="/bizmap/assets/bizmap/images/slider.svg" alt="기본보고서 요약본 예시">
                            </div>
                        </div>
                        <div class="phone_box">
                        </div>
                        <!--<div class="phone_shadow"></div>-->
                        <div class="bg_small">
                            <img src="/bizmap/assets/bizmap/images/s3_back_circle1.svg" alt="데코레이션">
                        </div>
                        <div class="bg_small2">
                            <img src="/bizmap/assets/bizmap/images/s3_back_circle2.svg" alt="데코레이션">
                        </div>
                        <div class="bg_img">
                            <img src="/bizmap/assets/bizmap/images/s3_back_big.svg" alt="데코레이션">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer">
    <div class="inner">
        <div class="d-flex justify-content-around">
            <div class="left">
                <ul class="link">
                    <li><a tabindex="0" id="service_promise_1" title="서비스약관 팝업 열림">서비스약관</a></li>
                    <li><a tabindex="0" id="personal_privacy_1" title="개인정보처리방침 팝업 열림">개인정보처리방침</a></li>
                </ul>
                <ul class="info">
                    <li>NICE지니데이타(주)</li>
                    <li>대표 정선동</li>
                    <li class="br">사업자번호 216-81-16917</li>
                    <li>통신판매업번호 제2015-서울영등포-1289호</li>
                    <li>서울특별시 영등포구 은행로 30, 중소기업회관 신관 7층<li>
                    <li>대표번호 02-3215-2828</li>
                    <li class="br">Copyright (c) NICE ZiniData Co., Ltd. All rights reserved.</li>
                </ul>
            </div>
        </div>
    </div>
</div>

<!-- //dialog -->
</body>


</html>

<!-- js 모읍 -->
<%@ include file="/WEB-INF/views/bizmap/include/script.jsp" %>

<script type="text/javascript">
    var couponWin = null, prepareWin = null;
    var subscribe = null;
    var scrollY;

    var strUserId = "";

    var strUrl = '<%= url%>';
    console.log(strUrl);
    var domainUrl = strUrl.substring(0,strUrl.indexOf('WEB-INF'));


    $(function() {

        if(strUserId == "" || strUserId == null || strUserId=='null'  || strUserId=='unknown' ){
            $("#login_iframe_1").show();
            $("#member_reg1_1").show();
            $("#logOut").hide();
        }else{
            $("#login_iframe_1").hide();
            $("#member_reg1_1").hide();
            $("#logOut").show();
        }

        init();

        // $("#fileDownLoad").on('click', function(){
        //     fileDownLoad();
        // });
    });


    function init(){
        cookiedata = document.cookie;
        if (cookiedata.indexOf('event=done') < 0) { // 이벤트 쿠키가 없는 경우
            $('#main_eventpopup').show();
        }
    }

    $(window).scroll(function(){   //스크롤 Y 값
        scrollY = $(window).scrollTop();
    });

	$(function(){
		//Keep track of last scroll
		var lastScroll = 0;
		$(window).scroll(function(event){
			//Sets the current scroll position
			var st = $(this).scrollTop();

            //Determines up-or-down scrolling
            if (st > lastScroll){
                //Replace this with your function call for downward-scrolling
                $('#nav_box').slideUp(300);
            }
            else {
                //Replace this with your function call for upward-scrolling
                $('#nav_box').slideDown(300);
                $('#nav_box').css('background','white');
                $('#nav_box').css('border-bottom','1px solid #f4f4f4');
                $('#nav_box').css('position','fixed');
            }
            if(st == 0){
                //Replace header on top
                $('#nav_box').css('background','none');
                $('#nav_box').css('border','none');
                $('#nav_box').css('position','relative');
            }
            //Updates scroll position
            lastScroll = st;
        });
    });

    // 기본보고서 페이지로 이동
    function fn_analysisFree(){
        window.location="/bizmap/analysis/analysisFree";
    }

</script>
