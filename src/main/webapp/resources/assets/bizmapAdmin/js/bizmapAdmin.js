$(function() {
   $('#menu_btn > ul > button').on('click', function() {
       menuClickedFunc($(this));
   });
   $('#sidebar .side-nav-body > ul > li').click(function() {
       $('#sidebar .side-nav-body > ul > li').removeAttr('class');
       $(this).addClass('on');
   });
});

// Navbar의 메뉴 클릭 이벤트
function menuClickedFunc(clickedMenu) {
    $('#menu_btn > ul > button').removeAttr('class');
    clickedMenu.addClass('on');

    // 탭 클릭 시 사이드바 변경
    var clicked_menu = clickedMenu.text();
    $('#sidebar .side-nav-header p').text(clicked_menu);

    var menu_no = clickedMenu.attr('id').slice(-1);
    var side_nav_tab = "";
    if(menu_no == 1) {
        side_nav_tab = '<li class="on"><button><a>회원현황</a></button></li>\n' +
            '<li><button><a>서비스 신청내역</a></button></li>\n' +
            '<li><button><a>상권분석 이용내역</a></button></li>\n' +
            '<li><button><a>입추/업추 이용내역</a></button></li>\n' +
            '<li><button><a>사업자 회원현황</a></button></li>\n' +
            '<li><button><a>사업자 서비스 신청내역</a></button></li>\n' +
            '<li><button><a>사업자 상권분석 이용내역</a></button></li>\n' +
            '<li><button><a>사업자 입추/업추 이용내역</a></button></li>\n' +
            '<li><button><a>제휴사 서비스 신청내역</a></button></li>\n' +
            '<li><button><a>제휴사 입추/업추 이용내역</a></button></li>';
    } else if(menu_no == 2) {
        side_nav_tab = '<li class="on"><button><a>전문가 보고서</a></button></li>\n' +
            '<li><button><a>창업정보 관리</a></button></li>\n' +
            '<li class="sub"><button><a>창업뉴스</a></button></li>\n' +
            '<li class="sub"><button><a>창업지식</a></button></li>\n' +
            '<li class="sub"><button><a>창업영상</a></button></li>\n' +
            '<li class="sub"><button><a>창업아이템</a></button></li>';
    } else if(menu_no == 3) {
        side_nav_tab = '<li class="on"><button><a>공지사항</a></button></li>\n' +
            '<li><button><a>상담게시판</a></button></li>\n' +
            '<li><button><a>FAQ</a></button></li>\n' +
            '<li><button><a>이벤트 관리</a></button></li>';
    }
    $('#sidebar .side-nav-body > ul').empty();
    $('#sidebar .side-nav-body > ul').append(side_nav_tab);

    $('#sidebar .side-nav-body > ul > li').click(function() {
        $('#sidebar .side-nav-body > ul > li').removeClass('on');
        $(this).addClass('on');
    });
}