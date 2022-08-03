package com.zinidata.bizmap.vo;

import lombok.Data;

@Data
public class BizConsultingVO {
    // input
    private String searchText;
    private int pageCnt;
    private int pageNo;

    // output

    private int boardDtlNo;
    private int boardNo;
    private double memNo;
    private String loginId;
    private int tBoardDtlNo;
    private int pBoardDtlNo;
    private String subject;
    private String contents;
    private String dispOrder;
    private String depth;
    private String queryCnt;
    private String queryAuth;
    private String delYn;
    private String crtDt;
    private String crtId;
    private String updDt;
    private String updId;
    private String gubun;
    private String authFlag;
    private String password;
    private String passwordYn;
    private String adminNm;
    private String rn;
    private int totalRowCount;
    private int rowNum;
    private int attachCnt;
    private int commcnt;
    private int reCnt;
    private int contentIdx;
    private String memNm;

    private int attachNo;
    private String fileNm;
    private String filePath;
    private String orgFileNm;
    private String fileSize;
}
