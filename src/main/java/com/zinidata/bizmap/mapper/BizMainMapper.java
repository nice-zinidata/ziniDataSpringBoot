package com.zinidata.bizmap.mapper;

import com.zinidata.bizmap.vo.BizCertVO;
import com.zinidata.bizmap.vo.BizMainVO;
import com.zinidata.bizmap.vo.BizSubscribeVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface BizMainMapper {

    // 인증번호 발송횟수 체크
    int getCertCnt(BizCertVO bizCertVO);

    // 인증번호 발송
    BizCertVO getCertSeqNo(BizCertVO bizCertVO);
    int setCert(BizCertVO bizCertVO);
    int setCellPhoneCert(BizCertVO bizCertVO);

    // 인증번호 정보 가져오기
    int setCertCrtDateUpdate(BizCertVO bizCertVO);
    BizCertVO getCertInfo(BizCertVO bizCertVO);


    // 구독정보 있는지 확인
    int getSubscribe(BizSubscribeVO bizSubscribeVO);
    // 구독정보 등록
    int setSubscribeIns(BizSubscribeVO bizSubscribeVO);
    // 구독정보 수정
    int setSubscribeUpd(BizSubscribeVO bizSubscribeVO);

}
