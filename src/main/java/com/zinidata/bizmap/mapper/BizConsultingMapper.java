package com.zinidata.bizmap.mapper;

import com.zinidata.bizmap.vo.BizAttachVO;
import com.zinidata.bizmap.vo.BizConsultingVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface BizConsultingMapper {

    ArrayList<BizConsultingVO> getConsulting(BizConsultingVO bizConsultingVO);
    ArrayList<BizConsultingVO> getAttach(BizConsultingVO bizConsultingVO);
    int setConsultingQuertyCntUpdate(BizConsultingVO bizConsultingVO);

    int getBoardSeq(BizConsultingVO bizConsultingVO);
    int setConsulting(BizConsultingVO bizConsultingVO);
    int setAttachInfo(BizAttachVO bizAttachVO);

}
