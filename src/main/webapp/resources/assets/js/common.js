/**
 * 공통 자바스크립트 함수
 */
common = {};

common.isEmpty = function(value){
    if(typeof value === 'function'){
        return false;
    }
    return (value == null || value.length === 0);
}

/* 문자열이 빈 문자열인지 체크하여 기본 문자열로 리턴한다. */
common.nvl = function(str, defaultStr){
    return !str ? defaultStr : str;
}


/* Date Type 체크 */
common.isDate = function(value){
    var date = new Date(value);
    return !this.isEmpty(date);
}

/* Date to Number 변환 ex.) 2019-05-13 ==> 20190513 */
common.dateToNumber = function(date){
    if(this.isEmpty(date)){
        dalbitLog("[dateToNumber] 데이터가 Null 입니다. (" + date + ")" )
        return "-";
    }

    if(this.isDate(date)){
        dalbitLog("[dateToNumber] Date 형식이 아닙니다. (" + date + ")" )
        return "-";
    }

    var regExp = /\d/gi;
    return date.toString().replace(regExp, "");
}

common.getMaxDay = function(year, month){
    var date = new Date(year, month, 0);

    if(this.isEmpty(date)) return 0;

    return date.getDate();
}

common.addComma = function(value, blank){
    if(common.isEmpty(value)){
        return 0;
    }
    if(value == "null" || value == "NaN"){
        return '';
    }
    if(!common.isEmpty(blank) && value == 0) {
        if (blank == "Y") {
            return '';
        }
    }
    var regExp = /\B(?=(\d{3})+(?!\d))/g
    return value.toString().replace(regExp, ",");
}

common.removeComma = function(value){
    if(common.isEmpty(value)){
        return 0;
    }
    var regExp = /,/gi;
    return value.toString().replace(regExp, "");
}

common.convertToDate = function(date, format){
    if(this.isEmpty(date)){
        return "-";
    }else if(date.length == 14 || 0 < Number(date)){
        var regExp = /(\d{8})(\d{6})/;
        date = date.toString().replace(regExp, '$1 $2');
    }
    if(this.isEmpty(format)){
        format = "YYYY.MM.DD HH:mm:ss";
    }
    return moment(date).format(format);
}

common.convertSort = function(value){
    return this.isEmpty(value) ? null : (value === 'asc') ? 0 : 1;
}

common.getValue = function(value){
    return typeof(value) == 'function' ? value() : value;
}

common.replace = function(value, from, to){
    var string = this.getValue(value);
    var from = this.getValue(from);
    var to = this.getValue(to);

    return string.replace(new RegExp(from, 'gi'), to);
}

common.formatDate = function(date, stringFormat){
    var format = this.getValue(stringFormat);
    format = (format.length) ? format : 'YYYY.MM.DD';
    return moment(this.getValue(date)).format(format);
}

common.replaceHtml = function(text){
        if(!common.isEmpty(text)){
            text = text.replace(/\\n/g, '');
            text = this.replace(text, "&lt;", "<");
            text = this.replace(text, "&gt;", ">");
            text = this.replace(text, "&amp;", "&");
            return text;
        }
}

common.replaceHtml_json = function(text){
    if(!common.isEmpty(text)){
        text = text.replace(/\\n/g, '');
        text = this.replace(text, /\\\\/g, "\\");
        text = this.replace(text, "&lt;", "<");
        text = this.replace(text, "&gt;", ">");
        text = this.replace(text, "&amp;", "&");
        return text;
    }
}

common.replaceTag = function(text){
    if(!common.isEmpty(text)){
        text = text.replace(/\\r\\n/g, '<br/>');
        text = text.replace(/\\n/g, '<br/>');
        text = text.replace(/\\t/g, ' ');
        return text;
    }
}

common.lpad = function(s, padLength, padString){
    s = String(s);
    while(s.length < padLength)
        s = padString + s;
    return s;
}

common.rpad = function(s, padLength, padString){
    s = String(s);
    while(s.length < padLength)
        s = s + padString;
    return s;
}

common.timeStampAll = function(time){
    if(!common.isEmpty(time) && time != 0){
        time = parseInt(time);
        var day = Math.floor(time / 60 / 60 / 24);
        var day_s = day * 60 * 60 * 24;
        var hours_s = time - (day_s);
        var hours = Math.floor(hours_s / 60 / 60);
        var minutes_s = time - (day_s + (hours * 60 * 60));
        var minutes = Math.floor(minutes_s / 60);
        var seconds = time - ((day * 60 * 60 * 24) + (hours * 60 * 60) + (minutes * 60) );

        if(hours < 10){
            hours = '0'+hours;
        }
        if(minutes < 10){
            minutes = '0'+minutes;
        }
        if(seconds < 10){
            seconds = '0'+seconds;
        }

        if(day > 0){
            return day + " " + hours  + ":" + minutes + ":" + seconds;
        }else{
            return hours  + ":" + minutes + ":" + seconds;
        }
    }else{
        return "";
    }
}

common.phoneNumHyphen = function(value) {
    if(common.isEmpty(value)) {
        return '-';
    }
    var regExp = /(\d{3})(\d{3,4})(\d{4})/
    return value.toString().replace(regExp, '$1-$2-$3');
}

common.scrollTop = function(){
    $(window).scroll(function () {
        if ($(this).scrollTop() > 50) {
            $('#back-to-top').fadeIn();
        } else {
            $('#back-to-top').fadeOut();
        }
    });
    // scroll body to 0px on click
    $('#back-to-top').click(function () {
        $('#back-to-top').tooltip('hide');
        $('body,html').animate({
            scrollTop: 0
        }, 400);
        return false;
    });

    $('#back-to-top').tooltip('show');
};

common.average = function(lvalue, rvalue, point) {
    if(lvalue == "null" || lvalue == "NaN" || rvalue == "null" || rvalue == "NaN"){
        return '';
    }
    if (rvalue == 0 || common.isEmpty(rvalue)) {
        return 0;
    }
    if (lvalue == 0 || common.isEmpty(lvalue)) {
        return 0;
    }
    var tmp = (lvalue / rvalue) * 100;
    if(!common.isEmpty(point)){
        return tmp.toFixed(point);
    }else{
        return tmp.toFixed(1);
    }
};

common.division = function(lvalue,rvalue, dot) {
    if (rvalue == 0) {
        return 0;
    }
    var tmp = lvalue / rvalue;
    if(!common.isEmpty(dot)){
        return common.addComma(tmp.toFixed(dot));
    }else{
        return common.addComma(tmp.toFixed(1));
    }
};

common.substr = function(value, st, ed){
    if(ed > 0){
        return value.substr(st,ed);
    }else{
        return value.substr(st);
    }
};
