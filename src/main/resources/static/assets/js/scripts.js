function isEmpty(value){
  if(typeof value === 'function'){
    return false;
  }
  return (value == null || value.length === 0);
}

function commonAjaxError(data, textStatus, jqXHR) {
  try {
    console.log(data);
    if (textStatus == 'parsererror' && 0 < data.responseText.indexOf('로그인')) {
      alert('세션이 만료되어 로그인 페이지로 이동합니다.');
// location.href = '/login';
    }
  } catch (e) {

  }
}

/*ajax 호출 */
function getAjax(dst_url, dst_data, successFunc) {
  $.ajax({
    type: 'POST',
    url: dst_url, //전송할 url
    data: dst_data, //form id를 입력하자 (serialize)
    success: function(response) { //성공했을시의 동작.
// console.log(response)
      successFunc(response);
    },
    error: function() { //오류났을때 동작
      alert("There was an error submitting comment");
    }
  });
}

/*ajax 호출 모듈*/
function getAjaxData(dst_id, dst_url, dst_params, successFunc, errorFunc, option) {
  var commonUtil = this;
  var isEmptyOption = isEmpty(option);

  $.ajax({
    beforeSend : function(xhr){

    },
    header: {

    },
    type: isEmptyOption ? 'POST' : isEmpty(option.type) ? 'POST' : option.type,
    url: dst_url,
    dataType: isEmptyOption ? 'json' : isEmpty(option.dataType) ? 'json' : option.dataType,
    data: dst_params,
    async: true,
    xhrFields: {
      withCredentials: true
    },
    crossDomain: true
  }).done(function (data) {
    if (successFunc != null){
      console.log("[ajax 통신 결과]url : " + dst_url);
      console.log(data);

      successFunc(dst_id, data, dst_params);
    }
  }).fail(function (data, textStatus, jqXHR) {
    try {
      if (errorFunc != null) {
        errorFunc(data, textStatus, jqXHR);
      } else {
        commonAjaxError(data, textStatus, jqXHR);
      }
    } catch (e) {
// function call fail skip
      alert(e);
    }
  });
}

function addComma(value) {
  return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}