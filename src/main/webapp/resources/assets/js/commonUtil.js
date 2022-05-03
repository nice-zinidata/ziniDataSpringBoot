/**
 * 공통 자바스크립트 유틸
 */
var util = {};

/* 새창 띄우기 */
util.windowOpen = function(data, width, height, name){
    var url = '';
    if (typeof (data) == 'object') {
        url = data.url;
        width = data.width;
        height = data.height;
        name = data.name;
    } else {
        url = data;
    }
    name = name || 'popup';

    var left = (window.screen.width / 2) - (width / 2);
    var top = (window.screen.height / 2) - (height / 2);

    window.open(url, name, 'width=' + width + ' height=' + height + ' scrollbars=yes left=' + left + 'top=' + top);
}

/*파일 업로드 호출 모듈*/
util.fileUpdate = function(dst_url, dst_params, successFunc, errorFunc) {
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: dst_url,
        data: dst_params,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
    }).done(function (data) {
        if (successFunc != null) successFunc(data);
    }).fail(function (data, textStatus, jqXHR) {
        try {
            if (errorFunc != null) errorFunc(data, textStatus, jqXHR);
        } catch (e) {
            // function call fail skip
            alert(e);
            //showAlert('A', e);
        }
    });
},

/* Excell DownLoad 모듈*/
util.excelDownload = function(btn, url, data, successFunc, errorFunc) {
    // btn.button('loading');
    util.changeLoadingBtn(btn, 'loading', 'DownLoading...');
    //btn.button('loading');

    var sendData = data;
    if (data instanceof FormData) {
        sendData = {};
        data.forEach(function (value, key) {
            sendData[key] = value;
        });
    }

    $.fileDownload(url, {
        httpMethod: "POST",
        data: sendData,
        successCallback: function (url, data) {
            console.log("[exceldown 통신 결과]url : " + url);
            console.log(data);
            setTimeout(function () {
                // btn.button('reset');
                util.changeLoadingBtn(btn, 'reset');
            }, 500)
        },
        failCallback: function (responseHtml, url, data) {
            setTimeout(function () {
                // btn.button('reset');
                util.changeLoadingBtn(btn, 'reset');
            }, 500)
        }
    })
        .done(function (data) {
            if (successFunc != null) successFunc(data);
        })
        .fail(function (data) {
            if (errorFunc != null) errorFunc(data);
        });
},

util.getCommonCodeSelect = function(code, targetCode, isExcludeAllYn, name) {
    targetCode = eval(targetCode);
    if (!common.isEmpty(targetCode)) {

        var header = targetCode[0];
        var selectName = common.isEmpty(name) ? header.value : name;
        var html = '<select id="' + selectName + '" name="' + selectName + '" class="form-control searchType">';
        targetCode.forEach(function (value) {
            if (!common.isEmpty(value.type)) {

                if (isExcludeAllYn == 'Y' && (value.type == 'all' || value.type == -1)) {
                    return;
                }

                html += '<option value="' + value.value + '" ' + (value.value == code ? 'selected="selected"' : '') + '>' + value.code + '</option>';
            }
        });
        html += '</select>'
        return html;
    }
},

util.getCommonCodeSelectForName = function(codeName, targetCode, isExcludeAllYn, name) {
    targetCode = eval(targetCode);
    if (!common.isEmpty(targetCode)) {

        var header = targetCode[0];
        var selectName = common.isEmpty(name) ? header.value : name;
        var html = '<select id="' + selectName + '" name="' + selectName + '" class="form-control searchType">';
        targetCode.forEach(function (value) {
            if (!common.isEmpty(value.type)) {

                if (isExcludeAllYn == 'Y' && (value.type == 'all' || value.type == -1)) {
                    return;
                }
                html += '<option value="' + value.value + '" ' + (value.code == codeName ? 'selected="selected"' : '') + '>' + value.code + '</option>';
            }
        });
        html += '</select>'
        return html;
    }
},

util.getCommonCodeRadio = function(code, targetCode, isExcludeAllYn, name) {
    targetCode = eval(targetCode);
    if (!common.isEmpty(targetCode)) {

        var header = targetCode[0];
        var html = '';
        var radioName = common.isEmpty(name) ? header.value : name;
        targetCode.forEach(function (value) {
            if (!common.isEmpty(value.type)) {

                if (isExcludeAllYn == 'Y' && (value.type == 'all' || value.type == -1)) {
                    return;
                }
                html += '<label class="control-inline fancy-radio custom-color-green">';
                html += '<input type="radio" value="' + value.value + '" id="' + radioName + value.value + '" name="' + radioName + '" class="form-control" ' + (value.value == code ? 'checked="checked"' : '') + '/>';
                html += '<span><i></i>' + value.code + '</span>'
                html += '</label>';
            }
        });
        return html;
    }
},

util.getCommonCodeCheck = function(code, targetCode, isExcludeAllYn, name) {
    targetCode = eval(targetCode);
    if (!common.isEmpty(targetCode)) {

        var header = targetCode[0];
        var html = '';
        var checkName = common.isEmpty(name) ? header.value : name;
        targetCode.forEach(function (value) {
            if (!common.isEmpty(value.type)) {

                if (isExcludeAllYn == 'Y' && (value.type == 'all' || value.type == -1)) {
                    return;
                }
                html += '<label class="control-inline fancy-checkbox custom-color-green">';
                html += '<input type="checkbox" value="' + value.code + '" id="' + checkName + value.value + '" name="' + checkName + '" class="form-control" ' + (value.value == code ? 'checked="checked"' : '') + '/>';
                html += '<span><i></i>' + value.code + '</span>'
                html += '</label><br/>';
            }
        });
        return html;
    }
},

util.getOnOffSwitch = function(data, name) {
    var checkName = name == null ? 'viewOn' : name;

    var html = '<div class="onoffswitch">';
    html += '<input type="checkbox" name="'+checkName+'" id="detail_'+checkName+'" class="onoffswitch-checkbox" ' + (data == 1 ? 'checked="checked"': '') +'>';
    html += '<label class="onoffswitch-label" for="detail_'+checkName+'">';
    html += '<span class="onoffswitch-inner"></span>';
    html += '<span class="onoffswitch-switch"></span>';
    html += '</label>';
    html += '</div>';

    return html;
}
