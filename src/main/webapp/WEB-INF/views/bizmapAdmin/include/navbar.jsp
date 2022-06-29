<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"><div id="logo_box"></div></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse h-100" id="menu_btn">
            <div class="navbar-nav h-100">
                <button class="nav-link navbar active member" data-url="/bizmapAdmin/member/member1">회원관리</button>
                <button class="nav-link navbar contents" data-url="/bizmapAdmin/contents/contents1">컨텐츠관리</button>
                <button class="nav-link navbar customer">고객지원</button>
                <button class="nav-link navbar statistics">통계관리</button>
                <button class="nav-link navbar user">사용자관리</button>
                <button class="nav-link navbar product">상품관리</button>
            </div>
        </div>
    </div>
</nav>