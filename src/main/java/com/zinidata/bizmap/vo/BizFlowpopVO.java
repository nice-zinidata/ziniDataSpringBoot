package com.zinidata.bizmap.vo;

import lombok.Data;

@Data
public class BizFlowpopVO {

    //input
    private double xAxis;
    private double yAxis;
    private String radius;

    //output
    private String blkType;
    private String blkCd;
    private String label;
    private String maxx;
    private String minx;
    private String maxy;
    private String miny;
    private String centerx;
    private String centery;
    private String geom;
    private String fillColor;
    private String fillOpacity;
    private String strokeColor;
    private String strokeWidth;
    private String strokeDashStyle;
}
