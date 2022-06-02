package com.zinidata.bizmap.mapper;

import com.zinidata.bizmap.vo.BizFlowpopVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface BizFlowpopMapper {

    ArrayList<BizFlowpopVO> getFlowpop(BizFlowpopVO bizFlowpopVO);

}
