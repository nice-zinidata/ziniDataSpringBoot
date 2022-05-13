package com.zinidata.bizmap.service;

import com.zinidata.bizmap.mapper.BizMainMapper;
import com.zinidata.bizmap.vo.BizMainVO;
import com.zinidata.config.SecureHashAlgorithm;
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

@Slf4j
@RequiredArgsConstructor
@Service
public class BizMainService {

    @Autowired
    GsonUtil gsonUtil;

    private final BizMainMapper bizMainMapper;

    public String login(HttpServletRequest request, BizMainVO bizMainVO) throws NoSuchAlgorithmException {
        String result = "";

//        System.out.println(SecureHashAlgorithm.encryptSHA256(bizMainVO.getPwd()));
        bizMainVO.setPwd(SecureHashAlgorithm.encryptSHA256(bizMainVO.getPwd()));

        ArrayList<BizMainVO> outVo = bizMainMapper.getMember(bizMainVO);

        // session update
        HttpSession session = request.getSession(true);

        bizMainVO.setMemNo(outVo.get(0).getMemNo());
        bizMainVO.setLoginSession(session.getId());
        bizMainVO.setLoginTimestemp(System.currentTimeMillis());
        int sessionUpdate = bizMainMapper.setSession(bizMainVO);

        // session update 성공
        if(sessionUpdate > 0){
            int loginAutnSeq = bizMainMapper.getLogAuthSeq(bizMainVO);
            bizMainVO.setLoginAutnSeq(loginAutnSeq);
            bizMainVO.setIpAddr("::1");
            int setLogAuthResult = bizMainMapper.setLogAuthSeq(bizMainVO);

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

}
