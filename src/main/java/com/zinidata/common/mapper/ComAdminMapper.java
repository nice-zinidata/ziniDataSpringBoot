package com.zinidata.common.mapper;

import com.zinidata.common.vo.ComAreaVO;
import com.zinidata.common.vo.ComLoginVO;
import com.zinidata.common.vo.ComUpjongVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface ComAdminMapper {
    //로그인
    ArrayList<ComLoginVO> getMember(ComLoginVO comLoginVO);
    int setSession(ComLoginVO comLoginVO);
    int getLogAuthSeq(ComLoginVO comLoginVO);
    int setLogAuthSeq(ComLoginVO comLoginVO);

    // 선택한 지역 가져오기
    ArrayList<ComAreaVO> getArea(ComAreaVO comAreaVO);

    // 업종 가져오기
    ArrayList<ComUpjongVO> getUpjong(ComUpjongVO comUpjongVO);

}
