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
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover">
    <!-- css 모음 -->
    <%@ include file="/WEB-INF/views/bizmap/include/head.jsp" %>

    <!-- echart -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/echarts@5.3.2/dist/echarts.min.js"></script>
    <%@ include file="/WEB-INF/views/bizmap/include/script.jsp" %>
<script>

</script>
<title>고객지원</title>
</head>

<body class="pc_st static">
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
    <!--bottom popup시, middle_popup 시 모달 modal START-->
    <div class="modal modal2"></div>
    <!--modal END-->

    <!--ㅡmenu_top-->
    <div class="menu_top pd onlypc">
        <div class="menu_left">
            <div class="logo_box">
                <a href="index.html"></a>
            </div>
            <p class="navi_text onlypc">고객지원</p>
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

    <!--sheet_02 START-->
    <div class="sheet sheet_05 full_sheet support" style="z-index: 5;">
        <div class="sheet_hd wh pd">
            <div class="ico_box back">
                <a href="index.html"></a>
            </div>
            <div class="name_box">
                고객지원
            </div>
            <div id="menuToggle">
                <a href="#"></a>
            </div>
        </div>
        <div class="sheet_body">
            <div class="hd_banner">
                <div class="box txt_bx notice nt1 banner">
                    <img src="resource/images/banner/banner2.png" alt="">
                </div>
            </div>
            <div class="pc_flex">
                <div class="sheet_ul_box">
                    <div class="ul_inner pd">
                        <ul class="sheet_ul">
                            <li class="on"><a href="javascript:;" data-tabIndex="0">공지사항</a></li>
                            <li><a href="javascript:;" data-tabIndex="1">FAQ</a></li>
                            <li><a href="javascript:;" data-tabIndex="2">상담게시판</a></li>
                        </ul>
                        <ul class="pd sheet_ul2 onlymb">
                            <li class="on" data-gubun="1"><a href="#">서비스관련</a></li>
                            <li data-gubun="2"><a href="#">회원가입</a></li>
                            <li data-gubun="3"><a href="#">결제관련</a></li>
                        </ul>
                    </div>
                </div>

                <!-- 공지사항 -->
                <div class="container pd" id="tabNoticeList">
                    <div class="onlypc">
                        <p class="title_tag">
                            공지사항
                            <span class="gray"></span>
                        </p>
                    </div>
                    <table>
                        <colgroup>
                            <col width="7%">
                            <col width="60%">
                            <col width="7%">
                            <col width="15%">
                            <col width="7%">
                            <col width="5%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>등록자</th>
                            <th>등록일</th>
                            <th>조회수</th>
                            <th>첨부파일</th>
                        </tr>
                        </thead>
                        <tbody id="tbodyNoticeList">
                        </tbody>
                    </table>
                    <div>
                        <div class="dataTables_paginate paging_full_numbers" id="paginate_notice"></div>
                    </div>
                </div>
                <div id="noticeDetail" style="display: none;">
                    <span>공지사항 내용</span>
                    <div id="noticeDetailContents">

                    </div>
                </div>

                <!-- faq -->
                <div class="container pd" id="tabFaqList" style="display: none;width: 100%;">
                    <div class="onlypc">
                        <p class="title_tag">
                            FAQ
                            <span class="gray"> | 자주묻는 질문을 확인해보세요</span>
                        </p>
                    </div>
                    <div class="onlypc">
                        <ul class="pd sheet_ul2">
                            <li class="on" data-gubun="1"><a href="#">서비스관련</a></li>
                            <li data-gubun="2"><a href="#">회원가입</a></li>
                            <li data-gubun="3"><a href="#">결제관련</a></li>
                        </ul>
                    </div>
                    <div class="accordion section last">
                        <div class="accordion-item">
                            <button id="accordion-button-1" aria-expanded="false">
                                <span class="accordion-title">쿠폰은 어떻게사용하나요?</span>
                                <span class="icon" aria-hidden="true"></span>
                            </button>
                            <div class="accordion-content">
                                <p>
                                    1. 지도화면 오른쪽 하단에 있는 상세보고서를 클릭해주세요.<br />
                                    2. 로그인을 진행해주세요. 비회원이시라면 회원가입 후 이용해주세요.<br />
                                    3. 지도화면에서 원하시는 지역, 영역, 업종을 선택하신 후 결제 페이지로 이동해주세요.<br />
                                    4. 결제 페이지 하단에 위치한 쿠폰등록/사용 버튼을 클릭하신 후 쿠폰번호를 입력해 주세요.(대소문자 구분)<br />
                                    이벤트나 관리자용으로 발급받으신 분들은 쿠폰이 미리 생성되어 있습니다.<br />
                                    5. 쿠폰 등록하기를 클릭하시면 해당업종과 지역에 대한 상세보고서가 화면에 출력됩니다.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 상담 게시판 -->
                <div class="container pd" id="tabConsultingList" style="display: none;width: 100%;">
                    <div class="onlypc">
                        <p class="title_tag">
                            상담게시판
                            <span class="gray"></span>
                        </p>
                    </div>
                    <table>
                        <colgroup>
                            <col width="7%">
                            <col width="60%">
                            <col width="7%">
                            <col width="15%">
                            <col width="7%">
                            <col width="5%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>처리상태</th>
                            <th>작성일</th>
                            <th>조회수</th>
                        </tr>
                        </thead>
                        <tbody id="tbodyConsultingList">
                        </tbody>
                    </table>
                    <div>
                        <div class="dataTables_paginate paging_full_numbers" id="paginate_consulting"></div>
                    </div>
                    <input type="text" id="password">
                    <button id="editConsulting" onclick="editConsulting(0);">글쓰기</button>
                </div>

                <!-- 등록 / 수정 -->
                <div id="consultingEdit" style="display: none;width: 100%;">
                    <span>상담 내용</span>
                    <div id="consultingEditContents">
                    </div>
                </div>

                <!-- 상세 내용 조회 -->
                <div id="consultingDetail" style="display: none;width: 100%;">
                    <span>상담 내용</span>
                    <div id="consultingDetailContents">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--sheet_02 END-->
</body>
</html>

<script type="text/javascript">

    var pagingInfo = {
        totalCnt : 0
        , pageNo : 1
        , pageCnt : 10
    };
    var strBoardDtlNo;
    var strMemNo;

    $(function (){

        $(".onlypc > .pd.sheet_ul2 > li").on('click', function (){
            $(".onlypc > .pd.sheet_ul2 > li").removeClass('on');
            $(this).addClass('on');
            getFaq($(this).data('gubun'));
        });

        // $(".onlymb > .pd.sheet_ul2 > li").on('click', function (){
        //     $(".onlypc > .pd.sheet_ul2 > li").removeClass('on');
        //     $(this).addClass('on');
        //     getFaq($(this).data('gubun'));
        // });

        getNotice();

    });

    function supportReset(){
        $("#tabNoticeList").hide();
        $("#noticeDetail").hide();
        $("#tabFaqList").hide();
        $("#tabConsultingList").hide();
        $("#consultingDetail").hide();
        $("#consultingEdit").hide();
    }


    function fn_error(response) {
        console.log(response);
        console.log('error');
        alert(response.message);
    }

    // 공지사항 -------------------------------------
    function getNotice(){
        var param = {
            pageNo : (((pagingInfo.pageNo == 0) ? 1 : pagingInfo.pageNo-1) * pagingInfo.pageCnt)
            , pageCnt : pagingInfo.pageCnt
        };
        getAjax("getNotice", "/bizmap/notice/getNotice", param, fn_succ_getNotice, fn_error);
    }

    function fn_succ_getNotice(id,response,param){

        var template = $('#tmp_tbodyNoticeList').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data.notice;
        var html = templateScript(context);
        $('#tbodyNoticeList').html(html);

        pagingInfo.totalCnt = response.data.notice[0].totalRowCount;
        util.renderPagingNavigation('paginate_notice', pagingInfo);
        pagingInfo.pageNo=1;

        (pagingInfo.totalCnt < 1) ? $("#paginate_notice").hide() : $("#paginate_notice").show();
    }

    function getNoticeDetail(notice){
        var param = {
            boardDtlNo:notice.data('boarddtlno')
        };
        getAjax("getNoticeDetail", "/bizmap/notice/getNotice", param, fn_succ_getNoticeDetail, fn_error);
    }

    function fn_succ_getNoticeDetail(id, response, param){
        var template = $('#tmp_noticeDetail').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);
        $('#noticeDetailContents').html(html);

        supportReset();
        $("#noticeDetail").show();
    }

    function noticeBack(){
        getNotice();
        supportReset();
        $("#tabNoticeList").show();
    }

    // 공지사항 끝 ------------------------------------------------

    // faq 시작 --------------------------------------------------
    function getFaq(gubun){
        param = {
            boardNo: 3
            , gubun : gubun   // 1 서비스, 2 회원 , 3 결제관련
        };
        getAjax("getFaq", "/bizmap/faq/getFaq", param, fn_succ_getFaq, fn_error);
    }

    function fn_succ_getFaq(id,response,param){
        var template = $('#tmp_faqList').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);
        $('.accordion.section.last').html(html);

        $('button[id^="accordion-button-"]').on('click', function (){
            $('button[id^="accordion-button-"]').each(function (){
                $(this).attr("aria-expanded", false);
            });
            $("#"+$(this).attr('id')).attr("aria-expanded", true);
        });
    }
    // faq 끝 --------------------------------------------------


    // 상담게시판 -------------------------------------
    function getConsulting(){
        var param = {
            pageNo : (((pagingInfo.pageNo == 0) ? 1 : pagingInfo.pageNo-1) * pagingInfo.pageCnt)
            , pageCnt : pagingInfo.pageCnt
        };
        getAjax("getConsulting", "/bizmap/consulting/getConsulting", param, fn_succ_getConsulting, fn_error);
    }

    function fn_succ_getConsulting(id,response,param){

        console.log(response);
        var template = $('#tmp_tbodyConsultingList').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data.consulting;
        var html = templateScript(context);
        $('#tbodyConsultingList').html(html);

        pagingInfo.totalCnt = response.data.consulting[0].totalRowCount;
        util.renderPagingNavigation('paginate_consulting', pagingInfo);
        pagingInfo.pageNo=1;

        (pagingInfo.totalCnt < 1) ? $("#paginate_notice").hide() : $("#paginate_notice").show();
    }

    function handlebarsPaging(targetId, pagingInfo){
        pagingInfo = pagingInfo;
        if(targetId == "paginate_notice"){
            getNotice();
        }else if(targetId == "paginate_consulting"){
            getConsulting();
        }
    }

    function getConsultingDetail(consulting, passwordSw){
        if(passwordSw == "Y"){
            var param = {
                boardDtlNo:consulting.data('boarddtlno')
                , password:$("#password").val()
            };
            getAjax("getConsultingDetail", "/bizmap/consulting/getConsulting", param, fn_succ_getConsultingDetail, fn_error);
        }else{
            var param = {
                boardDtlNo:consulting.data('boarddtlno')
            };
            getAjax("getConsultingDetail", "/bizmap/consulting/getConsulting", param, fn_succ_getConsultingDetail, fn_error);
        }
    }

    function fn_succ_getConsultingDetail(id, response, param){
        console.log(response);
        if(response.code == "C010"){
            alert('비밀번호가 틀렸습니다.');
            return;
        }
        var template = $('#tmp_consultingDetail').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);
        $('#consultingDetailContents').html(html);

        supportReset();
        $("#consultingDetail").show();

        console.log(response.data.consulting[0].contents);
        console.log(common.replaceHtml(response.data.consulting[0].contents));

        response.data.attach.forEach(function(val, idx){
            var fileDownLoadUrl = '/bizmap/common/fileDownLoad?filePath=' + val.filePath + '&fileName=' +val.fileNm + '&orgFileNm=' + val.orgFileNm;
            $("#fileDownLoad").attr('href', fileDownLoadUrl);
        });

    }

    function consultBack(){
        getConsulting();
        supportReset();
        $("#tabConsultingList").show();
    }

    function editConsulting(boardDtlNo) {

        var data = {};
        var template = $('#tmp_consultingEdit').html();
        var templateScript = Handlebars.compile(template);
        var context = data;
        var html = templateScript(context);
        $('#consultingEditContents').html(html);

        util.editorInit();
        supportReset();
        $("#consultingEdit").show();

        $("input[name=check]").on('change', function(){
            $(this).prop('checked') ? $("#passwordText").attr('disabled', false) :  $("#passwordText").attr('disabled', true);
        });

    }

    function isVaild(){
        if(common.isEmpty($("#title").val())){
            alert('제목을 입력해 주세요.');
            return false;
        }
        if(common.isEmpty($("#content").summernote('code'))){
            alert('내용을 입력해 주세요.');
            return false;
        }
        if($("input[name=check]").prop('checked')){
            if(common.isEmpty($("#passwordText").val())){
                alert('비밀번호를 입력해 주세요');
                return false;
            }
        }
        return true;
    }
    function setConsult(){
        if(isVaild()){
            var contents = $("#content").summernote('code');

            var param = {
                subject : $("#title").val()
                , contents : contents
                , passwordYn : $("input[name=check]").prop('checked') ? "Y" : "N"
                , password : $("#passwordText").val()
                , password : $("#passwordText").val()
                , memNo : 9999999999
                , loginId : 'test'
                , boardNo : 1
            };

            console.log(param);
            getAjax("getConsultingDetail", "/bizmap/consulting/setConsulting", param, fn_succ_setConsultingDetail, fn_error);
        }
    }

    function fn_succ_setConsultingDetail(id, response){
        // 정상일때 파일이 있는 경우 파일 업로드 처리
        strBoardDtlNo = response.data.boardDtlNo;
        strMemNo = response.data.memNo;
        if(response.message == "success"){
            var fileCheck = document.getElementById("uploadFile").value;
            if(!common.isEmpty(fileCheck)){
                // 파일 업로드 공통 호출
                var form = $("#fileUploadForm")[0];
                var formData = new FormData(form);

                $.ajax({
                    cache : false,
                    url : "/bizmap/common/file/upload",
                    processData: false,
                    contentType: false,
                    type : 'POST',
                    data : formData,
                    async : true,
                    success : function(response) {
                        response = JSON.parse(response);
                        if(response.message == "success"){
                            console.log("파일업로드 성공");
                            setAttachInfo(response);
                        }else{
                            // 등록에러
                            alert("파일 업로드 실패");
                        }
                    },
                    error : function(xhr, status) {
                        alert("파일 업로드 실패\n" + xhr + " : " + status);
                    }
                });
            }else{
                $('.ul_inner.pd > .sheet_ul > li > a').click();
            }
        }else{
            alert('등록 실패[관리자에게 문의]');
        }
    }


    // 게시글 파일 업로드 정보 등록
    function setAttachInfo(response){
        var param = {
            idx : strBoardDtlNo
            , memNo : strMemNo
            , fileNm : response.data.fileName
            , filePath : response.data.filePath
            , orgFileNm : response.data.original
        };
        getAjax("setAttachInfo", "/bizmap/consulting/setAttachInfo", param, fn_succ_setAttachInfo, fn_error);

    }

    function fn_succ_setAttachInfo(id, response){
        if(response.message!="success"){
            alert('파일 정보 등록 오류');
            return;
        }
        // 목록 재조회
        $('.ul_inner.pd > .sheet_ul > li > a').click();
    }

</script>

<script type="text/x-handlebars_template" id="tmp_tbodyNoticeList">
    {{#each this}}
    <tr>
        <td>{{rowNum}}</td>
        <td style="cursor:pointer;" data-boardDtlNo="{{boardDtlNo}}" onclick="getNoticeDetail($(this));">
            {{{replaceHtml subject}}}
        </td>
        <td>{{adminNm}}</td>
        <td>{{updDt}}</td>
        <td>{{queryCnt}}</td>
        <td>
            {{#ifCond attachCnt '>' 0}}
                첨부파일있음
            {{/ifCond}}
        </td>
    </tr>
    {{/each}}
</script>

<script type="text/x-handlebars_template" id="tmp_noticeDetail">
    <table>
        {{#each this.notice}}
        <tr>
            <td colspan="3">{{replaceHtml subject}}</td>
        </tr>
        <tr>
            <td>{{adminNm}}</td>
            <td>{{queryCnt}}</td>
            <td>{{updDt}}</td>
        </tr>
        <tr>
            <td colspan="3">
                {{{replaceHtml contents}}}
            </td>
        </tr>
    {{/each}}
    </table>
    <div>
        {{#each this.attach}}
            <span></span>
        {{/each}}
    </div>
    <button id="noticeBack" onclick="noticeBack();">목록보기</button>
</script>

<script type="text/x-handlebars_template" id="tmp_faqList">
    {{#each this}}
    <div class="accordion-item">
        <button id="accordion-button-{{boardDtlNo}}" aria-expanded="false">
            <span class="accordion-title">{{{replaceHtml subject}}}</span>
            <span class="icon" aria-hidden="true"></span>
        </button>
        <div class="accordion-content">
            {{{replaceHtml contents}}}
        </div>
    </div>
    {{/each}}
</script>


<script type="text/x-handlebars_template" id="tmp_tbodyConsultingList">
    {{#each this}}
    <tr>
        <td>{{contentIdx}}</td>
        <td style="cursor:pointer;" data-boardDtlNo="{{boardDtlNo}}" onclick="getConsultingDetail($(this), {{#ifCond password '!=' ''}} 'Y' {{else}} 'N' {{/ifCond}} );">
            {{{replaceHtml subject}}}
        </td>
        <td>{{memNm}}</td>
        <td>
            {{#ifCond depth '>' 0}}
                &nbsp;
            {{else}}
                {{#ifCond reCnt '>' 1}}
                    답변완료
                {{else}}
                    처리중
                {{/ifCond}}
            {{/ifCond}}
        </td>
        <td>{{crtDt}}</td>
        <td>{{queryCnt}}</td>
    </tr>
    {{/each}}
</script>

<script type="text/x-handlebars_template" id="tmp_consultingDetail">
    <table>
        {{#each this.consulting}}
        <tr>
            <td colspan="3">{{{replaceHtml subject}}}</td>
        </tr>
        <tr>
            <td>{{adminNm}}</td>
            <td>{{queryCnt}}</td>
            <td>{{updDt}}</td>
        </tr>
        <tr>
            <td colspan="3">
                {{{replaceHtml contents}}}
            </td>
        </tr>
        {{/each}}
    </table>
    <div>
        {{#each this.attach}}
        <span><a id="fileDownLoad">{{orgFileNm}}</a></span>
        {{/each}}
    </div>
    <div class="base">
        <button class="btn" onclick="consultBack();">목록보기</button>
<%--        {{#each this.consulting}}--%>
<%--        <button class="btn" data-boardDtlNo={{boardDtlNo}} onclick="editConsulting($(this).data('boarddtlno'));">수정</button>--%>
<%--        {{/each}}--%>
    </div>
</script>

<script type="text/x-handlebars_template" id="tmp_consultingEdit">
    <div class="base">
        <span>등록자 | </span>
        <span></span>
    </div>
    <div class="base">
        <span>제목 </span>
        <input id="title" type="text" title="제목입력 란" placeholder="제목입력">
    </div>
    <div>
        <textarea class="_editor" id="content" name="content"></textarea>
    </div>

    <form name="fileUploadForm" id="fileUploadForm" method="POST" enctype="multipart/form-data">
        <input type="file" id="uploadFile" name="uploadFile">
        <input type="hidden" name="memNo" id="memNo">
        <input type="hidden" name="idx" id="idx">
    </form>

    <div class="base">
        <label class="chk_box fl" for="check"><strong>비밀글</strong>
            <input type="checkbox" name="check" id="check">
            <span class="checkmark" data-check="Y"></span>
        </label>
        <input id="passwordText" type="password" title="비밀번호" placeholder="비밀번호" disabled>
        <button class="btn" onclick="setConsult();">등록</button>
        <button class="btn" onclick="consultBack();">목록보기</button>
    </div>

</script>
