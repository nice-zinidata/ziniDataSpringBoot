package com.zinidata.sample.mapper;

import com.zinidata.sample.vo.SamLoginVO;
import com.zinidata.sample.vo.SamMainVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SamMainMapper {
    SamMainVO getDate();
    SamLoginVO getUser(SamLoginVO samLoginVO);
    SamLoginVO getUserCheck(SamLoginVO samLoginVO);
    int setSignUpProc(SamLoginVO samLoginVO);
}
