package com.zinidata.bizmap.mapper;

import com.zinidata.bizmap.vo.BizAnalysisVO;
import com.zinidata.bizmap.vo.output.BizAnalysisOutVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface BizAnalysisMapper {

    ArrayList<BizAnalysisOutVO> getAdmiFeatures(BizAnalysisVO bizAnalysisVO);

    ArrayList<BizAnalysisOutVO> getStoreCnt(BizAnalysisVO bizAnalysisVO);

    int setReportAnalNo(BizAnalysisVO bizAnalysisVO);

    ArrayList<BizAnalysisOutVO> getFreeReport(BizAnalysisVO bizAnalysisVO);

}
