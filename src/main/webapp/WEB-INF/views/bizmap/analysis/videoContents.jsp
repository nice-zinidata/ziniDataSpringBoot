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

<!--bottom_pop btp1 pd mobile START-->
<div class="bottom_pop btp2 pd mobile" style="display:none;">
  <div class="pop_body">
    <p class="s_txt">
      <span class="loca">여의동</span> <span>영상콘텐츠 분석</span></p>
  </div>
  <div class="pop_foot">
    <div class="button_box">
      <button class="btn2">재선택</button>
      <button class="btn1">유동인구 보기</button>
    </div>
  </div>
</div>
<!--bottom_pop btp1 pd mobile END-->

<!--sheet_01 START--><!--분석지역-->
<div class="sheet sheet_01 md_sheet">
  <div class="sheet_hd pd">
    <div class="ico_box back">
      <a href="#">
      </a>
    </div>
    <div class="name_box">
      지역 선택
    </div>
    <div class="close_box">
      <a href="">
      </a>
    </div>
  </div>
  <div class="sheet_body pd">
    <div class="box txt_bx">
      <p class="main_txt">분석하고자 하는<br/>
        지역을 선택해주세요.</p>
      <p class="sub_txt">
        <span class="loca">지역선택</span>
        <!-- <span class="bar">|</span>
        <span class="kind">업종선택</span> -->
      </p>
    </div>
    <div class="box select_bx">
      <div class="cate_loca">
        <div class="loca_crumble_box">
          <ul class="loca_crumble">
            <li class="on">시/도</li>
            <li>시/군/구</li>
            <li>읍/면/동</li>
          </ul>
        </div>
        <div class="loca_list_bx">
          <ul class="loca_list cb">
            <li class="on"><a href="#">서울특별시</a></li>
            <li><a href="#">대구광역시</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="sheet_ft"></div>
</div>
<!--sheet_01 END--><!--분석지역-->

<!--sheet_04 START--><!--영상콘텐츠-->
<div class="sheet sheet_04 md_sheet md_up">
  <div class="pop_head">
    <a href="#"></a>
  </div>
  <div class="sheet_body has_mapshow">
    <div class="box txt_bx pd">
      <div class="">
        <p class="main_txt">나이스비즈맵 영상콘텐츠</p>
        <p class="sub_txt">
          영상을 통해 쉽고 재미있게 알아보는 상권정보
        </p>
      </div>
      <div class="mini_select_box cb">
        <div class="item fl">
          <select class="select" id="filter1">
            <option value="">지역 <span class="col">전체</span></option>
            <option value="">서울</option>
          </select>
        </div>
        <div class="item fl">
          <select class="select" id="filter2">
            <option value="0">분류 <span class="col">전체</span></option>
            <option value="1">지역</option>
            <option value="2">업종</option>
          </select>
        </div>
        <div class="item fl">
          <select class="select" id="filter3">
            <option value="0">최신순</option>
            <option value="1">인기순</option>
          </select>
        </div>
      </div>
    </div>
    <div class="box select_bx" id="videoContentList">
    </div>
  </div>
</div>
<!--sheet_04 END--><!--영상콘텐츠-->

<div class="pc_sheet onlypc location">
  <div class="pc_hd">
    <div class="tag_txt">
      <p class="sub_txt">
        <span>현 위치</span>
      </p>
      <div class="map_place_box">
        <a href="#">
          <input type="text" id="" name="show" placeholder="여의동" readonly>
        </a>
      </div>
    </div>
  </div>
  <div class="pc_bdy ticket">
    <div class="tag_txt">
      <p class="sub_txt">
        <span>분석 지역 선택</span>
      </p>
    </div>
    <div class="middle">
      <ul>
        <li><a href="#">분석 지역을 선택해주세요</a></li>
      </ul>
    </div>
    <div class="button_box">
      <button class="btn2">다시선택</button>
      <button class="btn1">영상콘텐츠 보기</button>
    </div>
  </div>
</div>

<script>
  <!-- script for slider -->
  var $frame = $('.centered');
  var $wrap  = $frame.parent();

  // Call Sly on frame
  $frame.sly({
    horizontal: 1,
    itemNav: 'centered',
    smart: 1,
    //activateOn: 'click',
    mouseDragging: 1,
    touchDragging: 1,
    releaseSwing: 1,
    startAt: 4,
    scrollBy: 1,
    speed: 300,
    elasticBounds: 1,
    easing: 'easeOutExpo',
    dragHandle: 1,
    dynamicHandle: 1,
    clickBar: 1,

    // Buttons
    prev: $wrap.find('.prev'),
    next: $wrap.find('.next')
  });

    // init Isotope
  var $grid = $('.grid').isotope({
    itemSelector: '.element-item',
    layoutMode: 'fitRows',
    percentPosition: true,
    masonry: {
      columnWidth: '.element-item'
    }
  });

  function onAnimationFinished(){
    $frame.sly('reload');
  }


  $grid.on( 'layoutComplete', onAnimationFinished );
</script>
<!-- script for slider -->

<script type="text/javascript">

  var filter1 = "0";
  var filter2 = "0";
  var filter3 = "0";

  $(function (){

    // 영상 등록된 지역 필터 목록 조회
    param = {};
    getAjax("features", "/bizmap/youTube/getArea", param, fn_succ_getVideoMega, fn_error);

    $('#filter1').on('change', function() {
      $('#filter2').val(0);
      filter2 = 0;
      filter1 = $(this).val();
      filter();
    });

    $('#filter2').on('change', function() {
      $('#filter1').val(0);
      filter1 = 0;
      filter2 = $(this).val();
      filter();
    });

    $('#filter3').on('change', function() {
      filter3 = $(this).val();
      filter();
    });

  });

  function filter(){
    var data = {
      filter1 : filter1
      ,filter2 : filter2
      ,filter3 : filter3
    }
    getAjax("getYouTube", "/bizmap/youTube/getYouTube", data,
            function (id, response, param){
              fn_videoContentsList(response)
            }
            , fn_error, "POST", false);
  }

  function fn_videoContentsList(response){

    var template = $('#tmp_videoContentList').html();
    var templateScript = Handlebars.compile(template);
    var context = response.data;
    var html = templateScript(context);
    $('#videoContentList').html(html);


    if(widthCheck() == "PC"){
    }
  }

  function fn_succ_getVideoMega(id, response, param){
    var template = $('#tmp_filter1').html();
    var templateScript = Handlebars.compile(template);
    var context = response.data;
    var html = templateScript(context);
    $('#filter1').html(html);
  }

</script>

<script type="text/x-handlebars_template" id="tmp_filter1">
  <option value="0">지역 <span class="col">전체</span></option>
  {{#each this}}
  <option value="{{megaCd}}">{{megaNm}}</option>
  {{/each}}
</script>

<script type="text/x-handlebars_template" id="tmp_videoContentList">
  {{#each this}}
  <div class="section pd">
    <div class="card_con" id="video_{{youtubeNo}}">
      <div class="con_header pd cb">
        <div class="thumb fl"></div>
        <div class="thumb_txt fl">
          <p class="thumb_main">상권읽어주는 남자</p>
          <p class="thumb_sub">Youtube<span class="gr"> | </span>2020.07.08</p>
        </div>
      </div>
      <div class="con_body">
        <div class="con_title pd">
          <p>{{title}}</p>
        </div>
        <div class="con_thumb">
          <iframe src="{{url}}" title="{{title}}" style="width: 100%" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe>
        </div>
      </div>
      <div class="con_foot pd cb">
        <div class="slide_tag_box">
          <div class="slide_tag">
            <div class="tag">
              {{address}}
            </div>
          </div>
        </div>
        <div class="con_txt">
        </div>
        <div class="action_area fr"><a href="{{url}}" target="_blank">자세히 알아보기</a></div>
      </div>
    </div>
  </div>
  {{/each}}
</script>