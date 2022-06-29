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
            width: 24%;
        }
    </style>
</head>
<div id="contents">
    <div class="inner">
        <div class="header">
            <h2>서비스 신청내역</h2>
        </div>
        <div class="main">
            <div class="card">
                <ul class="d-flex">
                    <li>
                        <div class="form-floating">
                            <input type="date" class="form-control" id="dateFrom" placeholder="2020-01-01" value="2020-01-01" name="dateFrom">
                            <label for="dateFrom">구입일자 시작</label>
                        </div>
                    </li>
                    <li>
                        <div class="form-floating">
                            <input type="date" class="form-control" id="dateTo" placeholder="2022-06-14" value="2022-06-14" name="dateTo">
                            <label for="dateTo">구입일자 끝</label>
                        </div>
                    </li>
                    <li>
                        <div class="form-floating">
                            <select class="form-select" id="payMethod" aria-label="status" name="payMethod">
                                <option value="all">전체</option>
                                <option value="SC0010">신용카드</option>
                                <option value="SC0030">계좌이체</option>
                                <option value="SC0040">무통장</option>
                                <option value="SC0060">휴대폰</option>
                                <option value="SC0070">유선전화결제</option>
                                <option value="SC0090">OK캐쉬백</option>
                                <option value="SC0111">문화상품권</option>
                                <option value="SC0112">게임문화상품권</option>
                                <option value="NI0010">전문가보고서(무료)</option>
                                <option value="NI0020">쿠폰(무료)</option>
                                <option value="NI0030">관리자용(무료)</option>
                                <option value="NI0040">비즈팡</option>
                                <option value="NI0050">회원가입쿠폰(무료)</option>
                            </select>
                            <label for="payMethod">결제방식</label>
                        </div>
                    </li>
                    <li>
                        <div class="form-floating">
                            <select class="form-select" id="prodType" aria-label="status" name="prodType">
                                <option value="all">전체</option>
                                <option value="08">선불이용권</option>
                                <option value="06">FRAN</option>
                                <option value="05">전문가보고서</option>
                                <option value="04">쿠폰</option>
                                <option value="03">관리자쿠폰</option>
                                <option value="02">패키지</option>
                                <option value="01">단품</option>
                            </select>
                            <label for="prodType">상품종류</label>
                        </div>
                    </li>
                </ul>
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
                    <li>
                        <div class="form-floating">
                            <input type="text" class="form-control" id="pageLength" placeholder="" name="pageLength">
                            <label for="pageLength">리스트 행수</label>
                        </div>
                    </li>
                </ul>
                <ul class="d-flex">
                    <li>
                        <div class="form-floating">
                            <select class="form-select" id="memStat" aria-label="status" name="memStat">
                                <option value="all">전체</option>
                                <option value="N">탈퇴</option>
                                <option value="Y">회원</option>
                            </select>
                            <label for="memStat">회원구분</label>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="d-flex justify-content-end mt-1">
                <button type="button" id="con_reset" class="btn-secondary">조건초기화</button>
                <button type="button" id="search" class="btn-first" onclick="svcList();">검색</button>
            </div>
            <div class="table-responsive my-3" id="_svc_list">
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">

    $(function(){
        console.log("member2.jsp 다시 load");

        menuActive("member", "sideMember2");

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
    function svcList() {
        var param = {};
        param.dateFrom = $('#dateFrom').val();
        param.dateTo = $('#dateTo').val();
        var payMethod = $('#payMethod').val();
        param.payMethod = payMethod == 'all' ? "" : payMethod;
        var prodType = $('#prodType').val();
        param.prodType = prodType == 'all' ? "" : prodType;
        param.loginId = $('#loginId').val();
        param.memNm = $('#memNm').val();
        param.pageLength = $('#pageLength').val();
        var memStat = $('#memStat').val();
        param.memStat = memStat == 'all' ? "" : (memStat == 'Y' ? "2" : "1");

        getAjax("svcList", "/bizmap/admin/member2/search", param, fn_succ_svcList, fn_error);
    }

    function fn_succ_svcList(id, response, param) {
        var template = $('#tb_svc_list').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        console.log(context);
        var html = templateScript(context);
        $('#_svc_list').html(html);
    }

</script>

<script type="text/x-handlebars-template" id="tb_svc_list">
    <table class="table table-hover">
        <thead class="thead-light">
        <tr>
            <th scope="col">번호</th>
            <th scope="col">이름</th>
            <th scope="col">아이디</th>
            <th scope="col">상품구분</th>
            <th scope="col">상품명</th>
            <th scope="col">결제일시</th>
            <th scope="col">잔여/구매횟수</th>
            <th scope="col">결제금액</th>
            <th scope="col">결제방식</th>
            <th scope="col">서비스유효기간</th>
            <th scope="col">결제여부</th>
            <th scope="col">결제 취소일시</th>
        </tr>
        </thead>
        <tbody class="table-group-divider">
        {{#each data}}
        <tr>
            <td>{{rn}}</td>
            <td>{{memNm}}</td>
            <td>{{loginId}}</td>
            <td>{{#ifCond prodType '==' 0}}
                전체
                {{else}}
                {{#ifCond prodType '==' 08}}
                선불이용권
                {{else}}
                {{#ifCond prodType '==' 06}}
                FRAN
                {{else}}
                {{#ifCond prodType '==' 05}}
                전문가보고서
                {{else}}
                {{#ifCond prodType '==' 04}}
                쿠폰
                {{else}}
                {{#ifCond prodType '==' 03}}
                관리자쿠폰
                {{else}}
                {{#ifCond prodType '==' 02}}
                패키지
                {{else}}
                단품
                {{/ifCond}}
                {{/ifCond}}
                {{/ifCond}}
                {{/ifCond}}
                {{/ifCond}}
                {{/ifCond}}
                {{/ifCond}}
            </td>
            <td>{{prodNm}}</td>
            <td>{{payDate}}</td>
            <td>{{remainLimit}}/{{totLimit}}</td>
            <td>{{payAmt}}</td>
            <td>{{#ifCond payMethod '==' SC0010}}
                신용카드
                {{else}}
                {{#ifCond payMethod '==' SC0030}}
                계좌이체
                {{else}}
                {{#ifCond payMethod '==' SC0040}}
                무통장
                {{else}}
                {{#ifCond payMethod '==' SC0060}}
                휴대폰
                {{else}}
                {{#ifCond payMethod '==' SC0070}}
                유선전화결제
                {{else}}
                {{#ifCond payMethod '==' SC0090}}
                OK캐쉬백
                {{else}}
                {{#ifCond payMethod '==' SC0111}}
                문화상품권
                {{else}}
                {{#ifCond payMethod '==' SC0112}}
                게임문화상품권
                {{else}}
                {{#ifCond payMethod '==' NI0010}}
                전문가보고서(무료)
                {{else}}
                {{#ifCond payMethod '==' NI0020}}
                쿠폰(무료)
                {{else}}
                {{#ifCond payMethod '==' NI0030}}
                관리자용(무료)
                {{else}}
                {{#ifCond payMethod '==' NI0040}}
                비즈팡
                {{else}}
                회원가입쿠폰(무료)
                {{/ifCond}}
                {{/ifCond}}
                {{/ifCond}}
                {{/ifCond}}
                {{/ifCond}}
                {{/ifCond}}
                {{/ifCond}}
                {{/ifCond}}
                {{/ifCond}}
                {{/ifCond}}
                {{/ifCond}}
                {{/ifCond}}
            </td>
            <td>{{validDtTo}}</td>
            <td>{{payStat}}</td>
            <td>{{expirationDate}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="12">검색된 결과가 없습니다.</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
</script>
