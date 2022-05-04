<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String scriptRandom = Integer.toString((int) (Math.random() * 1000000));
%>
<!-- BEGIN: Head-->
<div id="fade" class="black_background"></div>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

    <link href="/resources/assets/bizmap/images/favicon.png" rel="icon" type="image/png" />

    <!-- lib (변동 없는 js)-->

    <!-- lib (변동 있는 css)-->
    <link rel="stylesheet" type="text/css" href="/resources/assets/bizmap/css/reset.css?<%=scriptRandom%>">
    <link rel="stylesheet" type="text/css" href="/resources/assets/bizmap/css/style.css?<%=scriptRandom%>">
    <link rel="stylesheet" type="text/css" href="/resources/assets/bizmap/css/style_m.css?<%=scriptRandom%>">

</head>
<!-- END: Head-->