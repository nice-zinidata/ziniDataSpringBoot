package com.zinidata.bizmap.service;

import com.google.gson.Gson;
import com.zinidata.bizmap.mapper.BizAnalysisMapper;
import com.zinidata.bizmap.vo.BizAnalysisVO;
import com.zinidata.bizmap.vo.BizAnalysisVO;
import com.zinidata.bizmap.vo.output.BizAnalysisOutVO;
import com.zinidata.bizmap.vo.output.BizFreeReportOutVO;
import com.zinidata.util.BizmapUtil;
import com.zinidata.util.GsonUtil;
import com.zinidata.util.JsonOutputVo;
import com.zinidata.util.Status;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@Slf4j
@RequiredArgsConstructor
@Service
public class BizAnalysisService {


    @Autowired
    GsonUtil gsonUtil;

    private final BizAnalysisMapper bizAnalysisMapper;

    @Value("${bizmap.reports.dataset}")
    private String repotsDir;

    public String admiFeatures(BizAnalysisVO bizAnalysisVO){
        ArrayList<BizAnalysisOutVO> outVo = bizAnalysisMapper.getAdmiFeatures(bizAnalysisVO);

        String result = "";
        if(!BizmapUtil.isEmpty(outVo)){
            // 로그인 성공
            result = gsonUtil.toJson(new JsonOutputVo(Status.조회, outVo));
        }else{
            // 로그인 실패
            result = gsonUtil.toJson(new JsonOutputVo(Status.실패));
        }

        return result;
    }


    // 보고서 정보 가져오기
    public String getFreeReport(BizAnalysisVO bizAnalysisVO) throws IOException {
        String result = "";
                // 보고서가 있는지 체크
        BizFreeReportOutVO outVo = bizAnalysisMapper.getFreeReport(bizAnalysisVO);
        // 보고서가 없는경우 생성
        if(BizmapUtil.isEmpty(outVo)){
            // 1. 보고서 정보 조회
            ArrayList<BizAnalysisOutVO> reportOutVo = bizAnalysisMapper.getAdmiFeatures(bizAnalysisVO);
            result = gsonUtil.toJson(new JsonOutputVo(Status.조회, reportOutVo));

            // 2. 보고서 정보 저장
            bizAnalysisVO.setJsonData(result);
            int setReport = bizAnalysisMapper.setFreeReport(bizAnalysisVO);
        }else{
            bizAnalysisMapper.setFreeReportCnt(bizAnalysisVO);
            // json data바로 보내기
            result = outVo.getJsonData();
        }

        return result;
    }
}
