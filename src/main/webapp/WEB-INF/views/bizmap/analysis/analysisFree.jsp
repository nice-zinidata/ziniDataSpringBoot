<%--
    PageName    :
    FileName    : analysisFree.jsp
    Description : 나이스비즈맵 인터넷 환경 기본보고서
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
    <title>NICEbizmap 상권분석서비스</title>

    <!-- css 모음 -->
    <%@ include file="/WEB-INF/views/bizmap/include/head.jsp" %>

    <script>
    </script>
    <style>
        html, body {position: relative;}
    </style>
</head>

<body>

<div id="main">
</div>

<div id="map" style="width:100%;height:400px;"></div>

<!-- //dialog -->
</body>


</html>

<!-- js 모읍 -->
<%@ include file="/WEB-INF/views/bizmap/include/script.jsp" %>

<script type="text/javascript">
    $(function() {
        var mapOptions = {
            center: new naver.maps.LatLng(37.3595704, 127.105399),
            zoom: 10
        };

        var map = new naver.maps.Map('map', mapOptions);

        init();
    });


    function init(){
    }


    $(function(){
    });




</script>
