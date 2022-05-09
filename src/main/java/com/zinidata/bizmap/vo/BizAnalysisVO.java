package com.zinidata.bizmap.vo;

import lombok.Data;

@Data
public class BizAnalysisVO {

    // input
    private double xAxis;
    private double yAxis;
    private String upjongCd;

    //output
    private String geometry;
    private String ctyCd;
    private String admiCd;
    private String id;
    private String admiNm;
    private String minx;
    private String miny;
    private String maxx;
    private String maxy;
    private String centerx;
    private String centery;
    private String geom;
    private String feature;
    private String blkCd;
    private String blkNm;
    private String blkNm1;
    private String analNo;
    private int storeCnt;


}
