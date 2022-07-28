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

<div class="show_map mobile" style="display: none;">
  <a href="#">
    뜨는업종 지도로 찾기
  </a>
</div>

<!--bottom_pop btp2 pd mobile START-->
<div class="bottom_pop btp2 pd mobile" style="display:none;">
  <div class="pop_body">
    <p class="s_txt">
      <span class="loca">여의동</span> <span>뜨는업종 분석</span></p>
  </div>
  <div class="pop_foot">
    <div class="button_box">
      <button class="btn2">재선택</button>
      <button class="btn1">뜨는업종 보기</button>
    </div>
  </div>
</div>
<!--bottom_pop btp2 pd mobile END-->

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

<!--sheet_01 START--><!--뜨는업종-->
<div class="sheet sheet_03 md_sheet md_up">
  <div class="pop_head">
    <a href="#"></a>
  </div>
  <div class="sheet_body has_mapshow">
    <div class="onlypc close rt_close">
      <a href="#"></a>
    </div>
    <div class="box txt_bx">
      <div class="pd">
        <p class="main_txt">여의동  뜨는업종 TOP 5</p>
        <p class="sub_txt">
          매출과 점포수로 확인하는 지금 뜨는 업종
        </p>
      </div>
      <div class="slide_tag_box pd" style="padding-right: 0;" id="top5">

      </div>
    </div>
    <div class="box select_bx">
      <div class="section pd">
        <div class="section_txt">
          <p class="main_tt">
            각 업종별 뜨는 업종 순위
          </p>
          <p class="sub_tt refer">
            순위 측정 기준
          </p>
        </div>
        <div class="slide_tag_box kind_sli_box">
          <ul class="cb slide_tag kind_sli between2">
            <li class="fl tag on" data-val="sale">
              <a href="#">
                매출 증가 업종
              </a>
            </li>
            <li class="fl tag" data-val="store">
              <a href="#">
                점포수 증가 업종
              </a>
            </li>
          </ul>
        </div>
        <div class="card_box">
          <div class="col card1" id="top5Card">
            <div class="card_header cb">
              <div class="card_header_tt">
                <p class="card_s_txt">영등포구 여의동</p>
                <p class="card_m_txt">점포수 증가업종 TOP 5</p>
              </div>
            </div>
            <div class="card_body">
              <ul id="cardBoxTop5">

              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="section pd last">
        <div class="section_txt">
          <p class="main_tt">
            전체 뜨는 업종 순위
          </p>
          <p class="sub_tt refer">
            순위 측정 기준
          </p>
        </div>

        <div class="slide_tag_box kind_sli_box">
          <ul class="cb slide_tag kind_sli">
            <li class="fl tag on">
              <a href="#" data-val="Q">
                음식
              </a>
            </li>
            <li class="fl tag">
              <a href="#" data-val="D">
                소매/유통
              </a>
            </li>
            <li class="fl tag">
              <a href="#" data-val="F">
                생활서비스
              </a>
            </li>
            <li class="fl tag">
              <a href="#" data-val="O">
                여가/오락
              </a>
            </li>
            <li class="fl tag">
              <a href="#" data-val="R">
                학문/교육
              </a>
            </li>
            <li class="fl tag last">
              <a href="#" data-val="S">
                의료/건강
              </a>
            </li>
          </ul>
        </div>
        <div class="slider slider2">
          <div class="wrap">
            <div class="frame centered" >
              <div class="grid row rising">
                <div class="col element-item idx-1 card1">
                  <div class="card_header cb">
                    <p class="card_s_txt">1위 &#129351;</p>
                    <p class="card_m_txt">노래방</p>
                    <p class="card_number"><span class="up">10.9%</span></p>
                  </div>
                  <div class="card_body">
                    <div class="button_box">
                      <button class="btn2">보고서생성</button>
                    </div>
                  </div>
                </div>
                <div class="col element-item idx-2 card1">
                  <div class="card_header cb">
                    <p class="card_s_txt">2위 &#129352;</p>
                    <p class="card_m_txt">일반유흥주점</p>
                    <p class="card_number"><span class="up">10.9%</span></p>
                  </div>
                  <div class="card_body">
                    <div class="button_box">
                      <button class="btn2">보고서생성</button>
                    </div>
                  </div>
                </div>
                <div class="col element-item idx-3 card1">
                  <div class="card_header cb">
                    <p class="card_s_txt">3위 &#129353;</p>
                    <p class="card_m_txt">호프/맥주</p>
                    <p class="card_number"><span class="up">10.9%</span></p>
                  </div>
                  <div class="card_body">
                    <div class="button_box">
                      <button class="btn2">보고서생성</button>
                    </div>
                  </div>
                </div>
                <div class="col element-item idx-4 card1">
                  <div class="card_header cb">
                    <p class="card_s_txt">4위</p>
                    <p class="card_m_txt">빠/카페</p>
                    <p class="card_number"><span class="up">10.9%</span></p>
                  </div>
                  <div class="card_body">
                    <div class="button_box">
                      <button class="btn2">보고서생성</button>
                    </div>
                  </div>
                </div>
                <div class="col element-item idx-5 card1">
                  <div class="card_header cb">
                    <p class="card_s_txt">5위</p>
                    <p class="card_m_txt">닭갈비 전문</p>
                    <p class="card_number"><span class="up">10.9%</span></p>
                  </div>
                  <div class="card_body">
                    <div class="button_box">
                      <button class="btn2">보고서생성</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="sheet_ft"></div>
</div>
<!--sheet_01 END--><!--뜨는업종-->

<!--only_pc pc_sheet START-->
<div class="pc_sheet onlypc location on" id="pc_sheet">
  <a class="handle" href="#" id="handle"></a>
  <div style="overflow-y: auto;">
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
        <button class="btn1">뜨는업종 보기</button>
      </div>
    </div>
  </div>
</div>
<!--only_pc pc_sheet END-->

<!-- script for slider -->

<script type="text/javascript">


  var saleRnk;
  var storeRnk;
  var saleRnkTop5 = [];
  var storeRnkTop5 = [];


  $(document).ready(function (){

    $(".section.pd.last").find(".cb.slide_tag.kind_sli").find('a').on('click', function (){
      console.log($(this).data('val'));
    });

    $(".cb.slide_tag.kind_sli.between2 > li").on('click', function (){
      $(".cb.slide_tag.kind_sli.between2 > li").removeClass('on');
      $("#top5Card").removeClass('card1');
      $("#top5Card").removeClass('card2');
      $(this).addClass('on');
      ($(this).data('val') == "sale") ? top5(saleRnkTop5, $(this).data('val')) : top5(storeRnkTop5, $(this).data('val'));
      ($(this).data('val') == "sale") ? $("#top5Card").addClass('card1') : $("#top5Card").addClass('card2');

    });

  });

  function init(){
    console.log("--------------");
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
    var $grid = $('.grid.rising').isotope({
      itemSelector: '.element-item',
      layoutMode: 'fitRows',
      percentPosition: true,
      masonry: {
        columnWidth: '.element-item'
      }
    });

    $grid.on( 'layoutComplete', onAnimationFinished );
  }


  function onAnimationFinished(){
    $frame.sly('reload');
  }

  function fn_risingContentsList(response){
    saleRnkTop5 = [];
    storeRnkTop5 = [];
    saleRnk = response;
    storeRnk = response;

    saleRnk = saleRnk.sort(function (a, b) { return a.saleRnk - b.saleRnk; });
    saleRnk.forEach(function (val, int){
      if(int > 4){
        return false;
      }
      saleRnkTop5.push(val);
    });

    storeRnk = storeRnk.sort(function (a, b) {return a.storeRnk - b.storeRnk;});
    storeRnk.forEach(function (val, int){
      if(int > 4){
        return false;
      }
      storeRnkTop5.push(val);
    });

    top5(saleRnkTop5, "sale");
  }

  // 매출증가, 점포수 증가 top5 목록
  function top5(response, gubun){
    for(var i=0; i<response.length;i++){
      response[i].persent = (gubun == "sale") ? response[i].salePercnt : response[i].storePercnt;
      response[i].rank = (gubun == "sale") ? response[i].saleRnk : response[i].storeRnk;
    }
    var template = $('#tmp_top5').html();
    var templateScript = Handlebars.compile(template);
    var context = response;
    var html = templateScript(context);
    $('#top5').html(html);

    var template = $('#tmp_cardBoxTop5').html();
    var templateScript = Handlebars.compile(template);
    var context = response;
    var html = templateScript(context);
    $('#cardBoxTop5').html(html);

    init();
  }

</script>

<script type="text/x-handlebars_template" id="tmp_top5">
  {{#each this}}
    <div class="slide_tag ct">
      <div class="tag">
        &#129351; {{upjong3Nm}}
      </div>
    </div>
  {{/each}}
</script>

<script type="text/x-handlebars_template" id="tmp_cardBoxTop5">
  {{#each this}}
    <li class="cb"><p><span class="color">{{rank}}</span></p><p>{{upjong3Nm}}</p><p><span class="{{upAndDownClass persent}}">{{addComma persent}}%</span></p></li>
  {{/each}}
</script>