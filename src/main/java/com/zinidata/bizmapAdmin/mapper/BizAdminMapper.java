package com.zinidata.bizmapAdmin.mapper;

import com.zinidata.bizmapAdmin.vo.BizAdminVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BizAdminMapper {

    // 인증번호 발송횟수 체크
    int getCertCnt(BizAdminVO BizAdminVO);

    // 인증번호 발송
    BizAdminVO getCertSeqNo(BizAdminVO BizAdminVO);
    int setCert(BizAdminVO BizAdminVO);
    int setCellPhoneCert(BizAdminVO BizAdminVO);

    // 인증번호 정보 가져오기
    int setCertCrtDateUpdate(BizAdminVO BizAdminVO);
    BizAdminVO getCertInfo(BizAdminVO BizAdminVO);


    // 구독정보 있는지 확인
//    int getSubscribe(BizSubscribeVO bizSubscribeVO);
    // 구독정보 등록
//    int setSubscribeIns(BizSubscribeVO bizSubscribeVO);
    // 구독정보 수정
//    int setSubscribeUpd(BizSubscribeVO bizSubscribeVO);

}
