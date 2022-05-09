

var strGeoJson = "";
var strAdmiCd = "11140520";
var strUpjongCd = "O04001";


$(function(){

	naver.maps.Event.addListener(map, 'click', function (e){
		var data={
			xAxis: 126.975221181947
			, yAxis: 37.5661485287594
			, admiCd : strAdmiCd
			, upjongCd : strUpjongCd
		}

		getAjax("features", "/bizmap/analysis/admiFeatures", data, fn_succ_features, fn_error);
	});

});

function fn_error(response) {
	console.log(response);
	console.log('error');
}

function fn_succ_features(id, response, param){
	if(!common.isEmpty(strGeoJson)) map.data.removeGeoJson(strGeoJson);

	// geomjson 데이터로 변경하기
	var result = getFeature("test", "FeatureCollection", response);

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

	if(!map.data.hasListener('click')){
		map.data.addListener('click', function(e){
			if(confirm("보고서를 생성하시겠습니까?")){
				// setFreeReport(e);

				var data = {
					analNo : "80366"
				}
				getFreeReport(analNo);
			}
		});
	}
}

// 보고서 파일 생성
function setFreeReport(data){
	// 상권이 3개 이상인 곳만
	if(data.feature.getProperty("admiCd") > 3){
		var data={
			admiCd : strAdmiCd
			, upjongCd : strUpjongCd
		}
		getAjax("features", "/bizmap/analysis/setFreeReport", data, fn_succ_setFreeReport, fn_error, "POST", false);
	}else{
		alert("분석할 상권이 3개 이하 입니다.")
	}
}

// 보고서 파일 생성 완료
function fn_succ_setFreeReport(id, response, param){
	//보고서 파일 가져오기
	getFreeReport(response);

}

// 보고서 파일 가져오기
function getFreeReport(data){
	getAjax("features", "/bizmap/analysis/getFreeReport", data, fn_succ_getFreeReport, fn_error, "POST", false);
}

// 보고서 데이터 출력
function fn_succ_getFreeReport(id, response, param){

}
