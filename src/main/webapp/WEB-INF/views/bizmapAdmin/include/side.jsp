<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="sidebar">
    <div class="side-nav" id="member">
        <div class="side-nav-header">
            <p>회원관리</p>
        </div>
        <div class="side-nav-body">
            <ul>
                <li class="sideMenu" id="sideMember" data-url="/bizmapAdmin/member/member"><button>회원현황</button></li>
                <li class="sideMenu" id="sideService" data-url="/bizmapAdmin/member/service"><button>서비스 신청내역</button></li>
                <li class="sideMenu"><button>상권분석 이용내역</button></li>
                <li class="sideMenu"><button>입추/업추 이용내역</button></li>
                <li class="sideMenu"><button>사업자 회원현황</button></li>
                <li class="sideMenu"><button>사업자 서비스 신청내역</button></li>
                <li class="sideMenu"><button>사업자 상권분석 이용내역</button></li>
                <li class="sideMenu"><button>사업자 입추/업추 이용내역</button></li>
                <li class="sideMenu"><button>제휴사 서비스 신청내역</button></li>
                <li class="sideMenu"><button>제휴사 입추/업추 이용내역</button></li>
            </ul>
        </div>
    </div>

    <div class="side-nav" id="contents" style="display: none">
        <div class="side-nav-header">
            <p>컨텐츠관리</p>
        </div>
        <div class="side-nav-body">
            <ul>
                <li class="sideMenu" id="sideReport" data-url="/bizmapAdmin/contents/report"><button>전문가보고서</button></li>
                <li class="">창업정보관리</li>
                    <ul>
                        <li class="sub" id="sideNews"><button>창업뉴스</button></li>
                        <li class="sub" id="sideKnowledge"><button>창업지식</button></li>
                        <li class="sub" id="sideVideos"><button>창업영상</button></li>
                        <li class="sub" id="sideItem"><button>창업아이템</button></li>
                    </ul>
            </ul>
        </div>
    </div>
</div>
