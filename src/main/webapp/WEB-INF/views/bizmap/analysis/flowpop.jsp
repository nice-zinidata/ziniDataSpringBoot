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

<!--bottom_pop btp2 pd mobile START-->
<div class="bottom_pop btp2 pd mobile" style="display:none;">
    <div class="pop_body">
        <p class="s_txt">
            <span class="loca">여의동</span> <span>유동인구 분석</span></p>
    </div>
    <div class="pop_foot">
        <div class="button_box">
            <button class="btn2">재선택</button>
            <button class="btn1">유동인구 보기</button>
        </div>
    </div>
</div>
<!--bottom_pop btp2 pd mobile END-->

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

<!--bottom_pop btp3 pd mobile START-->
<div class="bottom_pop btp3 pd mobile">
    <div class="pop_body">
        <p class="m_txt">일평균 유동인구</p>
        <p class="s_txt refer">등급기준</p>
    </div>
    <div class="pop_foot">
        <div class="index_box">
            <p>1등급</p>
            <p>2등급</p>
            <p>3등급</p>
            <p>4등급</p>
            <p>5등급</p>
        </div>
    </div>
</div>
<!--bottom_pop btp3 pd mobile END-->


<!--only_pc pc_sheet START-->
<div class="pc_sheet onlypc location on" id="pc_sheet">
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
                    <span>분석 지역 선택</span>
                </p>
            </div>
            <div class="middle">
                <ul>
                    <li><a href="#">분석 지역을 선택해주세요</a></li>
                </ul>
            </div>
            <div class="button_box">
                <button class="btn2" id="pcFlowReset">다시선택</button>
                <button class="btn1" id="pcFlowResearch">유동인구 보기</button>
            </div>
        </div>
        <div class="pc_foot">
            <div class="bottom_pop btp3 pd onlypc">
                <div class="point_tag">
                    <div></div>
                    <div></div>
                </div>
                <div class="pop_body">
                    <p class="m_txt">일평균 유동인구</p>
                </div>
                <div class="pop_foot">
                    <div class="index_box">
                        <p>1등급 </p>
                        <p>2등급</p>
                        <p>3등급</p>
                        <p>4등급</p>
                        <p>5등급</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--only_pc pc_sheet END-->

<script type="text/javascript">

    $(function (){

        // pc 재선택
        $("#pcFlowReset").on('click', function (){
            areaReset();
        });

        // pc 재조회 생성
        $("#pcFlowResearch").on('click', function (){
            reSearch();
        });

    });

</script>
