<%--
    PageName    :
    FileName    : analysisFree.jsp
    Description : 나이스비즈맵 인터넷 환경 기본보고서
    Author      :
    Make DT     :
    Modify DT   :
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    response.setHeader("cache-control","no-cache"); //-- HTTP 1.1
    response.setHeader("expires","-1");             //-- HTTP 1.0
    response.setHeader("pragma","no-cache");

    request.setCharacterEncoding("euc-kr");

    String STR_USER_ID = "unknown";
    String STR_USER_NO = "999999999";
%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover">
        <!-- css 모음 -->
        <%@ include file="/WEB-INF/views/bizmap/include/head.jsp" %>

        <!-- echart -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/echarts@5.3.2/dist/echarts.min.js"></script>

        <!-- analysis 에서만 -->
        <%@ include file="/WEB-INF/views/bizmap/include/script.jsp" %>
        <script type="text/javascript" src="/bizmap/assets/bizmap/js/analysisFree.js?<%=version%>"></script>

        <title>기본보고서</title>
    </head>

    <body>

        <!-- 로딩 SVG 모달없이 흰 배경일때 -->
        <div class="loader loader-style1" title="0" style="display: none;">
            <svg version="1.1" id="loader-1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 40 40" enable-background="new 0 0 40 40" xml:space="preserve">
                    <path opacity="0.4" fill="#1F67FD" d="M20.201,5.169c-8.254,0-14.946,6.692-14.946,14.946c0,8.255,6.692,14.946,14.946,14.946
                        s14.946-6.691,14.946-14.946C35.146,11.861,28.455,5.169,20.201,5.169z M20.201,31.749c-6.425,0-11.634-5.208-11.634-11.634
                        c0-6.425,5.209-11.634,11.634-11.634c6.425,0,11.633,5.209,11.633,11.634C31.834,26.541,26.626,31.749,20.201,31.749z" />
                <path fill="#1F67FD" d="M26.013,10.047l1.654-2.866c-2.198-1.272-4.743-2.012-7.466-2.012h0v3.312h0 C22.32,8.481,24.301,9.057,26.013,10.047z">
                    <animateTransform attributeType="xml" attributeName="transform" type="rotate" from="0 20 20" to="360 20 20"dur="0.8s" repeatCount="indefinite" />
                </path>
                </svg>
        </div>
        <!-- 로딩 SVG 모달없이 흰 배경일때 -->

        <!-- 로딩 SVG 모달과 함께 -->
        <div class="loader loader--style3" title="2" style="display: none;">
            <svg version="1.1" id="loader-1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 50 50" style="enable-background:new 0 0 50 50;" xml:space="preserve">
                    <path fill="#1F67FD" d="M43.935,25.145c0-10.318-8.364-18.683-18.683-18.683c-10.318,0-18.683,8.365-18.683,18.683h4.068c0-8.071,6.543-14.615,14.615-14.615c8.072,0,14.615,6.543,14.615,14.615H43.935z">
                        <animateTransform attributeType="xml" attributeName="transform" type="rotate" from="0 25 25" to="360 25 25" dur="0.8s" repeatCount="indefinite">
                        </animateTransform>
                    </path>
                </svg>
        </div>
        <!-- 로딩 SVG 모달과 함께 -->

        <!--사이드바 모달 modal START-->
        <div class="modal modal1"></div>
        <!--modal END-->
        <!--bottom popup시 모달 modal START-->
        <div class="modal modal2"></div>
        <!--modal END-->

        <div class="snb_box">
            <div class="snb_header cb">
                <div id="menuToggle2">
                    <a href="#"></a>
                </div>
            </div>
            <ul class="snb_ul snb1">
                <li><a href="#">나이스비즈맵</a></li>
                <li><a href="/analysis/analysisFree">상권분석</a></li>
                <li><a href="#">상세보고서</a></li>
                <li><a href="/bizmap/subscribe">구독서비스</a></li>
                <li><a href="/bizmap/support">고객지원</a></li>
            </ul>
            <ul class="snb_ul snb2">
                <li>
                    <p>퀵링크</p>
                    <ul>
                        <li><a href="http://nicezinidata.com">나이스지니데이타</a></li>
                        <li><a href="http://www.nicebizmap.co.kr">슬기로운외식사업 (교육과정)</a></li>
                        <li><a href="https://www.posplatform.co.kr">POS 데이터 플랫폼</a></li>
                    </ul>
                </li>
            </ul>
        </div>

        <!--top_section START-->
        <div class="top_section">
            <div class="menu_top pd">
                <div class="menu_left">
                    <div class="logo_box">
                        <a href="/bizmap/index"></a>
                    </div>
                </div>
                <div class="menu_right">
                    <div id="menuToggle">
                        <a href="#"></a>
                    </div>
                </div>
            </div>
            <div class="tab_box">
                <ul class="pd">
                    <li class="on"><a href="javascript:;">기본보고서</a></li>
<%--                    <li class="onlypc" style="display: none"><a href="index1.html">상세보고서</a></li>--%>
                    <li class="" style="display: none"><a href="index1.html">상세보고서</a></li>
                    <li><a href="javascript:;">유동인구</a></li>
                    <li><a href="javascript:;">밀집도</a></li>
                    <li><a href="javascript:;">뜨는업종</a></li>
                    <li style="margin-bottom:80px;"><a href="javascript:;">영상콘텐츠</a></li>
                    <li class="onlypc last_one">
                        <div class="toggle_login onlypc" id="toggle_login">
                            <ul>
                                <li><a href="">로그인<span class="gray">&nbsp;|&nbsp;</span>회원가입</a></li>
                                <li><a href="">고객지원</a></li>
                                <li><a href="">구독서비스</a></li>
                            </ul>
                        </div>
                        <a id="toggle_click" href="#"></a>
                    </li>
                </ul>
            </div>
            <div class="float_top pd">
                <div class="search">
                    <a href="#">
                        <input type="search" id="search" name="q" placeholder="지역/업종 선택하여 상권 분석하기" readonly />
                    </a>
                </div>
            </div>
        </div>
        <!--top_section END-->


        <!--top START-->
        <div class="map_section" id="map"></div>
        <%--<div class="float_loca mobile ">
            영등포구 여의동
        </div>--%>
        <!--top END -->

        <div class="float_loca reserch" onclick="reSearch();" style="top: 84px; display: none; z-index: 99;">
            <a href="javascript:;">현 지도에서 검색</a>
        </div>

        <div id="basicReport">
            <%@ include file="/WEB-INF/views/bizmap/analysis/basicReport.jsp" %>
        </div>
        <div id="flowpop" style="display:none;">
            <%@ include file="/WEB-INF/views/bizmap/analysis/flowpop.jsp" %>
        </div>
        <div id="density" style="display:none;">
            <%@ include file="/WEB-INF/views/bizmap/analysis/density.jsp" %>
        </div>
        <div id="rising" style="display:none;">
            <%@ include file="/WEB-INF/views/bizmap/analysis/rising.jsp" %>
        </div>
        <div id="videoContents" style="display:none;">
            <%@ include file="/WEB-INF/views/bizmap/analysis/videoContents.jsp" %>
        </div>

    </body>
</html>

<script type="text/javascript">
    var megaCd;
    var ctyCd;
    var admiCd;

    var megaNm = "";
    var ctyNm = "";
    var admiNm = "";

    var upjong3Cd;

    $(function() {
        // 검색창 클릭하여 카테고리 열기
       /* $('.search').click(function () {
            // reset();
            $('.sheet_01').show();
            $('.modal').show();
        });*/
        reset();

        var $item = $('.row > li > button').on('click', function() {
            var idx = $item.index(this);
            var val = $(this).val();
            $('.cate2.cb.r1').css('display','none');
            $('.cate2.cb.r2').css('display','none');
            console.log(idx);
            if((idx < 3) || (idx == 6 || idx == 7 || idx == 8)){
                $('.cate2.cb.r1').css('display','block');
                $('.cate2.cb.r1').removeClass().addClass('cate2 cb r1 on'+ (idx+1));
            }else if((idx > 2 && idx < 6) || (idx ==9 || idx == 10 | idx == 11)){
                $('.cate2.cb.r2').css('display','block');
                $('.cate2.cb.r2').removeClass().addClass('cate2 cb r2 on'+ (idx-2));
            }
            $('.loca_crumble_box.onlypc > .loca_crumble > li').removeClass('on');
            $('.loca_crumble_box.onlypc > .loca_crumble > li:nth-child(1)').text($(this).text());
            $('.loca_crumble_box.onlypc > .loca_crumble > li:nth-child(2)').addClass('on');

            var data = {
                upjong1Cd : val
                ,gubun : "upjong2"
            };
            getUpjong(data);
        });


    });

    function areaReset(){
        strGeoJson = "";
        strAdmiCd = "";
        strAreaNm = "";

        megaCd ="";
        ctyCd = "";
        admiCd = "";
        megaNm = "";
        ctyNm = "";
        admiNm = "";

        var data = {};
        getArea(data, '');

        $('.pc_sheet .middle ul li:nth-child(1) > a').text('분석 지역을 선택해주세요');
    }
    function upjongReset(){
        strUpjongCd = "";
        strUpjongNm = "";

        upjong3Cd = "";
        data = {
            gubun : "upjong1"
        };
        getUpjong(data);

        $('.pc_sheet .middle ul li:nth-child(2) > a').text('분석 업종을 선택해주세요');
    }
    function reset(){
        areaReset();
        upjongReset();
    }

    function getArea(data, gubun){
        param = {};
        param.megaCd = data.megacd;
        param.ctyCd = data.ctycd;
        param.gubun = gubun;

        getAjax("features", "/bizmap/common/admin/getArea", param, fn_succ_getArea, fn_error);
    }


    function fn_succ_getArea(id, response, param){

        var template = $('#tmp_area').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);

        $('.loca_list.cb').html(html);

        $('.loca_crumble').find('li').removeClass('on');
        $('.loca_crumble').find('li').each(function (idx){

            if(param.megaCd == undefined && param.ctyCd == undefined && $(this).text() == "시/도"){
                $(this).addClass('on');
            }else if(param.megaCd != undefined && param.ctyCd == "" && $(this).text() == "시/군/구"){
                $(this).addClass('on');
            }else if(param.megaCd != undefined && param.ctyCd != undefined && param.megaCd != "" && param.ctyCd != "" && $(this).text() == "읍/면/동"){
                $(this).addClass('on');
            }
        });
    }

    function aearClick(listThis){
        var bounds = new naver.maps.LatLngBounds(
            new naver.maps.LatLng(listThis.data().miny, listThis.data().minx),
            new naver.maps.LatLng(listThis.data().maxy, listThis.data().maxx));
        map.fitBounds(bounds);

        if(strMenuGugun == 1 || strMenuGugun == 2 || strMenuGugun == 3){
            $(".reserch").css('display','block');
        }

        if(!common.isEmpty(listThis.data().megacd) && common.isEmpty(listThis.data().ctycd) && common.isEmpty(listThis.data().admicd)) {
            megaNm = listThis.text();
            megaCd = listThis.data().megacd;
            getArea(listThis.data(), 'mega');
        }else if(!common.isEmpty(listThis.data().megacd) && !common.isEmpty(listThis.data().ctycd) && common.isEmpty(listThis.data().admicd)){
            ctyNm = listThis.text();
            ctyCd = listThis.data().ctycd;
            getArea(listThis.data(), 'cty');
        }else{
            admiNm = listThis.text();
            admiCd = listThis.data().admicd;
            strAdmiCd = admiCd;
            strAreaNm = megaNm + " " + ctyNm + " " + admiNm;
            // 해상도 체크
            if (widthCheck() =="MO") {
                $('.sheet_01').hide();
                $('.modal1').hide();
                $('.sheet_02').show();
            }else if(widthCheck() =="PC"){
                $('.pc_sheet .middle ul li:nth-child(1)').toggleClass('on');
                $('.sheet_01').toggleClass('on');
            }
        }
        var tmp =  megaNm + " " + ctyNm + " " + admiNm;

        // 모바일 버전 지역 선택 text
        $(".sub_txt").children('.loca').text(tmp);

        //PC버전 지역선택 text
        $('.pc_sheet .middle ul li:nth-child(1) > a').text(tmp);

        $('#search').val(strAreaNm);

        // 해상도 체크
        if (widthCheck() =="MO") {
            var data = {
                gubun: "upjong1"
            };
            getUpjong(data);
        }
    }

    function getUpjong(param){
        param.megaCd = megaCd;
        param.ctyCd = ctyCd;
        param.admiCd = admiCd;

        if(param.gubun == "upjong1"){
            getAjax("features", "/bizmap/common/admin/getUpjong", param, fn_getUpjong1, fn_error);
        }else if(param.gubun == "upjong2"){
            getAjax("features", "/bizmap/common/admin/getUpjong", param, fn_getUpjong2, fn_error);
        }
    }

    function fn_getUpjong1(id, response, param){

        response.data.upjong1.forEach(function (data, idx){
            $(".cate_kind").find(".row").children('li').removeClass("on");
            $(".cate_kind").find(".row").children('li').find('button').each(function (){
                if(data.upjong1Nm == $(this).text()){
                    $(this).val(data.upjong1Cd);
                }
            });
        });
    }

    function fn_getUpjong2(id, response, param){
        var template = $('#tmp_upjong2').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);

        if(param.upjong1Cd == "Q" || param.upjong1Cd == "D" || param.upjong1Cd == "F"){
            $('.cate2.cb.r1').html(html);
        }else{
            $('.cate2.cb.r2').html(html);
        }

        $('.cate2 > ul > li > button').on('click', function() {
            $(".cate2.cb").find("li").removeClass("on");
            $('.cate2 > ul > li > button').find('span').css({"background":"url(/bizmap/assets/bizmap/images/icons/ico_plus_gr.svg) no-repeat 50% 50%/90%"});

            $(this).parent().addClass("on");
            $(this).find('span').css({"background":"url(/bizmap/assets/bizmap/images/icons/ico_check_bl.svg) no-repeat 50% 50%/90%"});
            $('.cate3_top').css('display','none');
            if($('.cate3_top.'+$(this).data().upjong2cd)){
                $('.cate3_top.'+$(this).data().upjong2cd).css('display','block');
            }

            $('.loca_crumble_box.onlypc > .loca_crumble > li').removeClass('on');
            $('.loca_crumble_box.onlypc > .loca_crumble > li:nth-child(2)').text($(this).text());
            $('.loca_crumble_box.onlypc > .loca_crumble > li:nth-child(3)').addClass('on');

        });

        $('.cate3 > li > button').on('click', function() {
            upjong3Cd = $(this).data().upjong3cd;
            strUpjongCd = upjong3Cd;
            strUpjongNm = $(this).text();
            $(".cate3.cb").find("li").removeClass("on");
            $(this).parent().addClass("on");
            $(".sub_txt").find(".kind").text($(this).text());

            $('.loca_crumble_box.onlypc > .loca_crumble > li:nth-child(3)').text($(this).text());

            // 모바일 버전 업종 선택 text
            $(".s_txt").find(".loca").text(strAreaNm);
            $(".s_txt").find(".kind").text($(this).text());

            // PC버전 업종선택 text
            $('.pc_sheet .middle ul li:nth-child(2) > a').text($(this).text());
            // 모바일 버전일때
            if (widthCheck() =="MO") {
                $('.modal1').hide();
                $('.btp2').css('display', 'block');
            }else if(widthCheck() == "PC"){
                $('.pc_sheet .middle ul li:nth-child(2)').toggleClass('on');
                $('.sheet_02').toggleClass('on');
            }
        });
    }

</script>

<script type="text/x-handlebars-template" id="tmp_area">
    {{#each data}}
    <li><a href="#" data-cd="{{cd}}" data-megaCd="{{megaCd}}" data-ctyCd="{{ctyCd}}" data-admiCd="{{admiCd}}" data-maxx={{maxx}} data-minx={{minx}} data-maxy={{maxy}} data-miny={{miny}} onclick="aearClick($(this));">{{nm}}</a></li>
    {{/each}}
</script>

<script type="text/x-handlebars_template" id="tmp_upjong2">
    <ul>
        {{#each data.upjong2}}
        <li>
            <button data-upjong2Cd="{{upjong2Cd}}">
                <span style="display: inline-block;
                        border-radius: 100%;
                        width: 16px;
                        height: 16px;
                        border: 1px solid rgba(190, 201, 218, 0.5);
                        background: url(/bizmap/assets/bizmap/images/icons/ico_plus_gr.svg) no-repeat 50% 50%/90%;
                        margin-bottom: -4px;
                        margin-right: 8px;"
                ></span>
                {{upjong2Nm}}
            </button>
        </li>
        <li style="width: 100%; display: none;" class="cate3_top {{upjong2Cd}}">
            <ul class="cate3 cb">
                {{#each ../data.upjong3}}
                {{#ifCond ../upjong2Cd '==' upjong2Cd}}
                <li><button data-upjong3Cd="{{upjong3Cd}}">{{upjong3Nm}}</button></li>
                {{/ifCond}}
                {{/each}}
            </ul>
        </li>
        {{/each}}
    </ul>
</script>