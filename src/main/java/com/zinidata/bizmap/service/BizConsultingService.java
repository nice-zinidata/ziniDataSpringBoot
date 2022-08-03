package com.zinidata.bizmap.service;

import com.zinidata.bizmap.mapper.BizConsultingMapper;
import com.zinidata.bizmap.vo.BizAttachVO;
import com.zinidata.bizmap.vo.BizConsultingVO;
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
public class BizConsultingService {


    @Autowired
    GsonUtil gsonUtil;

    private final BizConsultingMapper bizConsultingMapper;


    public String getConsulting(BizConsultingVO bizConsultingVO){
        // 공지사항 목록
        ArrayList<BizConsultingVO> outVo = bizConsultingMapper.getConsulting(bizConsultingVO);
        HashMap <String, ArrayList<BizConsultingVO>> map = new HashMap<>();

        String result = "";

        // 조회수 증가
        if(bizConsultingVO.getBoardDtlNo() > 0){
            // 게시글에 비밀번호가 있는경우
            if(!BizmapUtil.isEmpty(outVo.get(0).getPassword())){
                // 비밀번호 비교
                if(outVo.get(0).getPassword().equals(bizConsultingVO.getPassword())) {
//                    조회수 증가
                    bizConsultingMapper.setConsultingQuertyCntUpdate(bizConsultingVO);
                }else {
                    // 비밀번호 오류 메시지
                    result = gsonUtil.toJson(new JsonOutputVo(Status.비밀번호오류));
                    return result;
                }
            }else{
                // 조회수 증가
                bizConsultingMapper.setConsultingQuertyCntUpdate(bizConsultingVO);
            }
        }

        // 상세 조회일때만 첨부문서 목록 보여지도록
        if(bizConsultingVO.getBoardDtlNo() != 0){
            ArrayList<BizConsultingVO> outVo2 = bizConsultingMapper.getAttach(bizConsultingVO);
            map.put("attach",outVo2);
        }
        map.put("consulting",outVo);

        if(!BizmapUtil.isEmpty(map)){
            // 로그인 성공
            result = gsonUtil.toJson(new JsonOutputVo(Status.조회, map));
        }else{
            // 로그인 실패
            result = gsonUtil.toJson(new JsonOutputVo(Status.실패));
        }

        return result;
    }

    public String setConsulting(BizConsultingVO bizConsultingVO){
        // 게시글 등록
        bizConsultingVO.setBoardDtlNo(bizConsultingMapper.getBoardSeq(bizConsultingVO));
        bizConsultingVO.setMemNo(bizConsultingVO.getMemNo());

        int output = bizConsultingMapper.setConsulting(bizConsultingVO);
        String result = "";
        if(output > 0){
            // 등록 성공
            result = gsonUtil.toJson(new JsonOutputVo(Status.성공, bizConsultingVO));
        }else{
            // 등록 실패
            result = gsonUtil.toJson(new JsonOutputVo(Status.실패));
        }

        return result;
    }

    public String setAttachInfo(BizAttachVO bizAttachVO){
        // 첨부파일 정보 등록
        int output = bizConsultingMapper.setAttachInfo(bizAttachVO);

        String result = "";
        if(output > 0){
            // 등록 성공
            result = gsonUtil.toJson(new JsonOutputVo(Status.성공));
        }else{
            // 등록 실패
            result = gsonUtil.toJson(new JsonOutputVo(Status.실패));
        }

        return result;
    }


}
