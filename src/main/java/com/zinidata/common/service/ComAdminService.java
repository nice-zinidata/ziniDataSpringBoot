package com.zinidata.common.service;

import com.zinidata.bizmap.vo.BizMainVO;
import com.zinidata.common.mapper.ComAdminMapper;
import com.zinidata.common.vo.ComAreaVO;
import com.zinidata.common.vo.ComLoginVO;
import com.zinidata.common.vo.ComUpjongVO;
import com.zinidata.config.SecureHashAlgorithm;
import com.zinidata.util.BizmapUtil;
import com.zinidata.util.GsonUtil;
import com.zinidata.util.JsonOutputVo;
import com.zinidata.util.Status;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;

@Slf4j
@RequiredArgsConstructor
@Service
public class ComAdminService {

    @Autowired
    GsonUtil gsonUtil;

    private final ComAdminMapper comAdminMapper;

    public String login(HttpServletRequest request, ComLoginVO comLoginVO) throws NoSuchAlgorithmException {
        String result = "";

//        System.out.println(SecureHashAlgorithm.encryptSHA256(bizMainVO.getPwd()));
        comLoginVO.setPwd(SecureHashAlgorithm.encryptSHA256(comLoginVO.getPwd()));

        ArrayList<ComLoginVO> outVo = comAdminMapper.getMember(comLoginVO);

        // session update
        HttpSession session = request.getSession(true);

        comLoginVO.setMemNo(outVo.get(0).getMemNo());
        comLoginVO.setLoginSession(session.getId());
        comLoginVO.setLoginTimestemp(System.currentTimeMillis());
        int sessionUpdate = comAdminMapper.setSession(comLoginVO);

        // session update 성공
        if(sessionUpdate > 0){
            int loginAutnSeq = comAdminMapper.getLogAuthSeq(comLoginVO);
            comLoginVO.setLoginAutnSeq(loginAutnSeq);
            comLoginVO.setIpAddr("::1");
            int setLogAuthResult = comAdminMapper.setLogAuthSeq(comLoginVO);

            if(setLogAuthResult > 0){
                // 로그인 성공
                result = gsonUtil.toJson(new JsonOutputVo(Status.조회, outVo));
            }else{
                // 로그인 실패
                result = gsonUtil.toJson(new JsonOutputVo(Status.실패));
            }
        }else{
            // session update 실패
            result = gsonUtil.toJson(new JsonOutputVo(Status.실패));
        }

        return result;
    }

    public String getArea(HttpServletRequest request, ComAreaVO comAreaVO){
        String result = "";

        ArrayList<ComAreaVO> outVo = comAdminMapper.getArea(comAreaVO);

        if(!BizmapUtil.isEmpty(outVo)){
            result = gsonUtil.toJson(new JsonOutputVo(Status.조회, outVo));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.실패));
        }

        return result;
    }

    public String getUpjong(HttpServletRequest request, ComUpjongVO comUpjongVO){
        String result = "";

        HashMap<String, ArrayList<ComUpjongVO>> map = new HashMap<>();
        ArrayList<ComUpjongVO> outVo = comAdminMapper.getUpjong(comUpjongVO);
        if(comUpjongVO.getGubun().equals("upjong2")){

            ComUpjongVO inputVo = new ComUpjongVO();
            inputVo.setGubun("upjong3");
            inputVo.setUpjong1Cd(comUpjongVO.getUpjong1Cd());

            ArrayList<ComUpjongVO> outVo2 = comAdminMapper.getUpjong(inputVo);
            map.put("upjong2", outVo);
            map.put("upjong3", outVo2);
        }else{
            map.put("upjong1", outVo);
        }

        if(!BizmapUtil.isEmpty(map)){
            result = gsonUtil.toJson(new JsonOutputVo(Status.조회, map));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.실패));
        }

        return result;
    }

}
