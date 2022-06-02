package com.zinidata.bizmap.mapper;

import com.zinidata.bizmap.vo.BizDensityVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface BizDensityMapper {

    ArrayList<BizDensityVO> getDensity(BizDensityVO bizDensityVO);

}
