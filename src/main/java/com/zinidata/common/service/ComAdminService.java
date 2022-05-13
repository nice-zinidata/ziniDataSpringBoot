package com.zinidata.common.service;

import com.zinidata.common.mapper.ComAdminMapper;
import com.zinidata.common.vo.ComAreaVO;
import com.zinidata.common.vo.ComUpjongVO;
import com.zinidata.util.BizmapUtil;
import com.zinidata.util.GsonUtil;
import com.zinidata.util.JsonOutputVo;
import com.zinidata.util.Status;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;

@Slf4j
@RequiredArgsConstructor
@Service
public class ComAdminService {

    @Autowired
    GsonUtil gsonUtil;

    private final ComAdminMapper comAdminMapper;

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

        ArrayList<ComUpjongVO> outVo = comAdminMapper.getUpjong(comUpjongVO);

        if(!BizmapUtil.isEmpty(outVo)){
            result = gsonUtil.toJson(new JsonOutputVo(Status.조회, outVo));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.실패));
        }

        return result;
    }

}
