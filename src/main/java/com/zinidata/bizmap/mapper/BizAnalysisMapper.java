package com.zinidata.bizmap.mapper;

import com.zinidata.bizmap.vo.BizAnalysisVO;
import com.zinidata.bizmap.vo.output.BizAnalysisOutVO;
import com.zinidata.bizmap.vo.output.BizFreeReportOutVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface BizAnalysisMapper {

    ArrayList<BizAnalysisOutVO> getAdmiFeatures(BizAnalysisVO bizAnalysisVO);

    int setReportAnalNo(BizAnalysisVO bizAnalysisVO);

    BizFreeReportOutVO getFreeReport(BizAnalysisVO bizAnalysisVO);
    int setFreeReport(BizAnalysisVO bizAnalysisVO);
    int setFreeReportCnt(BizAnalysisVO bizAnalysisVO);

}
