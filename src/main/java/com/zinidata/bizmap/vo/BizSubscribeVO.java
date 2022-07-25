package com.zinidata.bizmap.vo;

import lombok.Data;

@Data
public class BizSubscribeVO {

    // input
    private String mobileNo;
    private String memNm;
    private String memType;
    private String interestAreacd;
    private String interestUpjong;
    private String personalInfo;
    private String marketingInfo;
    private String upjongNm;
    private String areaNm;
    private String gubun; // 구독 : 1, 취소 0

    //output


}
