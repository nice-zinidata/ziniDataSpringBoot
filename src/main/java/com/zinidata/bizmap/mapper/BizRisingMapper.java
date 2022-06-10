package com.zinidata.bizmap.mapper;

import com.zinidata.bizmap.vo.BizRisingUpjongVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface BizRisingMapper {

    ArrayList<BizRisingUpjongVO> getRisingUpjong(BizRisingUpjongVO bizRisingUpjongVO);

}