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

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover">

    <!-- css 모음 -->
    <%@ include file="/WEB-INF/views/bizmap/include/head.jsp" %>

    <!-- echart -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/echarts@5.3.2/dist/echarts.min.js"></script>
    <%@ include file="/WEB-INF/views/bizmap/include/script.jsp" %>
    <script>

    </script>
    <title>구독서비스</title>
</head>

<body class="idx3 pc_st static" style="height: fit-content;">
<!--ㅡmenu_top-->
<div class="menu_top pd onlypc">
    <div class="menu_left">
        <div class="logo_box">
            <a href="index.html"></a>
        </div>
        <p class="navi_text onlypc">구독 서비스</p>
    </div>
    <div class="menu_right">
        <div class="comm_box">
            <div id="menuToggle">
                <a href="#"></a>
            </div>
        </div>
    </div>
</div>
<!--ㅡmenu_top-->

<!-- snb START -->
<div class="snb_box">
    <div class="snb_header cb">
        <div id="menuToggle2">
            <a href="#"></a>
        </div>
    </div>
    <ul class="snb_ul snb1">
        <li><a href="#">나이스비즈맵</a></li>
        <li><a href="/bizmap/analysis/analysisFree">상권분석</a></li>
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
<!-- snb START -->

    <div class="pop_float agree" style="display: none;">
        <div class="sheet_hd pd">
            <div class="ico_box">
                <a href="#" style="display: none;">
                </a>
            </div>
            <div class="name_box">

            </div>
            <div class="close_box">
                <a href="javascript:;">
                </a>
            </div>
        </div>
        <div class="pop_body pd">
            <p class="m_txt">개인정보 활용동의</p>
            <p class="s_txt">개인정보 수집 및 이용에 대한 안내</p>
            <textarea name="textarea1" id="textarea1" class="join_textarea" readonly="readonly" title="서비스이용약관">
제 1 장. 

제 1 조 (목적)
    이 약관은 NICE지니데이타주식회사(이하 "회사"라 합니다)가 제공하는 "나이스비즈맵" 상권분석서비스(www.nicebizmap.co.kr) (이하 "서비스"라 합니다)를 이용함에 있어 "회사"와 "이용자"의 권리, 의무, 이용조건, 절차, 이용자 규칙 및 책임사항에 관한 사항을 규정함을 목적으로 합니다.

제 2 조 (정의)

1. "나이스비즈맵 상권분석 서비스"는 신규창업, 점포확대 및 마케팅 기획을 목적으로 하는 개인 및 기업을 대상으로 전자지도, 솔루션, 통계정보 등을 이용하여 주변상권 등을 과학적이고 체계적인 기법으로 파악하여, 그 분석정보를 솔루션 또는 서비스로 제공하는 것을 말합니다.

2. "이용자"란 본 약관에서 정의한 "회원"과 "비회원"을 말합니다.

3. "회원"이라 함은 "서비스"에 자신의 정보를 제공하여 회원등록을 한 개인 또는 기업으로서, "회사"가 제공하는 "서비스"를 계속적으로 이용할 수 있는 자를 말합니다.

4. "비회원"이라 함은 회원에 가입하지 않고 "회사"가 제공하는 "서비스"를 이용하는 개인 또는 기업을 말합니다.

5. “아이디(ID)”라 함은 “회원”의 식별과 서비스 이용을 위하여 회원이 정하고, 회사가 승인하는 문자와 숫자의 조합을 말합니다.

6. 비밀번호: “회원”이 본인임을 확인하고, 비밀보호를 위해 회원 자신이 정한 문자 또는 숫자의 조합을 말합니다.

제 3 조 (약관의 개정과 효력발생)

1. "회사"는 이 약관의 내용과 상호, 영업소 소재지 주소, 전화번호, 전자우편주소, 사업자등록번호, 개인정보 관리책임자 등을 이용자가 쉽게 알 수 있도록 서비스 화면에 게시합니다. 다만, 약관 등의 일부 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.

2. "회사"는 약관의 규제에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전자거래기본법, 전자서명법, 금융실명거래 및 비밀보장에 관한 법률, 소비자기본법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.

3. "회사"는 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 "서비스"에 그 적용일 7일 이전부터 적용일자 전일까지 공지합니다.

4. "이용자"는 변경된 약관 내용에 동의하지 않으면 서비스 이용을 중단할 수 있습니다. 단, 개정약관의 적용일 이후 30일 동안 서비스를 이용하는 경우 해당 "회원"은 약관의 변경에 동의한 것으로 간주됩니다.

5. 이 약관에서 정하지 아니한 내용과 이 약관의 해석에 관하여는 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자보호지침 및 관계법령 또는 상관례에 따릅니다.

6. 본 약관은 서비스 화면에 게시하거나 기타의 방법으로 "이용자"에게 알림으로써 효력이 발생됩니다.

7. 개정된 약관 공시내용을 알지 못해서 발생하는 "이용자"의 피해에 대해서는 "회사"가 책임지지 않습니다.
            </textarea>
        </div>
        <div class="pop_foot">
            <div class="button_box">
                <button class="btn2">취소</button>
                <button class="btn1">동의합니다</button>
            </div>
        </div>
    </div>

    <!--sheet_01 START-->
    <div class="sheet md_sheet sheet_02" style="display: none;">
        <div class="sheet_hd pd">
            <div class="ico_box popup_back">
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
        <div class="sheet_body pd">
            <div class="box txt_bx">
                <p class="main_txt">업종을 선택하여
                    <br/>상권 분석을 시작해 보세요.</p>
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
                                <li><button>호프/맥주</button></li>
                            </ul>
                        </li>
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
        <div class="sheet_ft"></div>
    </div>
    <!--sheet_02 END--><!--업종선택-->

    <!--sheet_01 START--><!--분석지역-->
    <div class="sheet sheet_01 md_sheet" style="display: none;">
        <div class="sheet_hd pd">
            <div class="ico_box popup_back">
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
                <p class="main_txt">분석하고자 하는<br/>
                    지역을 선택해주세요.</p>
                <p class="sub_txt">
                    <span class="loca">지역선택</span>
                    <!-- <span class="bar">|</span>
                    <span class="kind">업종선택</span> -->
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
                            <li><a href="#">대구광역시</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="sheet_ft"></div>
    </div>
    <!--sheet_01 END--><!--분석지역-->


    <!-- snb START -->
    <div class="snb_box">
        <div class="snb_header cb">
            <div id="menuToggle2">
                <a href="#"></a>
            </div>
        </div>
        <ul class="snb_ul snb1">
            <li><a href="#">나이스비즈맵</a></li>
            <li><a href="/bizmap/analysis/analysisFree">상권분석</a></li>
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
    <!-- snb START -->

    <!--사이드바 모달 modal START-->
    <div class="modal modal1"></div>
    <!--modal END-->
    <!--bottom popup시 모달 modal START-->
    <div class="modal modal2"></div>
    <!--modal END-->

    <!--sheet_02 START-->
    <!--고객문의-->
    <div class="onlypc middle_logo">
        <div class="logo_box">
            <a href="index.html"></a>
        </div>
    </div>
    <div class="sheet sheet_05 full_sheet subscribe" style="z-index: 5;">
        <div class="sheet_hd pd wh">
            <div class="ico_box">
                <a href="javascript:;" onclick="history.back();"></a>
            </div>
            <div class="name_box">
                구독서비스
            </div>
            <div id="menuToggle">
                <a href="#"></a>
            </div>
        </div>
        <div class="sheet_body">
            <div class="hd_banner">
                <div class="box txt_bx notice nt1 banner">
                    <img src="/bizmap/assets/bizmap/images/banner/banner1.png" alt="">
                    <!-- <p class="main_txt">나이스비즈맵 구독서비스</p>
                <p class="sub_txt">
                    구독 서비스를 신청하시면
                    매월 변화하는 상권보고서를 확인 할 수 있어요.
                </p> -->
                </div>
            </div>
            <div class="section pd">
                <div class="dialog input">
                    <div class="inner" style="width: 100%;">
                        <div class="input-list">
                            <div class="base">
                                <label for="mem_nm" class="tp_lb">이름</label>
                                <input id="mem_nm" type="text" title="구독자 이름 입력란" placeholder="이름입력">
                                <label for="mem_nm" style="display: none;">
                                    <span class="alert"><strong>&nbsp!&nbsp</strong> 이름을 입력해주세요</span>
                                </label>
                            </div>
                            <div class="base cb">
                                <label for="mobile_no" class="tp_lb">휴대폰</label>
                                <input id="mobile_no" title="구독자 이름 입력란" placeholder="휴대폰 번호 입력" type="text" class="fl" onkeyup="mobileNoOnkeyUp();">
                                <button type="button" class="btn" id="phone_check" name="phone_check" title="휴대폰 인증" class="fr" disabled>인증</button>
                                <!-- <button type="button" class="btn" id="phone_check" name="phone_check" title="휴대폰 인증" class="fr" disabled>다시받기</button> -->
                                <label for="mobile_no" style="display: none;">
                                    <span class="alert"><strong>&nbsp!&nbsp</strong> 휴대폰 번호를 입력해주세요</span>
                                </label>
                            </div>
                            <div class="base cb">
                                <label for="auth_no" class="tp_lb">인증번호</label>
                                <input id="auth_no" title="구독자 이름 입력란" placeholder="인증번호 입력" type="number" class="fl" onkeyup="authNoOnkeyUp();">
                                <button type="button" class="btn" id="auth_check" name="auth_check" title="휴대폰 인증" class="fr" disabled>확인</button>
                                <label for="auth_no" style="display: none;">
                                    <span class="alert"><strong>&nbsp!&nbsp</strong> 휴대폰 번호를 입력해주세요</span>
                                </label>
                                <label for="auth_no">
                                    <span class="basic" id="certSendMsg" style="display: none"><strong>&nbsp!&nbsp</strong>인증번호가 발송되었습니다.</span>
                                    <span class="basic" id="certSuccessMsg" style="display: none;color: #006fff">인증번호 인증 완료</span>
                                </label>
                                <label for="auth_no" id="certSendMsg2" style="display: none">
                                    <span class="basic sub">
                                        입력하신 휴대폰 번호로 인증번호가 도착하지 않을 경우, <br />고객센터(02-3215-2828)로 연락주시기 바랍니다.</span>
                                </label>
                            </div>
                            <div class="base">
                                <label for="mem_type" class="tp_lb">나의 유형</label>
                                <select name="mem_type" id="mem_type" title="구독자 유형 선택" class="select alert" required>
                                    <option value="99" disabled selected>나의 유형을 선택</option>
                                    <option value="1">예비창업자</option>
                                    <option value="2">점포운영자</option>
                                    <option value="3">업종전환희망자</option>
                                    <option value="4">컨설턴트</option>
                                </select>
                                <label for="mem_type" id="mem_type_message">
                                    <span class="alert"><strong>&nbsp!&nbsp</strong> 나의 유형을 선택해 주세요</span>
                                </label>
                            </div>
                            <div class="base">
                                <label for="interest_areacd1" class="tp_lb">지역</label>
                                <input type="text" id="interest_areacd1" name="interest_areacd1" value=""
                                    readonly="readonly" title="분석 지역 선택" placeholder="분석 지역 선택">
                                <label for="interest_areacd1">
                                    <span class="alert" style="display: none;"><strong>&nbsp!&nbsp</strong> 분석 지역을 선택해
                                        주세요</span>
                                    <span class="basic"><strong>&nbsp!&nbsp</strong> 표본수 3개 이하의 지역은 분석이 제한됩니다.</span>
                                </label>
                            </div>
                            <div class="base">
                                <label for="interest_upjong1" class="tp_lb">업종</label>
                                <input type="text" id="interest_upjong1" name="interest_upjong1" value=""
                                    readonly="readonly" title="분석 업종 선택" placeholder="분석 업종 선택">
                                <label for="interest_upjong1">
                                    <span class="alert" style="display: none;"><strong>&nbsp!&nbsp</strong> 분석 업종을 선택해
                                        주세요</span>
                                    <span class="basic"><strong>&nbsp!&nbsp</strong> 표본수 3개 이하의 업종은 분석이 제한됩니다.</span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section pd last">
                <fieldset class="chk">
                    <ul>
                        <li class="cb">
                            <label class="chk_box fl" for="check1"><strong>이용약관 전체 동의</strong>
                                <input type="checkbox" name="check1" id="check1">
                                <span class="checkmark" data-check="99"></span>
                            </label>
                        </li>
                        <li style="display: none;">
                            <span class="alert"><strong>&nbsp!&nbsp</strong> 개인정보 활용동의는 필수 항목입니다.</span>
                        </li>
                        <li class="cb">
                            <label class="chk_box fl" for="check2"><strong>[필수]</strong> 개인정보 활용동의
                                <input type="checkbox" name="check2" id="check2">
                                <span class="checkmark" data-check="1"></span>
                            </label>
                            <a href="#" class="view fl" data-gubun="personal">자세히 보기</a>

                        </li>
                        <li class="cb">
                            <label class="chk_box fl" for="check3"><strong>[선택]</strong> 마케팅정보 수신동의
                                <input type="checkbox" name="check3" id="check3">
                                <span class="checkmark" data-check="2"></span>
                            </label>
                            <a href="#" class="view fl" data-gubun="marketing">자세히 보기</a>
                        </li>
                    </ul>
                </fieldset>
                <div class="button_box" style="padding: 0;">
                    <button class="btn1" style="width: 100%;" onclick="subscribe();">구독하기</button>
                </div>
            </div>
            <div class="sheet_ft" style=" background-color: #fff;">© Nicezinidata Corp. All rights reserved.</div>
        </div>

    </div>
    <!--sheet_02 END-->
    <!--업종선택-->

</body>

</html>

<script type="text/javascript">
    var megaCd;
    var ctyCd;
    var admiCd = "";

    var strAreaNm = "";
    var megaNm = "";
    var ctyNm = "";
    var admiNm = "";

    var upjongNm = "";
    var upjong3Cd = "";
    var seqNo ="";
    var certNo ="";
    var certCheck = false;
    var agreeGubun = "";    // 동의 구분

    $(document).ready(function (){
        $('a.view').on('click', function() {
            $('.modal1').css('display','block');
            $('.pop_float').css('display','block');

            agreeGubun = $(this).data('gubun');
        });

        //마케팅동의, 개인정보수집동의 x 버튼
        $(".pop_float.agree").find('.close_box').on('click', function(){
            $('.modal1').css('display','none');
            $('.pop_float').css('display','none');
        });
        // 마케팅동의, 개인정보수집동의 취소 버튼
        $(".pop_float.agree").find('.button_box > .btn2').on('click', function (){
            $('.modal1').css('display','none');
            $('.pop_float').css('display','none');
        });

        // 마케팅동의, 개인정보수집동의 동의 버튼
        $(".pop_float.agree").find('.button_box > .btn1').on('click', function (){
            $('.modal1').css('display','none');
            $('.pop_float').css('display','none');
            (agreeGubun == "personal") ? $("input[name=check2]").prop('checked',true) : $("input[name=check3]").prop('checked',true);
        });

        $(".ico_box.popup_back").on('click', function (){
            $('.sheet_01').hide();
            $('.sheet_02').hide();
        });

        //구독서비스에서 업종선택
        $('.idx3 input#interest_upjong1').on('click', function() {
            $('.sheet_02').css('display','block');
            $("#interest_upjong1").val('');
            upjong3Cd = "";
            var data = {
                gubun : "upjong1"
            };
            getUpjong(data);
        });

        //구독서비스에서 지역선택
        $('.idx3 input#interest_areacd1').on('click', function() {
            $('.sheet_01').css('display','block');
            $("#interest_areacd1").val('');
            strAreaNm = "";

            megaCd ="";
            ctyCd = "";
            admiCd = "";
            megaNm = "";
            ctyNm = "";
            admiNm = "";

            var data = {};
            getArea(data, '');
        });

        var $item = $('.row > li > button').on('click', function() {
            var idx = $item.index(this);
            var val = $(this).val();
            $('.cate2.cb.r1').css('display','none');
            $('.cate2.cb.r2').css('display','none');
            if(idx < 3){
                $('.cate2.cb.r1').css('display','block');
                $('.cate2.cb.r1').removeClass().addClass('cate2 cb r1 on'+ (idx+1));
            }else if(idx > 2 && idx < 6){
                $('.cate2.cb.r2').css('display','block');
                $('.cate2.cb.r2').removeClass().addClass('cate2 cb r2 on'+ (idx-2));
            }
            var data = {
                upjong1Cd : val
                ,gubun : "upjong2"
            };

            upjongNm = $(this).text();
            getUpjong(data);
        });

        $('.sheet_01 .back > a').on('click', function() {
            $('.sheet_01').hide();
            $('.modal1').hide();
        });

        $('.sheet_02 .back > a').on('click', function() {
            $('.sheet_02').hide();
            $('.modal1').hide();
        });

        $('#phone_check').on('click', function (){
            $("#phone_check").text("재전송");
            param = {};
            param.mobileNo = $("#mobile_no").val();
            param.memNm = $("#mem_nm").val();

            getAjax("setCert", "/bizmap/setCert", param,
                function (id, response, param){
                    console.log(response);
                    if(response.result=="fail"){
                        alert("인증번호 ");
                    }
                    $("#certSendMsg").show();
                    $("#certSendMsg2").show();
                    $("#certSuccessMsg").hide();

                    seqNo = response.data.seqNo;
                    certNo = response.data.randomStr;
                }, fn_error);
        });

        $('#auth_check').on('click', function (){
            param = {};
            param.mobileNo = $("#mobile_no").val();
            param.memNm = $("#mem_nm").val();
            param.seqNo = seqNo;

            getAjax("setCert", "/bizmap/getCert", param,
                function (id, response, param){
                    if(!common.isEmpty(response.data)){
                        if(response.data.checkYn == "y"){

                            if($("#auth_no").val() != response.data.certNo){
                                alert("인증번호가 틀렸습니다.");
                                return;
                            }

                            $("#certSendMsg").hide();
                            $("#certSendMsg2").hide();
                            $("#certSuccessMsg").show();
                            // 전화번호 인증 여부
                            certCheck = true;
                        }else{
                            alert("인증시간이 지났습니다 재전송후 다시 시도해 주세요.");
                        }
                    }else{
                        alert("인증번호 재전송 후 다시 시도해 주세요.");
                    }
                }, fn_error);
        });

        $("input[name=check1]").on('click', function (){
            if($(this).prop('checked')){
                $("input[name^='check']").prop('checked', 'checked');
            }else{
                $("input[name^='check']").prop('checked', '');
            }
        });

        $("#mem_type").on('change', function (){
            if($(this).val() != 99){
                $("#mem_type_message").hide();
            }
        });

    });

    function mobileNoOnkeyUp(){
        var val = $("#mobile_no").val().replace(/[^0-9]/gi,"");
        $("#mobile_no").val(val);

        certCheck = false;

        $("#certSendMsg").hide();
        $("#certSendMsg2").hide();
        $("#certSuccessMsg").hide();

        if(val.length > 9 && val.length < 12){
            $("#phone_check").attr('disabled',false);
        }else{
            $("#phone_check").attr('disabled',true);
        }
    }
    function authNoOnkeyUp(){
        var val = $("#auth_no").val().replace(/[^0-9]/gi,"");
        $("#auth_no").val(val);

        certCheck = false;

        $("#certSendMsg").show();
        $("#certSendMsg2").show();
        $("#certSuccessMsg").hide();
        if(val.length > 0){
            $("#auth_check").attr('disabled',false);
        }else{
            $("#auth_check").attr('disabled',true);
        }
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
            strAreaNm = megaNm + " " + ctyNm + " " + admiNm;
            $('.sheet_01').hide();
            // $('.sheet_02').show();
        }
        var tmp =  megaNm + " " + ctyNm + " " + admiNm;
        $(".sub_txt").children('.loca').text(tmp);

        $('#interest_areacd1').val(strAreaNm);

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
            $(".cate_kind").find(".row").find('button').removeClass("on");
            $(".cate_kind").find(".row").find('button').each(function (){
                if(data.upjong1Nm == $(this).text()){
                    $(this).addClass("on");
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
            var tmp = $(this).text();
            upjongNm = upjongNm + " " + tmp.trim();
        });

        $('.cate3 > li > button').on('click', function() {
            upjong3Cd = $(this).data().upjong3cd;
            $(".cate3.cb").find("li").removeClass("on");
            $(this).parent().addClass("on");
            $(".sub_txt").find(".kind").text($(this).text());

            $(".s_txt").find(".loca").text(strAreaNm);
            $(".s_txt").find(".kind").text($(this).text());

            var tmp = $(this).text();
            upjongNm = upjongNm + " " + tmp.trim();
            $("#interest_upjong1").val(upjongNm);

            $('.sheet_02').hide();
        });
    }

    function valid(){
        if(isEmpty($("#mem_nm").val())){
            var offset = $("#mem_nm").offset();
            $('.sheet_body').animate({scrollTop : offset.top});
            alert('이름을 입력해주세요.');
            return false;
        }

        if(!certCheck){
            var offset = $("#mobile_no").offset();
            $('.sheet_body').animate({scrollTop : offset.top});
            alert('휴대폰 인증을 해주세요.');
            return false;
        }

        if(isEmpty($("#mem_type").val())){
            var offset = $("#mem_type").offset();
            $('.sheet_body').animate({scrollTop : offset.top});
            alert('나의 유형을 선택해 주세요.');
            return false;
        }

        if(admiCd == null || admiCd == "" || admiCd ==''){
            var offset = $("#interest_areacd1").offset();
            $('.sheet_body').animate({scrollTop : offset.top});
            alert('지역을 선택해 주세요.');
            return false;
        }
        if(upjong3Cd == null || upjong3Cd == "" || upjong3Cd ==''){
            var offset = $("#interest_upjong1").offset();
            $('.sheet_body').animate({scrollTop : offset.top});
            alert('업종을 선택해 주세요.');
            return false;
        }

        if(!$("input[name=check2]").prop('checked')){
            alert('개인정보 활용동의는 필수입니다.');
            var offset = $("input[name=check2]").offset();
            $('.sheet_body').animate({scrollTop : offset.top});
            return false;
        }

        return true;
    }

    // 구독서비스 등록
    function subscribe(){
        console.log(upjongNm);
        if(valid()){
            var param = {};
            param.mobileNo = $("#mobile_no").val();
            param.memNm = $("#mem_nm").val();
            param.memType = $("#mem_type").val();
            param.interestAreacd = admiCd;
            param.interestUpjong = upjong3Cd;
            param.personalInfo = ($("input[name=check2]").prop('checked')) ? 1 : 0;
            param.marketingInfo = ($("input[name=check3]").prop('checked')) ? 1 : 0;
            param.upjongNm = upjongNm;
            param.areaNm = strAreaNm;
            param.gubun = "1";
            getAjax("subscribe", "/bizmap/subscribe", param, fn_subscribe, fn_error);
        }
    }

    function fn_subscribe(id, response, param){
        if(response.result=="success"){
            alert('신청이 완료되었습니다.');
        }
    }

    function fn_error(response) {
        console.log(response);
        console.log('error');
        alert(response.message);
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