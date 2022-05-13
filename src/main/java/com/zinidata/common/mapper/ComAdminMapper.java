package com.zinidata.common.mapper;

import com.zinidata.common.vo.ComAreaVO;
import com.zinidata.common.vo.ComUpjongVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.HashMap;

@Mapper
public interface ComAdminMapper {

    // 선택한 지역 가져오기
    ArrayList<ComAreaVO> getArea(ComAreaVO comAreaVO);

    // 업종 가져오기
    ArrayList<ComUpjongVO> getUpjong(ComUpjongVO comUpjongVO);

}
