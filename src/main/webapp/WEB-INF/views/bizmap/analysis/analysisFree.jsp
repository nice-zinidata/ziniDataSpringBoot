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
<!doctype html>
<html lang="ko">
<head>
    <meta charset="euc-kr" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>NICEbizmap 상권분석서비스</title>

    <!-- css 모음 -->
    <%@ include file="/WEB-INF/views/bizmap/include/head.jsp" %>

</head>

<body>
    <div class="map" id="map" style="width:100%;height:100%;"></div>
    <div class="pop_up module">
        <div class="pop_header">
            <div class="inner in1">
                <div class="button_box">
                    <button class="before"></button>
                </div>
                <p class="pop_tag">지역선택</p>
            </div>
            <!--inner in1-->
            <div class="inner in2" style="display:none">
                <div class="button_box">
                    <button class="before"></button>
                </div>
                <p class="pop_tag">업종선택</p>
            </div>
            <!--inner in2-->
        </div>
        <!--pop_header-->
        <div class="pop_body">
            <div class="body_inner in1">
                <div class="label_box label1">
                    <p class="label_tag" style="display: none;"><span>어떤 지역</span>의<br />
                        상권분석을 원하시나요?</p>
                    <div class="label_inner">
                        <div class="place_holder">지역을 선택해 주세요</div>
                        <div class="chosen">서울시 영등포구 여의동</div>
                    </div>
                    <div class="wheel">
                        <div class="table_label">
                            <div class="lb1">시/도</div>
                            <div class="lb2">시/구/군</div>
                            <div class="lb3">동/읍/면</div>
                        </div>
                        <!--table_label-->
                        <div class="table_box">
                            <dl class="list1"  id="_mega">
                                <dd></dd>
                            </dl><!-- list3 -->
                            <dl class="list2" id="_cty">
                                <dd></dd>
                            </dl><!-- list2 -->
                            <dl class="list3" id="_admi">
                                <dd></dd>
                            </dl><!-- list3 -->
                        </div>
                    </div>
                    <!--wheel-->
                </div>
                <!--label_box label1-->
            </div>
            <!--body_inner in1-->
            <div class="body_inner in2" style="display: none;">
                <div class="label_box label2">
                    <p class="label_tag" style="display: none;">서울시 영등포구 여의동의 <br /><span>어떤 업종</span>을
                        분석하고 싶으신가요?</p>
                    <div class="label_inner">
                        <div class="place_holder">업종을 선택해 주세요</div>
                        <div class="chosen">호프/맥주</div>
                    </div>
                    <div class="cate1" id="_upjong1">
                    </div>

                    <div class="wheel2" id="_upjong2">
                    </div>
                    <!-- wheel2 -->
                </div><!-- label_box label2 -->
            </div>
            <div class="bottom_btn_box">
                <div class="state"><span>여의동 호프/맥주 </span>분석하기</div>
                <div class="reset">초기화</div>
                <div class="confirm">확인</div>
            </div>
        </div>
        <!--pop_body-->
    </div>
    <!--pop_up-->

    <div class="float-float">
        <a href="" id="reSearch" onclick="">현 지도에서 상권 분석</a>
    </div>
    <!--float-top end-->
    <!--top start-->
    <div class="top_section" style="position: fixed;top: 0px;width: 100%;">
        <div class="menu_top">
            <div class="menu_left">
                <div class="logo_box"></div>
            </div>
            <div class="menu_right">
                <div class="comm_box">
                    <div id="menuToggle">
                        <input type="checkbox" />
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab_box">
            <ul>
                <li class="on"><a href="#">기본보고서</a></li>
                <li><a href="#">유동인구</a></li>
                <li><a href="#">밀집도</a></li>
            </ul>
        </div>
        <div class="float-top">
            <div class="search" style="font-size: 14px">
                <a href="#">지역/업종 검색하여 상권 분석하기</a>
            </div>
        </div>
    </div>
    <!--top end-->


    <!-- //dialog -->
</body>


</html>

<!-- js 모읍 -->
<%@ include file="/WEB-INF/views/bizmap/include/script.jsp" %>



<script type="text/javascript">
    // html 변경이 있을떄 다시 잃기
    $('body').bind('DOMSubtreeModified', function(){
        //높이 - 지역분석시 테이블
        var height = $(window).height();
        $('.table_box').css('height', height - 261);
    });

    var megaCd;
    var ctyCd;
    var admiCd;

    var megaNm;
    var ctyNm;
    var admiNm;

    var upjong3Cd;
    var final = false;

    $(function() {

        //검색창 클릭하여 카테고리 열기
        $('.search').click(function () {
            $('.pop_up').css('display', 'block');
            $('.map').css('display', 'none');

            console.log(strUpjongCd);

            if(strAdmiCd == "" || strUpjongCd != ""){
                $('.reset').click();
            }else if(strUpjongCd == ""){
                $('.confirm').removeClass('on');
                $('.body1').css('display', 'none');
                $('.in2').css('display', 'flex');
                $('.in1').css('display', 'none');
                var data = {
                    gubun : "upjong1"
                };
                getUpjong(data);
            }
        });

        //뒤로가기 클릭하여 홈화면으로 이동
        $('.inner.in1').find('.before').click(function () {
            $('.pop_up.module').css('display', 'none');
            $('.map').css('display', '');
        });

        //뒤로가기 클릭 초기화 기능
        $('.inner.in2').find('.before').click(function () {
            $('.reset').click();
        });

        // 하단 버튼 기능()
        $('.confirm').click(function () {
            if(!final){
                $('.confirm').removeClass('on');
                $('.body1').css('display', 'none');
                $('.in2').css('display', 'flex');
                $('.in1').css('display', 'none');
                var data = {
                    gubun : "upjong1"
                };
                getUpjong(data);
            }else{
                $('.search').text(strAreaNm);
                $('.map').css('display', '');
                $('.confirm').removeClass('on');
                $('.pop_up.module').css('display', 'none');
                getAdmiFeatures();
            }
        });

        $('.reset').click(function (){
            strAdmiCd = "";
            strUpjongCd = "";
            strAreaNm = "";
            $('#_cty').hide();
            $('#_admi').hide();
            $('#_upjong2').hide();

            $('.in2').hide();
            $('.in1').show();
            $('.label1 .place_holder').css('display', '');
            $('.label1 .chosen').css('display', 'none');
            $('.label2 .place_holder').css('display', '');
            $('.label2 .chosen').css('display', 'none');

            $('.confirm').removeClass('on');
            $('.list2').removeClass('on');
            $('.cate2').removeClass('on');
            getArea($(this).data(), '');
            var data = {
                gubun : "upjong1"
            };
            getUpjong(data);
        });

    });

    function getArea(data, gubun){
        var param = {};
        param.gubun = gubun
        param.megaCd = data.megacd;
        if(gubun == "cty"){
            param.megaCd = data.megacd;
            param.ctyCd = data.ctycd;
        }

        getAjax("features", "/common/admin/getArea", param, fn_succ_getArea, fn_error);
    }

    function fn_succ_getArea(id, response, param){
        final = false;

        var template = $('#tmp_area').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);

        if(param.gubun == ""){
            $('#_mega').html(html);
            $('.table_box .list1 dd').click(function () {
                $('.table_box .list1 dd').removeClass('on');
                $(this).toggleClass('on');
                $('.list2').removeClass('on');
                $(this).parent().next('.list2').toggleClass('on');
                $(this).parent('.list1').addClass('fixed');
                megaCd = $(this).data().cd;
                megaNm = $(this).text();
            });

        }else if(param.gubun == "mega"){
            $('#_cty').html(html);
            $('.label1 .table_box .list2').show();
            $('.label1 .table_box .list3').hide();

            $('.table_box .list2 dd').click(function () {
                $('.list3').removeClass('on');
                $(this).parent().next('.list3').toggleClass('on');
                $('.table_box .list2 dd').removeClass('on');
                $(this).toggleClass('on');
                ctyCd = $(this).data().cd;
                ctyNm = $(this).text();
            });
        }else if(param.gubun == "cty"){
            $('#_admi').html(html);
            $('.label1 .table_box .list3').show();

            $('.label1 .table_box .list3 dd').click(function () {
                $('.label1 .table_box .list3 dd').removeClass('on');
                $(this).toggleClass('on');
                $('.label1 .table_label').toggleClass('on');
                $('.label1 .table_box').toggleClass('on');
                $('.label1 .chosen').css('display', 'block');
                $('.label1 .place_holder').css('display', 'none');
                $('.confirm').addClass('on');
                admiCd = $(this).data().cd;
                admiNm = $(this).text();

                strAdmiCd = $(this).data().cd;
                $('.label1 .chosen').text(megaNm +" "+ ctyNm +" "+ admiNm);
                strAreaNm = megaNm +" "+ ctyNm +" "+ admiNm;
            });
        }
    }

    function menuClick(listThis){
        if(!common.isEmpty(listThis.data().megacd) && common.isEmpty(listThis.data().ctycd) && common.isEmpty(listThis.data().admicd)) {
            getArea(listThis.data(), 'mega');
        }else if(!common.isEmpty(listThis.data().megacd) && !common.isEmpty(listThis.data().ctycd) && common.isEmpty(listThis.data().admicd)){
            getArea(listThis.data(), 'cty');
        }
    }

    function getUpjong(data){

        data.megaCd = megaCd;
        data.ctyCd = ctyCd;
        data.admiCd = admiCd;

        if(data.gubun == "upjong1"){
            getAjax("features", "/common/admin/getUpjong", data, fn_getUpjong1, fn_error);
        }else if(data.gubun == "upjong2"){
            getAjax("features", "/common/admin/getUpjong", data, fn_getUpjong2, fn_error);
        }
    }

    function fn_getUpjong1(id, response, param){
        final = false;
        var template = $('#tmp_upjong1').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);
        $('#_upjong1').html(html);

        //업종 선택1
        $('.cate1 > ul > li > a').click(function(){
            $('.confirm').removeClass('on');
            $('.cate1 > ul >li').removeClass('on');
            $(this).parent('li').toggleClass('on');
            //클릭한 a의 css 변화

            $('.cate2').toggleClass('on');
            var data = {
                gubun : "upjong2"
                , upjong1Cd : $(this).data().upjong1cd
            };
            getUpjong(data);
        });
    }

    function fn_getUpjong2(id, response, param){
        final = false;
        var template = $('#tmp_upjong2').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);
        $('#_upjong2').html(html);

        $('#_upjong2').show();
        $('.cate2').addClass('on');
        //업종 선택 2
        $('.cate2 > ul > li > p > a').click(function(){
            $('.cate2 > ul >li').not($(this).parents('li')).removeClass('on');
            $(this).parents('li').toggleClass('on');
            //클릭한 a의 css 변화
            $('.cate3').not($(this).parents('li').find('.cate3')).removeClass('on');
            $(this).parents('li').find('.cate3').toggleClass('on');

        });
        // 업종 선택 3
        $('.cate3 > li > a').click(function(){
            $('.cate3 > li > a').removeClass("on");
            upjong3Cd = $(this).data().upjong3cd;
            strUpjongCd = $(this).data().upjong3cd;
            strUpjongNm = $(this).text();

            strAreaNm = strAreaNm + " " + strUpjongNm;

            $('.label2 .place_holder').css('display', 'none');
            $('.label2 .chosen').show();
            $('.label2 .chosen').text($(this).text());

            $(this).addClass('on');
            $('.confirm').addClass('on');

            final = true;
        });
    }

    function getAdmiFeatures(){
        if(confirm("보고서를 생성하시겠습니까?")){
            var data={
                admiCd : strAdmiCd
                , upjongCd : strUpjongCd
            }
            getAjax("features", "/bizmap/analysis/admiFeatures", data, fn_succ_features, fn_error);
        }
    }
</script>

<script type="text/x-handlebars-template" id="tmp_area">
    {{#each data}}
        <dd data-cd="{{cd}}" data-megaCd="{{megaCd}}" data-ctyCd="{{ctyCd}}" data-admiCd="{{admiCd}}" onclick="menuClick($(this));">{{nm}}</dd>
    {{/each}}
</script>

<script type="text/x-handlebars-template" id="tmp_upjong1">
    <ul>
        {{#each data.upjong1}}
        <li><a href="#li_{{upjong1Cd}}" data-upjong1Cd="{{upjong1Cd}}">{{upjong1Nm}}</a></li>
        {{/each}}
    </ul>
</script>

<script type="text/x-handlebars_template" id="tmp_upjong2">
    <div class="cate2">
        <ul>
            {{#each data.upjong2}}
            <li>
                <p><a href="#li_{{upjong1Cd}}" data-upjong2Cd="{{upjong2Cd}}">{{upjong2Nm}}</a></p>
                <ul class="cate3">
                    {{#each ../data.upjong3}}
                        {{#ifCond ../upjong2Cd '==' upjong2Cd}}
                        <li><a href="#" data-upjong3Cd="{{upjong3Cd}}">{{upjong3Nm}}</a></li>
                        {{/ifCond}}
                    {{/each}}
                </ul>
            </li>
            {{/each}}
        </ul>
    </div>
</script>
