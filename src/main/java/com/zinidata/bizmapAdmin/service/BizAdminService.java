package com.zinidata.bizmapAdmin.service;

import com.zinidata.bizmap.mapper.BizAnalysisMapper;
import com.zinidata.bizmap.vo.BizAnalysisVO;
import com.zinidata.bizmap.vo.output.BizAnalysisOutVO;
import com.zinidata.bizmapAdmin.mapper.BizAdminMapper;
import com.zinidata.bizmapAdmin.vo.BizAdminVO;
import com.zinidata.util.BizmapUtil;
import com.zinidata.util.GsonUtil;
import com.zinidata.util.JsonOutputVo;
import com.zinidata.util.Status;
import com.zinidata.util.db.ConnFactorySms;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

@Slf4j
@RequiredArgsConstructor
@Service
public class BizAdminService {

    @Autowired
    GsonUtil gsonUtil;

    private final BizAdminMapper bizAdminMapper;

    public String memberList(HttpSession session, BizAdminVO bizAdminVO) {
        ArrayList<BizAdminVO> outVO = bizAdminMapper.rMemberList(bizAdminVO);
        String result = "";
        if(!BizmapUtil.isEmpty(outVO)){
            // 성공
            result = gsonUtil.toJson(new JsonOutputVo(Status.조회, outVO));
        }else{
            // 실패
            result = gsonUtil.toJson(new JsonOutputVo(Status.실패));
        }
        return result;
    }

    public String memberHstList(HttpSession session, BizAdminVO bizAdminVO) {
        ArrayList<BizAdminVO> outVO = bizAdminMapper.rMemberHstList(bizAdminVO);
        ArrayList<BizAdminVO> outVO2 = bizAdminMapper.rFranMemberList(bizAdminVO);
        ArrayList<BizAdminVO> outVO3 = bizAdminMapper.rMemberList(bizAdminVO);

//        outVO2.get(0).setUpdDtStr(outVO.get(0).getUpdDtStr());


        HashMap<String, ArrayList<BizAdminVO>> map = new HashMap<>();
        map.put("rMemberHstList", outVO);
        map.put("rFranMemberList", outVO2);
        map.put("rMemberList", outVO3);


        String result = "";
        if(!BizmapUtil.isEmpty(outVO2)){
            // 성공
            result = gsonUtil.toJson(new JsonOutputVo(Status.조회, map));
        }else{
            // 실패
            result = gsonUtil.toJson(new JsonOutputVo(Status.실패));
        }
        return result;
    }

    public String svcList(HttpSession session, BizAdminVO bizAdminVO) {
        ArrayList<BizAdminVO> outVO = bizAdminMapper.rSvcList(bizAdminVO);
        String result = "";
        if(!BizmapUtil.isEmpty(outVO)){
            // 성공
            result = gsonUtil.toJson(new JsonOutputVo(Status.조회, outVO));
        }else{
            // 실패
            result = gsonUtil.toJson(new JsonOutputVo(Status.실패));
        }
        return result;
    }
}
