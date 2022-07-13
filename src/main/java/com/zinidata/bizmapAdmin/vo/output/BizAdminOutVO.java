package com.zinidata.bizmapAdmin.vo.output;

import lombok.Data;

@Data
public class BizAdminOutVO {

    //output
    private String loginId;
    private String memNm;
    private String mobileNo;
    private String emailAddr;
    private String memStat;
    private int memNo;

    private String dateFrom;
    private String dateTo;
    private String payMethod;
    private String prodType;
    private String pageLength;

}
