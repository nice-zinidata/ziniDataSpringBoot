package com.zinidata.bizmap.mapper;

import com.zinidata.bizmap.vo.BizMainVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface BizMainMapper {

    ArrayList<BizMainVO> getMember(BizMainVO bizMainVO);
    int setSession(BizMainVO bizMainVO);
    int getLogAuthSeq(BizMainVO bizMainVO);
    int setLogAuthSeq(BizMainVO bizMainVO);

}
