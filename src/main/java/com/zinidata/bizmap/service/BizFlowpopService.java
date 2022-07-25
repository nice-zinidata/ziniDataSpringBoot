package com.zinidata.bizmap.service;

import com.zinidata.bizmap.mapper.BizAnalysisMapper;
import com.zinidata.bizmap.mapper.BizFlowpopMapper;
import com.zinidata.bizmap.vo.BizAnalysisVO;
import com.zinidata.bizmap.vo.BizFlowpopVO;
import com.zinidata.bizmap.vo.output.BizAnalysisOutVO;
import com.zinidata.util.BizmapUtil;
import com.zinidata.util.GsonUtil;
import com.zinidata.util.JsonOutputVo;
import com.zinidata.util.Status;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Slf4j
@RequiredArgsConstructor
@Service
public class BizFlowpopService {


    @Autowired
    GsonUtil gsonUtil;

    private final BizFlowpopMapper bizFlowpopMapper;

    private final BizAnalysisMapper bizAnalysisMapper;


    public String getFlowpop(BizFlowpopVO bizFlowpopVO){
        ArrayList<BizFlowpopVO> outVo = bizFlowpopMapper.getFlowpop(bizFlowpopVO);

        BizAnalysisVO bizAnalysisVO = new BizAnalysisVO();
        bizAnalysisVO.setXAxis(bizFlowpopVO.getXAxis());
        bizAnalysisVO.setYAxis(bizFlowpopVO.getYAxis());

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


}
