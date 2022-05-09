package com.zinidata.bizmap.mapper;

import com.zinidata.bizmap.vo.BizAnalysisVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface BizAnalysisMapper {
    ArrayList<BizAnalysisVO> getAdmiFeatures(BizAnalysisVO bizAnalysisVO);
    ArrayList<BizAnalysisVO> getStoreCnt(BizAnalysisVO bizAnalysisVO);
    int setReportAnalNo(BizAnalysisVO bizAnalysisVO);
    ArrayList<BizAnalysisVO> getFreeReport(BizAnalysisVO bizAnalysisVO);
}
