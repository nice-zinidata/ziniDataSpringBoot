package com.zinidata.bizmap.service;

import com.zinidata.bizmap.mapper.BizNoticeMapper;
import com.zinidata.bizmap.vo.BizNoticeVO;
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

@Slf4j
@RequiredArgsConstructor
@Service
public class BizNoticeService {


    @Autowired
    GsonUtil gsonUtil;

    private final BizNoticeMapper bizNoticeMapper;


    public String getNotice(BizNoticeVO bizNoticeVO){
        // 공지사항 목록
        ArrayList<BizNoticeVO> outVo = bizNoticeMapper.getNotice(bizNoticeVO);
        HashMap <String, ArrayList<BizNoticeVO>> map = new HashMap<>();
        map.put("notice",outVo);

        // 상세 조회일때만 첨부문서 목록 보여지도록
        if(bizNoticeVO.getBoardDtlNo() != 0){
            ArrayList<BizNoticeVO> outVo2 = bizNoticeMapper.getAttach(bizNoticeVO);
            map.put("attach",outVo2);
        }

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
