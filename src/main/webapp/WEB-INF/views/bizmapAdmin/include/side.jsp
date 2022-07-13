<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="sidebar">
    <div class="side-nav" id="member">
        <div class="side-nav-header">
            <p>회원관리</p>
        </div>
        <div class="side-nav-body">
            <ul>
                <li class="sideMenu on" id="sideMember1" data-url="/bizmap/admin/member/member1"><button>회원현황</button></li>
                <li class="sideMenu" id="sideMember2" data-url="/bizmap/admin/member/member2"><button>서비스 신청내역</button></li>
                <li class="sideMenu" id="sideMember3"><button>상권분석 이용내역</button></li>
                <li class="sideMenu" id="sideMember4"><button>입추/업추 이용내역</button></li>
                <li class="sideMenu" id="sideMember5"><button>사업자 회원현황</button></li>
                <li class="sideMenu" id="sideMember6"><button>사업자 서비스 신청내역</button></li>
                <li class="sideMenu" id="sideMember7"><button>사업자 상권분석 이용내역</button></li>
                <li class="sideMenu" id="sideMember8"><button>사업자 입추/업추 이용내역</button></li>
                <li class="sideMenu" id="sideMember9"><button>제휴사 서비스 신청내역</button></li>
                <li class="sideMenu" id="sideMember10"><button>제휴사 입추/업추 이용내역</button></li>
            </ul>
        </div>
    </div>

    <div class="side-nav" id="contents" style="display: none">
        <div class="side-nav-header">
            <p>컨텐츠관리</p>
        </div>
        <div class="side-nav-body">
            <ul>
                <li class="sideMenu on" id="sideContents1" data-url="/bizmap/admin/contents/contents1"><button>전문가보고서</button></li>
                <li class="sideMenu">창업정보관리</li>
                <li class="sideMenu sub" id="sideContents2" data-url="/bizmap/admin/contents/contents2"><button>창업뉴스</button></li>
                <li class="sideMenu sub" id="sideContents3"><button>창업지식</button></li>
                <li class="sideMenu sub" id="sideContents4"><button>창업영상</button></li>
                <li class="sideMenu sub" id="sideContents5"><button>창업아이템</button></li>
            </ul>
        </div>
    </div>
</div>
