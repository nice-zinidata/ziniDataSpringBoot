

var strGeoJson = "";
var strAdmiCd = "";
var strAreaNm = "";
var strUpjongCd = "";
var strUpjongNm = "";
var strMenuGugun = "0"; //0:기본보고서, 1:유동인구, 2:밀집도, 3:뜨는업종, 4:영상콘텐츠

var fileInfo = {};

var CENTER
var mapOptions = {};
var map;
var geoJsonArr = []; // 범위 목록
var markers = [];	// 마커 목록

var mousemoveListener;
var clickListener;
var dragendListener;

var fillColor = {
	0: 'rgba(201,201,201,0.84)'
	, 5: '#8500ab80'
	, 4: '#542EC080'
	, 3: '#1F67FD70'
	, 2: '#16b1d370'
	, 1: '#71CEB280'
};
var strokeColor = {
	0: 'rgb(255,255,255)'
	, 5: '#8500ab'
	, 4: '#542EC0'
	, 3: '#1F67FD'
	, 2: '#16b1d3'
	, 1: '#71CEB2'
};
var mouseoverAfterColor = {
	0: 'rgb(89,89,89)'
	, 5: '#8500ab'
	, 4: '#542EC0'
	, 3: '#1F67FD'
	, 2: '#16b1d3'
	, 1: '#71CEB2'
};

var geomClickListener;
var mouseoverListener;
var mouseoutListener;

$( document ).ready(function() {
	CENTER = new naver.maps.LatLng(37.56648, 126.97787);
	mapOptions = {
		center: new naver.maps.LatLng(37.56648, 126.97787),
		zoom: 14,
	};

	map = new naver.maps.Map('map', mapOptions);

	addListener();
});

function addListener(){
	// 지도 마우스 이동
	mousemoveListener = naver.maps.Event.addListener(map, 'mousemove', function (e){
		var zoomStatus = "admiCd";
		// var zoomStatus = ( map.getZoom() >= 14 ) ? "admiCd" : (( map.getZoom() >= 12 && map.getZoom() <= 13 ) ? "ctyCd" : ( map.getZoom() < 11 ) ? "megaCd" : "");
		setFeatures(e.latlng.x, e.latlng.y, zoomStatus, 'move');
	});

	// 지도 클릭
	clickListener = naver.maps.Event.addListener(map, 'click', function (e){
		var zoomStatus = "admiCd";
		// var zoomStatus = ( map.getZoom() >= 14 ) ? "admiCd" : (( map.getZoom() >= 12 && map.getZoom() <= 13 ) ? "ctyCd" : ( map.getZoom() < 11 ) ? "megaCd" : "");
		setFeatures(e.latlng.x, e.latlng.y, zoomStatus, 'click');
	});

	// 지도 드레그 종료
	dragendListener = naver.maps.Event.addListener(map, 'dragend', function (e){
		//유동인구, 밀집도, 뜨는업종에서만 버튼 보이도록
		if(strMenuGugun == 1 || strMenuGugun == 2 || strMenuGugun == 3){
			$(".reserch").css('display','block');
		}
	});

	// 지도 로딩 완료 이벤트
	naver.maps.Event.addListener(map, 'tilesloaded', function (e){
		// 네이버 로고
		$(".map_section > div:nth-child(2)").css('display','none');
		$(".map_section > div:nth-child(3)").css('display','none');
	});
}

function setFeatures(centerx,centery, zoomStatus, gubun){
	var data={
		xAxis: centerx
		, yAxis: centery
		, zoomStatus : zoomStatus
		, gubun : gubun
	}

	getAjax("features", "/bizmap/analysis/admiFeatures", data, fn_succ_features, fn_error, false);
}
function removeListener(){
	naver.maps.Event.removeListener(mousemoveListener);
	naver.maps.Event.removeListener(clickListener);
	// naver.maps.Event.removeListener(dragendListener);
}

function fn_error(response) {
	console.log(response);
	console.log('error');
	alert(response.message);
}

function fn_succ_features(id, response, param){
	if(!common.isEmpty(strGeoJson)) map.data.removeGeoJson(strGeoJson);

	if(common.isEmpty(response.data[0])){
		return;
	}
	strAdmiCd = response.data[0].admiCd;
	strAreaNm = response.data[0].megaNm + " " + response.data[0].ctyNm + " " + response.data[0].admiNm;

	// 메뉴 눌러서 지역선택시 해당 지역으로 이동
	if(!common.isEmpty(param.upjongCd)){
		var bounds = new naver.maps.LatLngBounds(
			new naver.maps.LatLng(response.data[0].miny, response.data[0].minx),
			new naver.maps.LatLng(response.data[0].maxy, response.data[0].maxx));

		map.fitBounds(bounds);
	}

	if(strUpjongNm != "" && strUpjongNm != null){
		$('#search').val(strAreaNm + " / " + strUpjongNm);
	}else{
		$('#search').val(strAreaNm);
	}

	$(".map_place_box").find('input').val(strAreaNm);

	if(response.result != "success"){
		alert(response.message);
		return;
	}

	// geomjson 데이터로 변경하기
	// 범위 데이터 삭제
	geoJsonArr.forEach(function (val, idx){
		map.data.removeGeoJson(val);
	});
	var result = getGeomJson("admiFeatures", "FeatureCollection", response.data);

	strGeoJson = result;
	geoJsonArr.push(strGeoJson);

	map.data.addGeoJson(result);

	map.data.setStyle(function(feature){
		var styleOptions = {
			fillOpacity : 0.3
			, fillColor : "rgba(44,180,246,0.91)"
			, strokeColor : "rgba(30,154,255,0.89)"
			, storkeWeight:2
			, storkeOpacity : 1
		}
		// 상권이 3개 이하면
		if(strMenuGugun == 0) {
			if (feature.getProperty("storeCnt") < 4) {
				styleOptions.fillColor = "rgba(255,78,78,0.91)";
				styleOptions.strokeColor = "rgba(255,0,0,0.91)";
			}
		}

		return styleOptions;
	});

	// 메뉴 눌러서 지역선택시 바로 보고서 생성
	if(!common.isEmpty(param.upjongCd)){
		getFreeReport(response.data[0].storeCnt);
	}

	if(!map.data.hasListener('click')){
		geomClickListener = map.data.addListener('click', function(e){
			// if( map.getZoom() >= 14 ) {
				$('.pc_sheet .middle ul li:nth-child(1) > a').text(strAreaNm);

				if(!common.isEmpty(strUpjongCd)){
					getFreeReport(e.feature.getProperty("storeCnt"));
				}else{
					if(strUpjongCd.length < 1) {
						if (confirm("업종을 선택 하시겠습니까?")) {
							if (widthCheck() == "MO") {
								$('.sheet_02').show();
								$('.loca').text(strAreaNm);
							} else if (widthCheck() == "PC") {
								var list = $('.sheet.md_sheet.sheet_02').attr('class').split(' ');
								var sw = true;
								list.forEach(function (val, idx){
									if(val == "on"){
										sw = false;
									}
								});
								console.log(sw);
								if(sw){
									$('.sheet.md_sheet.sheet_02').toggleClass('on');
									$('.pc_sheet .middle ul li:nth-child(2) > a').parent().addClass('on')
								}
							}
							upjongReset();
						}
					}
				}
			// }else{
			// 	CENTER = new naver.maps.LatLng(e.feature.getProperty("centery"), e.feature.getProperty("centerx"));
			// 	map.setCenter(CENTER);
			// 	map.setZoom(14);
			// 	map.data.removeGeoJson(strGeoJson);
			// }
		});
	}
}

// 보고서 파일 생성
function getFreeReport(storeCnt){
	if(strUpjongCd == "" && strUpjongCd == null){
		alert("업종을 선택해주세요.");
	}else{
		if(storeCnt < 3){
			alert("분석할 상권이 3개 이하 입니다.");
			return;
		}

		if(confirm("보고서를 생성하시겠습니까?")){
			var data = {
				admiCd : strAdmiCd
				, upjongCd : strUpjongCd
				, memNo : ""				// 나중에 로그인들어오면 아이디 넣기
			}
			getAjax("features", "/bizmap/analysis/getFreeReport", data, fn_succ_getFreeReport, fn_error, "POST", false);
		}
	}
}

// 보고서 정보 가져오기
function fn_succ_getFreeReport(id, response, param){
	if(response.result != "success"){
		alert(response.message);
		return;
	}
	//보고서 팝업 생성하기
	console.log(response.data);
}


function reSearch(){
	var mapCenter = map.getCenter();
	var drag_lng = mapCenter.lng();	// x
	var drag_lat = mapCenter.lat();	// y

	$(".reserch").css('display','none');

	LoadingBar(true);
	if(strMenuGugun == 1){			// 유동인구
		flowpop(drag_lng, drag_lat);
	}else if(strMenuGugun == 2){	// 밀집도
		density(drag_lng, drag_lat);
	}else if(strMenuGugun == 3){	// 뜨는업종
		rising(drag_lng, drag_lat);
	}else if(strMenuGugun == 4){	// 영상
		videoContents(0.0);
	}
}

// 유동인구
function flowpop(drag_lng, drag_lat){
	for(var i=0; i< markers.length; i++) {
		marker = markers[i];
		marker.setMap(null);
	}
	markers = [];

	var data={
		xAxis: drag_lng
		, yAxis: drag_lat
		, zoomStatus : "admiCd"
	}

	getAjax("features", "/bizmap/analysis/admiFeatures", data, function (id, response){
		$(".map_place_box > a > input").val(response.data[0].megaNm + " " + response.data[0].ctyNm + " " + response.data[0].admiNm);
	}, fn_error, false);

	var data = {
		xAxis : drag_lng
		, yAxis : drag_lat
		, admiCd : strAdmiCd
		, radius : 500
	}
	getAjax("getFlowpop", "/bizmap/flowpop/getFlowpop", data, fn_succ_getFlowpop, fn_error, "POST", true);
}

function fn_succ_getFlowpop(id, response, param){

	var content;
	var level1 = [];
	var level2 = [];
	var level3 = [];
	var level4 = [];
	var level5 = [];


	for(var i=0; i<response.data.length;i++){
		var tmp = response.data[i];

		var image = "/bizmap/assets/bizmap/images/icons/popul" + tmp.flowLv + "_tag.svg"
		content = '<img src="' + image + '">';

		let flowmarker = new naver.maps.Marker({
			position: new  naver.maps.LatLng(tmp.yAxis,tmp.xAxis),
			map: dMap,
			icon: {
				content : content,
				size: new naver.maps.Size(8,7),
				origin: new naver.maps.Point(0,0),
				anchor: new naver.maps.Point(4,7),
			}
		});

		markers.push(flowmarker);

		(tmp.flowLv==1) ? level1.push(tmp.flowPop) : '';
		(tmp.flowLv==2) ? level2.push(tmp.flowPop) : '';
		(tmp.flowLv==3) ? level3.push(tmp.flowPop) : '';
		(tmp.flowLv==4) ? level4.push(tmp.flowPop) : '';
		(tmp.flowLv==5) ? level5.push(tmp.flowPop) : '';
	}

	// 범례 데이터
	// console.log(Math.max.apply(Math,level1));
	// console.log(Math.min.apply(Math,level1));
	// console.log(Math.max.apply(Math,level2));
	// console.log(Math.min.apply(Math,level2));
	// console.log(Math.max.apply(Math,level3));
	// console.log(Math.min.apply(Math,level3));
	// console.log(Math.max.apply(Math,level4));
	// console.log(Math.min.apply(Math,level4));
	// console.log(Math.max.apply(Math,level5));
	// console.log(Math.min.apply(Math,level5));

	for(var i=0; i< markers.length; i++){
		marker = markers[i];
		var mapBounds = map.getBounds();
		var position = marker.getPosition();
		if(mapBounds.hasLatLng(position)){
			if(marker.setMap()) return;
			marker.setMap(map);
		}else{
			if(!marker.setMap()) return;
			if(marker != null) marker.setMap(null);
		}
	}

	map.setZoom(15);

	LoadingBar(false);
}

// 밀집도
function density(drag_lng, drag_lat){
	for(var i=0; i< markers.length; i++) {
		marker = markers[i];
		marker.setMap(null);
	}
	markers = [];

	var data={
		xAxis: drag_lng
		, yAxis: drag_lat
		, zoomStatus : "admiCd"
	}

	getAjax("features", "/bizmap/analysis/admiFeatures", data, function (id, response){
		$(".map_place_box > a > input").val(response.data[0].megaNm + " " + response.data[0].ctyNm + " " + response.data[0].admiNm);
	}, fn_error, true);

	var data = {
		xAxis : drag_lng
		, yAxis : drag_lat
		, admiCd : strAdmiCd
		, upjongCd : strUpjongCd
		, radius : 1000
	}
	getAjax("getDensity", "/bizmap/density/getDensity", data, fn_succ_getDensity, fn_error, "POST", true);
}

function fn_succ_getDensity(id, response, param){
	// var level1 = [];
	// var level2 = [];
	// var level3 = [];
	// var level4 = [];
	// var level5 = [];
	// response.data.forEach(function (val, idx){
	//
	// 	(val.cntNum==1) ? level1.push(val.storeCnt) : '';
	// 	(val.cntNum==2) ? level2.push(val.storeCnt) : '';
	// 	(val.cntNum==3) ? level3.push(val.storeCnt) : '';
	// 	(val.cntNum==4) ? level4.push(val.storeCnt) : '';
	// 	(val.cntNum==5) ? level5.push(val.storeCnt) : '';
	// });
	//
	// // 범례 데이터
	// console.log(Math.max.apply(Math,level1));
	// console.log(Math.min.apply(Math,level1));
	// console.log(Math.max.apply(Math,level2));
	// console.log(Math.min.apply(Math,level2));
	// console.log(Math.max.apply(Math,level3));
	// console.log(Math.min.apply(Math,level3));
	// console.log(Math.max.apply(Math,level4));
	// console.log(Math.min.apply(Math,level4));
	// console.log(Math.max.apply(Math,level5));
	// console.log(Math.min.apply(Math,level5));


	geoJsonArr.forEach(function (val, idx){
		map.data.removeGeoJson(val);
	});
	var result = getGeomJson("density", "FeatureCollection", response.data);
	strGeoJson = result;
	geoJsonArr.push(strGeoJson);
	map.data.addGeoJson(result);

	map.data.setStyle(function(feature){
		var styleOptions = {
			fillOpacity : 0.3
			, fillColor : fillColor[(feature.getProperty('cntNum'))]
			, strokeColor : strokeColor[(feature.getProperty('cntNum'))]
			, storkeWeight:0.5
			, storkeOpacity : 1
		}

		return styleOptions;
	});

	mouseoverListener = map.data.addListener('mouseover', function(e) {
		map.data.overrideStyle(e.feature, {
			fillColor: mouseoverAfterColor[(e.feature.getProperty('cntNum'))],
		});
	});

	mouseoutListener = map.data.addListener('mouseout', function(e) {
		map.data.overrideStyle(e.feature, {
			fillColor: fillColor[(e.feature.getProperty('cntNum'))],
		});
	});

	LoadingBar(false);
}

// 뜨는업종
function rising(drag_lng, drag_lat){

	var data = {
		xAxis : drag_lng
		, yAxis : drag_lat
	}
	getAjax("getRisingUpjong", "/bizmap/rising/getRisingUpjong", data, fn_succ_getRising, fn_error, "POST", false);
}
function fn_succ_getRising(id, response, param){

	geoJsonArr.forEach(function (val, idx){
		map.data.removeGeoJson(val);
	});
	var result = getGeomJson("density", "FeatureCollection", response.data.admiFeatures);
	strGeoJson = result;
	geoJsonArr.push(strGeoJson);
	map.data.addGeoJson(result);

	map.data.setStyle(function(feature){
		var styleOptions = {
			fillOpacity : 0.3
			, fillColor : "rgba(44,180,246,0.91)"
			, strokeColor : "rgba(30,154,255,0.89)"
			, storkeWeight:2
			, storkeOpacity : 1
		}

		return styleOptions;
	});

	$(".sheet_body.has_mapshow").find(".pd > .main_txt").text(response.data.admiFeatures[0].admiNm + " 뜨는업종 TOP 5");
	$("#top5Card").find(".card_s_txt").text(response.data.admiFeatures[0].ctyNm+ " " + response.data.admiFeatures[0].admiNm);

	fn_risingContentsList(response.data.rising);
	LoadingBar(false);
}

// 영상콘텐츠
function videoContents(youtubeNo){
	var data = {
		youtubeNo : youtubeNo
	}
	getAjax("getFlowpop", "/bizmap/youTube/getYouTube", data, fn_succ_getVideoContents, fn_error, "POST", true);
}

function fn_succ_getVideoContents(id, response, param){

	var maxy = response.data[0].maxy;
	var maxx = response.data[0].maxx;
	var miny = response.data[0].miny;
	var minx = response.data[0].minx;

	var content;
	for(var i=0; i<response.data.length;i++){
		var tmp = response.data[i];

		var image = "/bizmap/assets/bizmap/images/icons/ico_play_pic.svg"
		content = '<a href="javascript:;" ' +
			'data-centerx="' + tmp.centerx + '" ' +
			'data-centery="' + tmp.centery + '" ' +
			'data-admiCd="admiCd" ' +
			'data-youtubeNo="'+ tmp.youtubeNo +'" ' +
			'onclick=videoMarkerClick($(this).data());><img src="' + image + '"></a>';

		let marker = new naver.maps.Marker({
			position: new naver.maps.LatLng(tmp.centery,tmp.centerx),
			map: dMap,
			icon: {
				content : content,
				size: new naver.maps.Size(8,7),
				origin: new naver.maps.Point(0,0),
				anchor: new naver.maps.Point(4,7),
			}
		});
		markers.push(marker);
	}

	// timeout 안해주면 안그려짐
	setTimeout(function (){
		var bounds = new naver.maps.LatLngBounds(
			new naver.maps.LatLng(miny, minx),
			new naver.maps.LatLng(maxy, maxx));
		map.fitBounds(bounds);


		for(var i=0; i< markers.length; i++){
			marker = markers[i];
			var mapBounds = map.getBounds();
			var position = marker.getPosition();
			if(mapBounds.hasLatLng(position)){
				if(marker.setMap()) return;
				marker.setMap(map);
			}else{
				if(!marker.setMap()) return;
				if(marker != null) marker.setMap(null);
			}
		}
	}, 100);

	fn_videoContentsList(response);

}

function videoMarkerClick(data){
	setFeatures(data.centerx, data.centery, data.admicd);
	CENTER = new naver.maps.LatLng(data.centery,data.centerx);
	map.setCenter(CENTER);
	map.setZoom(12);

	var param = {
		filter1 : '0'
		,filter2 : '0'
		,filter3 : '0'
	}
	getAjax("getYouTube", "/bizmap/youTube/getYouTube", param,
		function (id, response, param){
			fn_videoContentsList(response)
		}
		, fn_error, "POST", true);

	if(widthCheck()== "MO"){
		$(".sheet.sheet_04.md_sheet.md_up").toggleClass("up");
		$(".modal1").toggleClass('on');
	}

	// 스크롤이동
	/*var offset = $("#video_"+data.youtubeno).offset();
	setTimeout(function (){
		$('#videoContentList').animate({scrollTop : offset.top-180});
	}, 200);*/

}


function removeMarkers(){
	for(var i=0; i< markers.length; i++){
		markers[i].setMap(null);
	}
	markers = [];

	naver.maps.Event.removeListener(mouseoverListener);
	naver.maps.Event.removeListener(mouseoutListener);
	naver.maps.Event.removeListener(geomClickListener);
}




/*function fileUpload(){
	$.ajax({
		url: "/common/file/upload",
		type: "POST",
		data: new FormData($("#fileUploadForm")[0]),
		enctype: 'multipart/form-data',
		processData: false,
		contentType: false,
		cache: false,
		success: function (response) {
			response = JSON.parse(response);
			fileInfo = {
				fileName : response.data.fileName
				, orgFileNm : response.data.original
				, filePath : response.data.filePath
			};
		},
		error: function (response) {
			alert('File Upload Error\n\n' + response);
		}
	});
}

function fileDownLoad(){
	$("#fileDownLoad").attr('href' , domainUrl + "common/fileDownLoad?fileName=" + fileInfo.fileName + "&orgFileNm=" + fileInfo.orgFileNm + "&filePath=" + fileInfo.filePath);
}*/

