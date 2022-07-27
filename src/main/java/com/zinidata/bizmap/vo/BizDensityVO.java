package com.zinidata.bizmap.vo;

import lombok.Data;

@Data
public class BizDensityVO {

    //input
    private double xAxis;
    private double yAxis;
    private int radius;
    private String upjongCd;

    // output
    private String blkCd;
    private String admiCd;
    private String blkNm;
    private String storeCnt;
    private String cntNum;
    private String minx;
    private String maxx;
    private String miny;
    private String maxy;
    private String centerx;
    private String centery;
    private String geom;
    private String geometry;
}
