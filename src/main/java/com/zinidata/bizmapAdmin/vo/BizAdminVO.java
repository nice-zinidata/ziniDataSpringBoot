package com.zinidata.bizmapAdmin.vo;

import lombok.Data;

@Data
public class BizAdminVO {
    // Input 데이터
    private String loginId;
    private String memNm;
    private String mobileNo;
    private String emailAddr;
    private String memStat;
    private String dateFrom;
    private String dateTo;
    private String payMethod;
    private String prodType;
    private String pageLength;
    private int memNo;
    private String gubun;

    // Output 데이터
    private String areanm1;
    private String alarmYn;
    private String areanm2;
    private String certFlag;
    private String areanm3;
    private String crtDt;
    private String decSsn;
    private String crtId;
    private String endDt;
    private String emailYn;
    private String interestAreacd1;
    private String interestAreacd3;
    private String interestAreacd2;
    private String interestUpjong1;
    private String interestUpjong2;
    private String interestUpjong1Str;
    private String interestUpjong2Str;
    private String interestUpjong3Str;
    private String interestUpjong3;
    private String joinsiteCorpCd;
    private String leaveDtStr;
    private String leaveDt;
    private String leaveReasonCd;
    private String leaveReasonText;
    private String loginSession;
    private String loginTimestemp;
    private String memCi;
    private String memDi;
    private String memType;
    private String pwd;
    private String rn;
    private String rnk;
    private String smsYn;
    private String startDt;
    private String subsDt;
    private String subsDtStr;
    private String svcYn;
    private String tempPwdYn;
    private String totalRowCount;
    private String updDt;
    private String updId;
    private String vno;

    private String prodNm;
    private String payDate;
    private String remainLimit;
    private String totLimit;
    private String payAmt;
    private String validDtTo;
    private String payStat;
    private String updDtStr;
}
