<%--
    PageName    :
    FileName    : index.jsp
    Description : 나이스비즈맵 관리자 페이지
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
    <link href="/bizmap/assets/bizmapAdmin/images/favicon.png" rel="icon" type="image/png" />

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
    <div id="onlyBody">

    </div>
</div>

<!-- //dialog -->
</body>


</html>

<!-- js 모음 -->
<%@ include file="/WEB-INF/views/bizmapAdmin/include/script.jsp" %>

<script type="text/javascript">
    $(function() {
        $("#onlyBody").load("/bizmap/admin/member/member1");
    });

</script>
