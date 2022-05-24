package com.zinidata.bizmap.service;

import com.google.gson.Gson;
import com.zinidata.bizmap.mapper.BizAnalysisMapper;
import com.zinidata.bizmap.vo.BizAnalysisVO;
import com.zinidata.bizmap.vo.BizAnalysisVO;
import com.zinidata.bizmap.vo.output.BizAnalysisOutVO;
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
        // 보고서 정보 json 데이터로 저장하기
        ArrayList<BizAnalysisOutVO> outVo = bizAnalysisMapper.getFreeReport(bizAnalysisVO);
        Gson gson = new Gson();
        String result = gson.toJson(outVo);




        return result;
    }
}
