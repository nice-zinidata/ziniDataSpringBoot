<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--
    PageName    :
    FileName    : member1.jsp
    Description : 나이스비즈맵 관리자 페이지 - 회원관리 - 회원현황
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
%>
<!doctype html>
<head>
    <style>
        #contents .inner .main .card ul li {
            width: 30%;
        }
    </style>
</head>
<div id="contents">
    <div class="inner">
        <div class="header">
            <h2>회원현황</h2>
        </div>
        <div class="main">
            <div class="card">
                <ul class="d-flex">
                    <li>
                        <div class="form-floating">
                            <input type="text" class="form-control" id="loginId" placeholder="" name="loginId">
                            <label for="loginId">아이디</label>
                        </div>
                    </li>
                    <li>
                        <div class="form-floating">
                            <input type="text" class="form-control" id="memNm" placeholder="" name="memNm">
                            <label for="memNm">이름</label>
                        </div>
                    </li>
                    <li></li>
                </ul>
                <ul class="d-flex">
                    <li>
                        <div class="form-floating">
                            <input type="number" class="form-control" id="mobileNo" placeholder="" name="mobileNo">
                            <label for="mobileNo">휴대전화</label>
                        </div>
                    </li>
                    <li>
                        <div class="form-floating">
                            <input type="email" class="form-control" id="emailAddr" placeholder="" name="emailAddr">
                            <label for="emailAddr">이메일</label>
                        </div>
                    </li>
                    <li>
                        <div class="form-floating">
                            <select class="form-select" id="memStat" aria-label="status" name="memStat">
                                <option value="all">전체</option>
                                <option value="N">탈퇴</option>
                                <option value="Y">회원</option>
                            </select>
                            <label for="memStat">상태</label>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="d-flex justify-content-end mt-1">
                <button type="button" id="con_reset" class="btn-secondary">조건초기화</button>
                <button type="button" id="search" class="btn-first" onclick="memberList();">검색</button>
            </div>
            <div class="table-responsive my-2" id="_mem_search">
            </div>
            <hr>
            <div class="detail-box d-none">
                <div class="d-flex">
                    <button type="button" class="btn-third" id="detailEdit">수정</button>
                    <button type="button" class="btn-fourth" id="detailSave" disabled>저장</button>
                    <button type="button" class="btn-secondary" id="detailFranReg">Fran 등록</button>
                    <button type="button" class="btn-secondary" id="detailCoupon">쿠폰발급</button>
                    <button type="button" class="btn-secondary" id="detailCancle">취소</button>
                </div>
                <div class="table-responsive" id="_mem_search_detail">
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    var memNo = 0;
    var detailEditYN = false;
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
        init();
        console.log("member1.jsp 다시 load");

        menuActive("member", "sideMember1");

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


    // 검색
    function memberList() {
        var param = {};
        param.loginId = $('#loginId').val();
        param.memNm = $('#memNm').val();
        param.mobileNo = $('#mobileNo').val();
        param.emailAddr = $('#emailAddr').val();
        var memStat = $('#memStat').val();
        param.memStat = memStat == 'all' ? "" : (memStat == 'Y' ? "2" : "1");
        param.memNo = 0;
        param.gubun = "list";

        getAjax("search", "/bizmapAdmin/member/memList", param, fn_succ_memList, fn_error);
    }

    function fn_succ_memList(id, response, param) {
        var template = $('#tb_mem_search').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);
        $('#_mem_search').html(html);
    }

    // 회원 검색 결과 row 클릭 이벤트
    function rowClicked(rowRn) {
        var param = {};
        param.gubun = "detail";
        param.memNo = rowRn.memno;
        getAjax("search", "/bizmapAdmin/member/memHstList", param, fn_succ_franMemList, fn_error);
    }

    function fn_succ_franMemList(id, response, param) {
        console.log(response.data.rMemberList);

        response.data.rFranMemberList[0].updDtStr = response.data.rMemberHstList[0].updDtStr
        response.data.rFranMemberList[0].updDt = response.data.rMemberHstList[0].updDt
        response.data.rFranMemberList[0].interestUpjong1Str = response.data.rMemberList[0].interestUpjong1Str.replaceAll("&gt;", ">")
        response.data.rFranMemberList[0].interestUpjong2Str = response.data.rMemberList[0].interestUpjong2Str.replaceAll("&gt;", ">")
        response.data.rFranMemberList[0].interestUpjong3Str = response.data.rMemberList[0].interestUpjong3Str.replaceAll("&gt;", ">")
        response.data.rFranMemberList[0].areanm1 = response.data.rMemberList[0].areanm1
        response.data.rFranMemberList[0].areanm2 = response.data.rMemberList[0].areanm2
        response.data.rFranMemberList[0].areanm3 = response.data.rMemberList[0].areanm3

        memNo = response.data.rFranMemberList[0].memNo;
        var template = $('#tb_mem_search_detail').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);
        $('#_mem_search_detail').html(html);

        if(!common.isEmpty(response.data)) {
            $('.detail-box').removeClass('d-none');
            $('#detailEdit').prop('disabled', false);
        }
    }

    function detailEditYNFunc(YN) {
        if(YN == true) {
            $('#_mem_search_detail select').prop('disabled', false);
            $('button#detailEdit').prop('disabled', true);
            $('button#detailSave').prop('disabled', false);
        }
        else {
            $('#_mem_search_detail select').prop('disabled', true);
            $('button#detailEdit').prop('disabled', false);
            $('button#detailSave').prop('disabled', true);
        }
    }

    // 수정 기능
    $('#detailEdit').on('click', function() {
        detailEditYN = true;
        detailEditYNFunc(detailEditYN);
    });
    // 저장 기능
    $('#detailSave').on('click', function() {
        if(confirm("저장하시겠습니까?")) {
            detailEditYN = false;
            detailEditYNFunc(detailEditYN);
            $('#_mem_search_detail').empty();
            rowClicked(memNo);
        } else {
            return;
        }

    })
</script>

<%--HandleBars--%>
<script type="text/x-handlebars-template" id="tb_mem_search">
    <table class="table table-hover">
        <thead class="thead-light">
        <tr>
            <th scope="col">번호</th>
            <th scope="col">이름</th>
            <th scope="col">아이디</th>
            <th scope="col">가입일자</th>
            <th scope="col">사용자유형</th>
            <th scope="col">휴대전화</th>
            <th scope="col">이메일</th>
            <th scope="col">상태</th>
            <th scope="col">탈퇴일자</th>
        </tr>
        </thead>
        <tbody class="table-group-divider">
        {{#each data}}
        <tr data-memno={{memNo}} data-gubun="detail" onclick="rowClicked($(this).data());">
            <td>{{rn}}</td>
            <td>{{memNm}}</td>
            <td>{{loginId}}</td>
            <td>{{subsDtStr}}</td>
            <td>{{#ifCond memType '==' 0}}
                    전체
                {{else}}
                    {{#ifCond memType '==' 1}}
                        예비창업자
                    {{else}}
                        {{#ifCond memType '==' 2}}
                            점포운영자
                        {{else}}
                            {{#ifCond memType '==' 3}}
                                사업종전환희망자용
                            {{else}}
                                컨설턴트
                            {{/ifCond}}
                        {{/ifCond}}
                    {{/ifCond}}
                {{/ifCond}}
            </td>
            <td>{{mobileNo}}</td>
            <td>{{emailAddr}}</td>
            <td>{{#ifCond memStat '==' 2}}
                    회원
                {{else}}
                    탈퇴
                {{/ifCond}}
            </td>
            <td>{{leaveDtStr}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="9">검색된 결과가 없습니다.</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
</script>

<script type="text/x-handlebars-template" id="tb_mem_search_detail">
    <table class="table table-hover table-row table-sm my-1">
        {{#each rFranMemberList}}
        <tr>
            <th width="15%">이름</th>
            <td width="35%">{{memNm}}</td>
            <th width="15%">가입일자</th>
            <td width="35%">{{subsDtStr}}</td>
        </tr>
        <tbody>
        <tr>
            <th>아이디</th>
            <td>{{loginId}}</td>
            <th>핸드폰</th>
            <td>{{mobileNo}}</td>
        </tr>
        <tr>
            <th>이메일</th>
            <td>{{emailAddr}}</td>
            <th>이메일 수신여부</th>
            <td>
                <select class="form-select form-select-sm" id="emailYn" aria-label="status" name="emailYn" disabled>
                    <option value="Y" {{#ifCond emailYn '==' 'Y'}} selected {{/ifCond}}>수신</option>
                    <option value="N" {{#ifCond emailYn '==' 'N'}} selected {{/ifCond}}>미수신</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>SMS 수신여부</th>
            <td>
                <select class="form-select form-select-sm" id="smsYn" aria-label="status" name="smsYn" disabled>
                    <option value="Y" {{#ifCond smsYn '==' 'Y'}} selected {{/ifCond}}>수신</option>
                    <option value="N" {{#ifCond smsYn '==' 'N'}} selected {{/ifCond}}>미수신</option>
                </select>
            </td>
            <th>조기경보 수신여부</th>
            <td>
                <select class="form-select form-select-sm" id="alarmYn" aria-label="status" name="alarmYn" disabled>
                    <option value="Y" {{#ifCond alarmYn '==' 'Y'}} selected {{/ifCond}}>수신</option>
                    <option value="N" {{#ifCond alarmYn '==' 'N'}} selected {{/ifCond}}>미수신</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>사용자유형</th>
            <td>
                <select class="form-select form-select-sm" id="memTypeDetail" aria-label="status" name="memTypeDetail" disabled>
                    <option value="1" {{#ifCond memType '==' 1}} selected {{/ifCond}}>예비창업자</option>
                    <option value="2" {{#ifCond memType '==' 2}} selected {{/ifCond}}>점포운영자</option>
                    <option value="3" {{#ifCond memType '==' 3}} selected {{/ifCond}}>사업종전환희망자용</option>
                    <option value="4" {{#ifCond memType '==' 4}} selected {{/ifCond}}>컨설턴트</option>
                </select>
            </td>
            <th>상태</th>
            <td>
                <select class="form-select form-select-sm" id="memStatDetail" aria-label="status" name="memStat" disabled>
                    <option value="1" {{#ifCond memStat '==' '1'}} selected {{/ifCond}}>탈퇴</option>
                    <option value="2" {{#ifCond memStat '==' '2'}} selected {{/ifCond}}>회원</option>
                </select>
            </td>
        </tr>
        {{#ifCond detailEditYN '==' false}}
            <tr>
                <th rowspan="3">관심지역</th>
                <td class="int_area1">{{areanm1}}</td>
                <th rowspan="3">관심업종</th>
                <td class="int_upjong1">{{interestUpjong1Str}}</td>
            </tr>
            <tr>
                <td class="int_area2">{{areanm2}}</td>
                <td class="int_upjong2">{{interestUpjong2Str}}</td>
            </tr>
            <tr>
                <td class="int_area3">{{areanm3}}</td>
                <td class="int_upjong3">{{interestUpjong3Str}}</td>
            </tr>
        {{else}}
            <tr>
                <th rowspan="3">관심지역</th>
                <td class="int_area1">
                    <div class="d-flex">
                        <select class="form-select form-select-sm" id="int_area2_mega" name="int_area2_mega">
                            <option value="all">대분류</option>
                            <option value="11">서울특별시</option>
                        </select>
                        <select class="form-select form-select-sm" id="int_area2_cty" name="int_area2_cty">'
                            <option value="all">중분류</option>
                            <option value="">강서구</option>
                        </select>
                        <select class="form-select form-select-sm" id="int_area2_admi" name="int_area2_admi">
                            <option value="all">소분류</option>
                            <option value="">방화2동</option>
                        </select>
                    </div>
                </td>
                <th rowspan="3">관심업종</th>
                <td class="int_upjong1">
                    <div class="d-flex">
                        <select class="form-select form-select-sm" id="int_upjong_up1" name="int_upjong_up1">
                            <option value="all">대분류</option>
                            <option value="">생활서비스</option>
                        </select>
                        <select class="form-select form-select-sm" id="int_upjong_up2" name="int_upjong_up2">'
                            <option value="all">중분류</option>
                            <option value="">광고/인쇄/인화</option>
                        </select>
                        <select class="form-select form-select-sm" id="int_upjong_up3" name="int_upjong_up3">
                            <option value="all">소분류</option>
                            <option value="">간판/광고</option>
                        </select>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="int_area2"></td>
                <td class="int_upjong2"></td>
            </tr>
            <tr>
                <td class="int_area3"></td>
                <td class="int_upjong3"></td>
            </tr>
        {{/ifCond}}
        <tr>
            <th>변경일자</th>
            <td>{{updDt}}</td>
            <th>탈퇴일자</th>
            <td>{{endDt}}</td>
        </tr>
        <tr>
            <th>일시/변경자</th>
            <td>{{updDtStr}}</td>
            <th>탈퇴사유</th>
            <td>{{leaveReasonText}}</td>
        </tr>
        </tbody>
        {{/each}}
    </table>
</script>



