<%--
    PageName    :
    FileName    : basicReport.jsp
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

%>


<!--only_pc pc_sheet_box PC일때 사이드 START-->
<div class="pc_sheet onlypc on" id="pc_sheet">
    <a class="handle" href="#" id="handle"></a>
    <div style="overflow-y: auto;">
        <div class="pc_hd">
            <div class="tag_txt">
                <p class="sub_txt">
                    <span>현 위치</span>
                </p>
                <div class="map_place_box">
                    <a href="#">
                        <input type="text" id="" name="show" placeholder="여의동" readonly>
                    </a>
                </div>
            </div>
        </div>
        <div class="pc_bdy ticket">
            <div class="tag_txt">
                <p class="sub_txt">
                    <span>분석 지역 | 업종 선택</span>
                </p>
            </div>
            <div class="middle">
                <ul>
                    <li><a href="#">분석 지역을 선택해주세요</a></li>
                    <li><a href="#">분석 업종을 선택해주세요</a></li>
                </ul>
            </div>
            <div class="button_box">
                <button class="btn2" id="pcBasicReset">다시선택</button>
                <button class="btn1" id="pcBasicReport">보고서 보기</button>
            </div>
        </div>
    </div>
</div>
<!--only_pc pc_sheet_box PC일때 사이드 END-->

<!--bottom_pop btp1 pd mobile START-->
<div class="bottom_pop btp1 pd mobile" style="display:none;">
    <div class="pop_head">
        <a href="#"></a>
    </div>
    <div class="pop_body">
        <p class="m_txt">영등포구 여의동 상권 분석</p>
        <p class="s_txt">업종을 추가로 선택하시면<br>
            영등포구 여의동의 상권을 분석할 수 있어요!</p>
    </div>
    <div class="pop_foot">
        <div class="button_box">
            <button class="btn2">취소</button>
            <button class="btn1">업종선택</button>
        </div>
    </div>
</div>
<!--bottom_pop btp1 pd mobile END-->

<!--bottom_pop btp2 pd mobile START-->
<div class="bottom_pop btp2 pd mobile" style="display:none;">
    <div class="pop_body">
        <p class="s_txt">
            <span class="loca">여의동</span>
            <span class="bar">|</span>
            <span class="kind">호프/맥주</span><span>상권 분석</span></p>

    </div>
    <div class="pop_foot">
        <div class="button_box">
            <button class="btn2" id="moBasicReset">재선택</button>
            <button class="btn1" id="moBasicReport">보고서 보기</button>
        </div>
    </div>
</div>
<!--bottom_pop btp2 pd mobile END-->

<!--분석지역-->
<div class="sheet sheet_01 md_sheet">
    <div class="sheet_hd pd">
        <div class="ico_box back">
            <a href="#">
            </a>
        </div>
        <div class="name_box">
            지역 선택
        </div>
        <div class="close_box">
            <a href="">
            </a>
        </div>
    </div>
    <div class="sheet_body pd">
        <div class="box txt_bx">
            <p class="main_txt">분석하고자 하는<br />
                지역을 선택해주세요.</p>
            <p class="sub_txt">
                <span class="loca">지역선택</span>
            </p>
        </div>
        <div class="box select_bx">
            <div class="cate_loca">
                <div class="loca_crumble_box">
                    <ul class="loca_crumble">
                        <li class="on">시/도</li>
                        <li>시/군/구</li>
                        <li>읍/면/동</li>
                    </ul>
                </div>
                <div class="loca_list_bx">
                    <ul class="loca_list cb">
                        <li class="on"><a href="#">서울특별시</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--분석지역-->


<!--업종선택-->
<div class="sheet md_sheet sheet_02 ">
    <div class="sheet_hd pd">
        <div class="ico_box back">
            <a href="#">
            </a>
        </div>
        <div class="name_box">
            업종 선택
        </div>
        <div class="close_box">
            <a href="">
            </a>
        </div>
    </div>
    <div class="loca_crumble_box onlypc">
        <ul class="loca_crumble">
            <li class="on">대분류</li>
            <li>중분류</li>
            <li>소분류</li>
        </ul>
    </div>
    <div class="sheet_body pd">
        <div class="box txt_bx">
            <p class="main_txt">업종을 선택하여
                <br />상권 분석을 시작해 보세요.</p>
            <p class="sub_txt">
                <span class="loca">여의동</span>
                <span class="bar">|</span>
                <span class="kind">업종선택</span>
            </p>
        </div>
        <div class="box select_bx">
            <div class="cate_kind">
                <ul class="row r1">
                    <li><button>음식</button></li>
                    <li><button>소매/유통</button></li>
                    <li><button>생활서비스</button></li>
                </ul>
                <ul class="cate2 cb r1 on1" style="display: none;">
                    <li><button>간이주점</button></li>
                    <li style="width: 100%; display: none;" class="cate3_top">
                        <ul class="cate3 cb">
                            <li class="on"><button>호프/맥주</button></li>
                        </ul>
                    </li>
                    <li><button>닭/오리요리</button></li>
                </ul>
                <ul class="row r2">
                    <li><button>여가/오락</button></li>
                    <li><button>학문/교육</button></li>
                    <li><button>의료/건강</button></li>
                </ul>
                <ul class="cate2 cb r2 on1" style="display: none;">
                    <li><button>간이주점</button></li>
                    <li style="width: 100%; display: none;" class="cate3_top">
                        <ul class="cate3 cb">
                            <li><button>호프/맥주</button></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!--업종선택-->


<script type="text/javascript">

    $(document).ready(function (){
        $(".pc_bdy.ticket").children(".middle").find('ul > li').on('click', function (){
            if($(this).data('gubun') == "area"){
                areaReset();
            }else if($(this).data('gubun') == "upjong"){
                upjongReset();
            }
        });

        // pc 재선택
        $("#pcBasicReset").on('click', function (){
            reset();
        });

        // pc 리포트 생성
        $("#pcBasicReport").on('click', function (){
            getFreeReport();
        });

        // 모바일 재선택
        $("#moBasicReset").on('click', function (){
            reset();
            $('.sheet_02').hide();
            $('.cate2.cb').hide();
            $('.sheet_01').show();
        });

        //모바일 리포트 생성
        $("#moBasicReport").on('click', function (){
            getFreeReport();
        });

    });

</script>


