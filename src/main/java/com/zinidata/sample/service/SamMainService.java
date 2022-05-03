package com.zinidata.sample.service;

import com.google.gson.Gson;
import com.zinidata.config.Sha256;
import com.zinidata.sample.mapper.SamMainMapper;
import com.zinidata.sample.vo.SamLoginVO;
import com.zinidata.sample.vo.SamMainListVO;
import com.zinidata.util.BizmapUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@RequiredArgsConstructor
@Service
public class SamMainService {

    private final SamMainMapper samMainMapper;

    public String loginProc(SamLoginVO samLoginVO, HttpSession session) throws NoSuchAlgorithmException {
        Sha256 sha256 = new Sha256();
        String password = sha256.encrypt(samLoginVO.getPassword());
        samLoginVO.setPassword(password);

        SamLoginVO outVo = samMainMapper.getUser(samLoginVO);
        if(!BizmapUtil.isEmpty(outVo)){
            log.info("### Login Result userId ==> {}", outVo.getUserId());
        }

        session.setAttribute("userId" , outVo.getUserId());
        session.setAttribute("userName" , outVo.getUserName());

        Gson gson = new Gson();
        String result = gson.toJson(outVo);

        return result;
    }

    public String getUserCheck(SamLoginVO samLoginvO) throws NoSuchAlgorithmException {

        SamLoginVO outVo = samMainMapper.getUserCheck(samLoginvO);
        Gson gson = new Gson();
        String result = gson.toJson(outVo);
         System.out.println(result);

        return result;
    }

    public String setSignUpProc(SamLoginVO loginVO) throws NoSuchAlgorithmException {

        Sha256 sha256 = new Sha256();
        String password = sha256.encrypt(loginVO.getUserPw());
        loginVO.setUserPw(password);

        SamLoginVO outVo = samMainMapper.getUserCheck(loginVO);
        if(!BizmapUtil.isEmpty(outVo)){
            return "이미 회원가입된 아이디";
        }

        // 회원가입
        samMainMapper.setSignUpProc(loginVO);

        Gson gson = new Gson();
        String result = gson.toJson(outVo);

        System.out.println(result);
        return result;
    }


    public String getMainList(SamMainListVO samMainListVO){

        ArrayList<Map<String,String>> list = new ArrayList<>();
        for(int i=0;i<20;i++){
            Map<String,String> map = new HashMap<>();
            map.put("data1", Integer.toString(i));
            map.put("data2", Integer.toString(i+1));
            map.put("data3", Integer.toString(i+2));
            map.put("data4", Integer.toString(i+3));
            list.add(map);
        }

        Map<String,ArrayList> map = new HashMap<>();;
        map.put("data",list);

        Gson gson = new Gson();
        String result = gson.toJson(map);

        return result;
    }

}
