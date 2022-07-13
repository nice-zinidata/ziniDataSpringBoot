package com.zinidata.bizmap.mapper;

import com.zinidata.bizmap.vo.BizNoticeVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface BizNoticeMapper {

    ArrayList<BizNoticeVO> getNotice(BizNoticeVO bizNoticeVO);
    ArrayList<BizNoticeVO> getAttach(BizNoticeVO bizNoticeVO);

}
