package com.zinidata.bizmap.service;

import com.zinidata.bizmap.mapper.BizMainMapper;
import com.zinidata.bizmap.vo.BizCertVO;
import com.zinidata.bizmap.vo.BizSubscribeVO;
import com.zinidata.common.vo.ComUpjongVO;
import com.zinidata.util.BizmapUtil;
import com.zinidata.util.GsonUtil;
import com.zinidata.util.JsonOutputVo;
import com.zinidata.util.Status;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Slf4j
@RequiredArgsConstructor
@Service
public class BizMainService {

    @Autowired
    GsonUtil gsonUtil;

    @Value("${bizmap.reports.trancallback}")
    private String tranCallback;

    private final BizMainMapper bizMainMapper;

    public String setCert(HttpServletRequest request, BizCertVO bizCertVO){
        String result = "";

        // 여러번 발송한 ip인지 확인
        bizCertVO.setIpAddr(request.getRemoteAddr());
        int certCnt = bizMainMapper.getCertCnt(bizCertVO);

        // 동일한 IP 에서 최근 1시간 내 전송 횟수 10건 초화 잠시뒤 요청
        if(certCnt > 10){
            result = gsonUtil.toJson(new JsonOutputVo(Status.실패));

        }else{
            // 인증번호 발송
            bizCertVO.setRandomStr(BizmapUtil.certNumber());
            bizCertVO.setTranCallback(tranCallback);
            bizCertVO.setTranMsg("[나이스비즈맵]고객님의SMS인증번호는 " + BizmapUtil.certNumber() + " 입니다.\n정확히 입력해 주세요");

            // 인증번호 seqNo 가져오기
            BizCertVO outVo = bizMainMapper.getCertSeqNo(bizCertVO);
            bizCertVO.setSeqNo(outVo.getSeqNo());

            // em_tran set
            bizMainMapper.setCert(bizCertVO);
            // tb_cellphone_cert set
            bizMainMapper.setCellPhoneCert(bizCertVO);

            result = gsonUtil.toJson(new JsonOutputVo(Status.생성, outVo));

        }
        return result;

    }

    public String getCert(HttpServletRequest request, BizCertVO bizCertVO){
        String result = "";

        // 날짜 업데이트
        bizMainMapper.setCertCrtDateUpdate(bizCertVO);
        // 인증번호 정보 가져오기
        BizCertVO outVo = bizMainMapper.getCertInfo(bizCertVO);

        if(bizCertVO.getCertNo().equals(outVo.getCertNo())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.조회, outVo));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.실패));
        }

        return result;

    }

    public String setSubscribe(HttpServletRequest request, BizSubscribeVO bizSubscribeVO){
        String result = "";
        // 기존에 구독 정보가 있는지 체크
        int subscribeCnt = bizMainMapper.getSubscribe(bizSubscribeVO);
        // 구독정보가 있으면 update
        if(subscribeCnt > 0){
            bizMainMapper.setSubscribeUpd(bizSubscribeVO);
        }else {
            // 구독정보가 없으면 insert
            bizMainMapper.setSubscribeIns(bizSubscribeVO);
        }
        // 구독정보 들어갔는지 체크
        subscribeCnt = bizMainMapper.getSubscribe(bizSubscribeVO);
        // sms 발송 넣기

        if(subscribeCnt > 0){
            result = gsonUtil.toJson(new JsonOutputVo(Status.생성));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.실패));
        }

        return result;
    }

}
