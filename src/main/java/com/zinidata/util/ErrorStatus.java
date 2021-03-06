package com.zinidata.util;

import lombok.Getter;

@Getter
public enum ErrorStatus {

    권한없음("E403", "http.error.accessDenied", "권한이 없는 페이지 접근 시"),
    잘못된호출("E404", "http.error.notFound", "404 혹은 파라메터가 빠진경우"),
    잘못된파람("E405", "http.error.param", "파라메터가 잘못된경우"),

    서버처리중오류("E007", "server.error", "서버 처리중 오류가 발생한 경우"),
    ;

    final private String ERROR_RESULT = "fail";

    final private String result;

    final private String errorCode;
    final private String messageKey;
    final private String desc;

    ErrorStatus(String errorCode, String message, String desc){
        this.result = ERROR_RESULT;
        this.errorCode = errorCode;
        this.messageKey = message;
        this.desc = desc;
    }
}
