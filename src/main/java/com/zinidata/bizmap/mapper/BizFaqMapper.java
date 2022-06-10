package com.zinidata.bizmap.mapper;

import com.zinidata.bizmap.vo.BizFaqVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface BizFaqMapper {

    ArrayList<BizFaqVO> getFaq(BizFaqVO bizFaqVO);

}