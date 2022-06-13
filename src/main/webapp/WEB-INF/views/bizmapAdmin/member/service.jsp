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
<html lang="ko">
<head>
    <meta charset="euc-kr" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>NICEbizmap 어드민</title>
    <!-- Favicon -->
    <link href="/resources/assets/bizmapAdmin/images/favicon.png" rel="icon" type="image/png" />

    <!-- css 모음 -->
    <%@ include file="/WEB-INF/views/bizmapAdmin/include/head.jsp" %>

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
    <%@ include file="/WEB-INF/views/bizmapAdmin/include/navbar.jsp" %>

    <%@ include file="/WEB-INF/views/bizmapAdmin/include/side.jsp" %>
    <div id="contents">
        <div class="inner">
            <div class="header">
                <h2>서비스 신청내역</h2>
            </div>
            <div class="main">
                <div class="card">
                    <ul class="d-flex">
                        <li>
                            <form class="form-floating">
                                <input type="text" class="form-control" id="datefrom" placeholder="test" value="test">
                                <label for="datefrom">구입일자 시작</label>
                            </form>
                        </li>
                        <li>
                            <form class="form-floating">
                                <input type="text" class="form-control" id="dateto" placeholder="test" value="test">
                                <label for="dateto">구입일자 끝</label>
                            </form>
                        </li>
                        <li>
                            <div class="form-floating">
                                <select class="form-select" id="pay_method" aria-label="status">
                                    <option selected>전체</option>
                                    <option value="1">유료</option>
                                    <option value="2">무료</option>
                                </select>
                                <label for="pay_method">결제방식</label>
                            </div>
                        </li>
                        <li>
                            <div class="form-floating">
                                <select class="form-select" id="prod_type" aria-label="status">
                                    <option selected>전체</option>
                                    <option value="1">선불이용권</option>
                                    <option value="2">FRAN</option>
                                    <option value="3">전문가보고서</option>
                                    <option value="4">쿠폰</option>
                                    <option value="5">관리자쿠폰</option>
                                    <option value="6">패키지</option>
                                    <option value="7">단품</option>
                                </select>
                                <label for="prod_type">상품종류</label>
                            </div>
                        </li>
                    </ul>
                    <ul class="d-flex">
                        <li>
                            <form class="form-floating">
                                <input type="text" class="form-control" id="login_id" placeholder="test" value="test">
                                <label for="login_id">아이디</label>
                            </form>
                        </li>
                        <li>
                            <form class="form-floating">
                                <input type="text" class="form-control" id="mem_nm" placeholder="test" value="test">
                                <label for="mem_nm">이름</label>
                            </form>
                        </li>
                    </ul>
                    <ul class="d-flex">
                        <li>
                            <div class="form-floating">
                                <select class="form-select" id="mem_stat" aria-label="status">
                                    <option selected>전체</option>
                                    <option value="1">탈퇴</option>
                                    <option value="2">회원</option>
                                </select>
                                <label for="mem_stat">회원구분</label>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="d-flex justify-content-end mt-1">
                    <button id="con_reset" class="btn-secondary">조건초기화</button>
                    <button id="search" class="btn-first">검색</button>
                </div>
                <div class="table-responsive my-3">
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
                        </tr>
                        </thead>
                        <tbody class="table-group-divider">
                        <tr>
                            <td colspan="9">검색된 결과가 없습니다.</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- //dialog -->
</body>


</html>

<!-- js 모음 -->
<%@ include file="/WEB-INF/views/bizmapAdmin/include/script.jsp" %>

<script type="text/javascript">
    var couponWin = null, prepareWin = null;
    var subscribe = null;
    var scrollY;

    var strUserId = "";
    $(function() {

        menuActive("topMenu1", "sideService");

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
        window.location="/bizmapAdmin/analysis/analysisFree";
    }

</script>
