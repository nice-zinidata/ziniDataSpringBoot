package com.zinidata.bizmap.mapper;

import com.zinidata.bizmap.vo.BizYouTubeVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface BizYouTubeMapper {

    ArrayList<BizYouTubeVO> getYouTube(BizYouTubeVO bizYouTubeVO);


}
