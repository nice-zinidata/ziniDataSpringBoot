package com.zinidata.common.vo;

import lombok.Data;

@Data
public class ComLoginVO {

    // input
    private int memNo;
    private String loginId;
    private String pwd;
    private String memStat;
    private String memNm;
    private String vno;
    private String mobileNo;
    private String emailAddr;
    private String memType;
    private String smsYn;
    private String emailYn;
    private String alarmYn;

    //output
    private String subsDt;
    private String leaveDt;
    private String leaveReasonCd;
    private String leaveReasonText;
    private String startDt;
    private String endDt;
    private String tempPwdYn;
    private String interestAreacd1;
    private String interestAreacd2;
    private String interestAreacd3;
    private String interestUpjong1;
    private String interestUpjong2;
    private String interestUpjong3;
    private String crtDt;
    private String crtId;
    private String updDt;
    private String updId;
    private String loginSession;
    private long loginTimestemp;
    private String memDi;
    private String memCi;
    private String certFlag;
    private String joinsiteCorpCd;
    private String svcYn;
    private String ssn;
    private String interestAreacd1Str;
    private String interestAreacd2Str;
    private String interestAreacd3Str;
    private String interestUpjong1Str;
    private String interestUpjong2Str;
    private String interestUpjong3Str;
    private String resFlagYn;
    private String reqAuthCd;
    private String cjCodeAsCode;
    private String resAuthCd;
    private int loginAutnSeq;
    private String ipAddr;

}
