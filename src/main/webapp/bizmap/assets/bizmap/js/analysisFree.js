

var strGeoJson = "";
var strAdmiCd = "";
var strAreaNm = "";
var strUpjongCd = "";
var strUpjongNm = "";
var strMenuGugun = "1"; //1:기본보고서, 2:유동인구, 3:밀집도, 4:뜨는업종, 5:영상콘텐츠

var fileInfo = {};

var CENTER = new naver.maps.LatLng(37.5661485287594, 126.975221181947);
var mapOptions = {
	center: new naver.maps.LatLng(37.5661485287594, 126.975221181947),
	zoom: 14
};
var map = new naver.maps.Map('map', mapOptions);

$(function(){

	// 지도 마우스 이동
	naver.maps.Event.addListener(map, 'mousemove', function (e){
		var data={
			xAxis: e.latlng.x
			, yAxis: e.latlng.y
			, admiCd : strAdmiCd
			, zoomStatus : ( map.getZoom() >= 14 ) ? "admiCd" : (( map.getZoom() >= 12 && map.getZoom() <= 13 ) ? "ctyCd" : ( map.getZoom() <= 11 ) ? "megaCd" : "admiCd")
		}
		getAjax("features", "/bizmap/analysis/admiFeatures", data, fn_succ_features, fn_error, false);
	});

	// 지도 클릭
	naver.maps.Event.addListener(map, 'click', function (e){
		var data={
			xAxis: e.latlng.x
			, yAxis: e.latlng.y
			, zoomStatus : ( map.getZoom() >= 14 ) ? "admiCd" : (( map.getZoom() >= 12 && map.getZoom() <= 13 ) ? "ctyCd" : ( map.getZoom() < 11 ) ? "megaCd" : "")
		}

		getAjax("features", "/bizmap/analysis/admiFeatures", data, fn_succ_features, fn_error, false);
	});

	// 지도 드레그 종료
	naver.maps.Event.addListener(map, 'dragend', function (e){
		//유동인구, 밀집도, 뜨는업종, 영상콘텐츠에서만 버튼 보이도록
		if(strMenuGugun != 1){
			$("#reSearch").parent().css('display','');
		}
	});

});

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

	$('.search').text(strAreaNm + " " + strUpjongNm);

	if(response.result != "success"){
		alert(response.message);
		return;
	}

	// geomjson 데이터로 변경하기
	var result = getGeomJson("admiFeatures", "FeatureCollection", response.data);

	strGeoJson = result;
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
		if(feature.getProperty("storeCnt") < 4){
			styleOptions.fillColor = "rgba(255,78,78,0.91)";
			styleOptions.strokeColor = "rgba(255,0,0,0.91)";
		}

		return styleOptions;
	});

	// 메뉴 눌러서 지역선택시 바로 보고서 생성
	if(!common.isEmpty(param.upjongCd)){
		getFreeReport(response.data[0].storeCnt);
	}

	if(!map.data.hasListener('click')){
		map.data.addListener('click', function(e){
			console.log(map.getZoom());
			if( map.getZoom() >= 14 ) {
				if(!common.isEmpty(strUpjongCd)){
					getFreeReport(e.feature.getProperty("storeCnt"));
				}else{
					if(confirm("업종을 선택 하시겠습니까?")){
						$('.pop_up').css('display', 'block');
						$('.map').css('display', 'none');
						$('.confirm').removeClass('on');
						$('.body1').css('display', 'none');
						$('.in2').css('display', 'flex');
						$('.in1').css('display', 'none');
						var data = {
							gubun : "upjong1"
						};
						getUpjong(data);
					}
				}
			}else{
				CENTER = new naver.maps.LatLng(e.feature.getProperty("centery"), e.feature.getProperty("centerx"));
				map.setCenter(CENTER);
				map.setZoom(14);
				map.data.removeGeoJson(strGeoJson);
			}
		});
	}
}

// 보고서 파일 생성
function getFreeReport(storeCnt){
	// if(storeCnt < 3){
	// 	alert("분석할 상권이 3개 이하 입니다.");
	// 	return;
	// }
	if(confirm("보고서를 생성하시겠습니까?")){
		var data = {
			admiCd : strAdmiCd
			, upjongCd : strUpjongCd
			, memNo : ""				// 나중에 로그인들어오면 아이디 넣기
		}
		getAjax("features", "/bizmap/analysis/getFreeReport", data, fn_succ_getFreeReport, fn_error, "POST", false);
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

function fileUpload(){
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
}