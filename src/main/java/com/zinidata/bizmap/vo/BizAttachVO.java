package com.zinidata.bizmap.vo;

import lombok.Data;

@Data
public class BizAttachVO {
    // input
    private int idx;
    private String attachNo;
    private int boardDtlNo;
    private String fileNm;
    private String filePath;
    private String fileName;
    private String orgFileNm;
    private String originalNm;
    private int fileSize;
    private String delYn;
    private String crtDt;
    private String updDt;

}
