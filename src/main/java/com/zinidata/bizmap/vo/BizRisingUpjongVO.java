package com.zinidata.bizmap.vo;

import lombok.Data;

@Data
public class BizRisingUpjongVO {

    //input
    private double xAxis;
    private double yAxis;
    private String admiCd;

    //ouput
    private String upjong3Cd;
    private String upjong3Nm;
    private String upjong1Cd;
    private String salePercnt;
    private String storePercnt;
    private int saleRnk;
    private int storeRnk;
    private String filterCnt;

}
