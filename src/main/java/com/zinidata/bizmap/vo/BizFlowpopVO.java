package com.zinidata.bizmap.vo;

import lombok.Data;

@Data
public class BizFlowpopVO {

    //input
    private double xAxis;
    private double yAxis;
    private int radius;

    //output
    private String id;
    private String flowPop;
    private String blkCd;
    private String label;
    private String cumedist;
    private String flowLv;
    private String admiNm;
    private String minFlowpop;
    private String maxFlowpop;
    private String minx;
    private String maxx;
    private String miny;
    private String maxy;

    private String megaNm;
    private String ctyNm;
}
