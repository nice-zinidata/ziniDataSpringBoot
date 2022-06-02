package com.zinidata.bizmap.service;

import com.zinidata.bizmap.mapper.BizYouTubeMapper;
import com.zinidata.bizmap.vo.BizYouTubeVO;
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
public class BizYouTubeService {


    @Autowired
    GsonUtil gsonUtil;

    private final BizYouTubeMapper bizYouTubeMapper;

    @Value("${bizmap.youtube.url}")
    private String youtubeUrl;

    public String getYouTube(BizYouTubeVO bizYouTubeVO){
        ArrayList<BizYouTubeVO> outVo = bizYouTubeMapper.getYouTube(bizYouTubeVO);

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
