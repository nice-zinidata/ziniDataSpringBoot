

var strGeoJson = "";
var strAdmiCd = "";
var strAreaNm = "";
var strUpjongCd = "";
var strUpjongNm = "";


var mapOptions = {
	center: new naver.maps.LatLng(37.5661485287594, 126.975221181947),
	zoom: 14
};
var map = new naver.maps.Map('map', mapOptions);

$(function(){

	naver.maps.Event.addListener(map, 'mousemove', function (e){
		var data={
			xAxis: e.latlng.x
			, yAxis: e.latlng.y
			, admiCd : strAdmiCd
		}
		getAjax("features", "/bizmap/analysis/admiFeatures", data, fn_succ_features, fn_error, false);
	});


	naver.maps.Event.addListener(map, 'click', function (e){
		var data={
			xAxis: e.latlng.x
			, yAxis: e.latlng.y
		}

		getAjax("features", "/bizmap/analysis/admiFeatures", data, fn_succ_features, fn_error, false);
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
		console.log('-----------------');
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

	// console.log(response.data[0].feature);
	// var result = JSON.parse(response.data[0].feature.replace(/$#34;/g,"'"));
	// geomjson 데이터로 변경하기
	var result = getGeomJson("admiFeatures", "FeatureCollection", response.data);
	//
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
		getFreeReport();
	}

	if(!map.data.hasListener('click')){
		map.data.addListener('click', function(e){
			if(confirm("보고서를 생성하시겠습니까?")){
				getFreeReport();
			}
		});
	}

}

// 보고서 파일 생성
function getFreeReport(){

	alert(strAdmiCd + " " + strUpjongCd);

	// 상권이 3개 이상인 곳만
	/*if(data.feature.getProperty("admiCd") < 3) {
		alert("분석할 상권이 3개 이하 입니다.");
		return;
	}*/

	var data = {
		admiCd : strAdmiCd
		, upjongCd : strUpjongCd
	}
	console.log(data);
	getAjax("features", "/bizmap/analysis/getFreeReport", data, fn_succ_getFreeReport, fn_error, "POST", false);
}

// 보고서 정보 가져오기
function fn_succ_getFreeReport(id, response, param){
	if(response.result != "success"){
		alert(response.message);
		return;
	}
	//보고서 파일 가져오기
	console.log(response.data);

}
