package com.zinidata.bizmap.service;

import com.zinidata.bizmap.mapper.BizRisingMapper;
import com.zinidata.bizmap.vo.BizRisingUpjongVO;
import com.zinidata.util.BizmapUtil;
import com.zinidata.util.GsonUtil;
import com.zinidata.util.JsonOutputVo;
import com.zinidata.util.Status;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Slf4j
@RequiredArgsConstructor
@Service
public class BizRisingService {


    @Autowired
    GsonUtil gsonUtil;

    private final BizRisingMapper bizRisingMapper;


    public String getRisingUpjong(BizRisingUpjongVO bizRisingUpjongVO){
        ArrayList<BizRisingUpjongVO> outVo = bizRisingMapper.getRisingUpjong(bizRisingUpjongVO);

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
