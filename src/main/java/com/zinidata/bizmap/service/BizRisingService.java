package com.zinidata.bizmap.service;

import com.zinidata.bizmap.mapper.BizAnalysisMapper;
import com.zinidata.bizmap.mapper.BizRisingMapper;
import com.zinidata.bizmap.vo.BizAnalysisVO;
import com.zinidata.bizmap.vo.BizRisingUpjongVO;
import com.zinidata.bizmap.vo.output.BizAnalysisOutVO;
import com.zinidata.util.BizmapUtil;
import com.zinidata.util.GsonUtil;
import com.zinidata.util.JsonOutputVo;
import com.zinidata.util.Status;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@RequiredArgsConstructor
@Service
public class BizRisingService {


    @Autowired
    GsonUtil gsonUtil;

    private final BizAnalysisMapper bizAnalysisMapper;
    private final BizRisingMapper bizRisingMapper;


    public String getRisingUpjong(BizRisingUpjongVO bizRisingUpjongVO){

        // 지금 위치한 지역 정보
        BizAnalysisVO bizAnalysisVO = new BizAnalysisVO();
        bizAnalysisVO.setXAxis(bizRisingUpjongVO.getXAxis());
        bizAnalysisVO.setYAxis(bizRisingUpjongVO.getYAxis());
        ArrayList<BizAnalysisOutVO> outVo = bizAnalysisMapper.getAdmiFeatures(bizAnalysisVO);

        // 지역정보 동에 대한 뜨는 업종
        bizRisingUpjongVO.setAdmiCd(outVo.get(0).getAdmiCd());
        ArrayList<BizRisingUpjongVO> outVo2 = bizRisingMapper.getRisingUpjong(bizRisingUpjongVO);

        HashMap map = new HashMap();
        map.put("admiFeatures", outVo);
        map.put("rising", outVo2);

        String result = "";
        if(!BizmapUtil.isEmpty(map)){
            // 로그인 성공
            result = gsonUtil.toJson(new JsonOutputVo(Status.조회, map));
        }else{
            // 로그인 실패
            result = gsonUtil.toJson(new JsonOutputVo(Status.실패));
        }

        return result;
    }


}
