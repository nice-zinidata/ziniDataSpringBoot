package com.zinidata.bizmapAdmin.service;

import com.zinidata.bizmapAdmin.vo.BizAdminVO;
import com.zinidata.util.BizmapUtil;
import com.zinidata.util.GsonUtil;
import com.zinidata.util.JsonOutputVo;
import com.zinidata.util.Status;
import com.zinidata.util.db.ConnFactorySms;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.sql.*;

@Slf4j
@RequiredArgsConstructor
@Service
public class BizAdminService {

    @Autowired
    GsonUtil gsonUtil;

    @Value("${bizmap.reports.trancallback}")
    private String tranCallback;

    private final com.zinidata.bizmapAdmin.mapper.BizAdminMapper BizAdminMapper;

    PreparedStatement pstmt = null;

    public String setCert(HttpServletRequest request, BizAdminVO BizAdminVO) throws SQLException {
        String result = "";

        // 여러번 발송한 ip인지 확인
        BizAdminVO.setIpAddr(request.getRemoteAddr());
        int certCnt = BizAdminMapper.getCertCnt(BizAdminVO);

        // 동일한 IP 에서 최근 1시간 내 전송 횟수 10건 초화 잠시뒤 요청
        if(certCnt > 10){
            result = gsonUtil.toJson(new JsonOutputVo(Status.실패));

        }else{
            // 인증번호 발송
            BizAdminVO.setRandomStr(BizmapUtil.certNumber());
            BizAdminVO.setTranCallback(tranCallback);
            BizAdminVO.setTranMsg("[나이스비즈맵]고객님의 SMS인증번호는 " + BizmapUtil.certNumber() + " 입니다.\n정확히 입력해 주세요");

            // 인증번호 seqNo 가져오기
            BizAdminVO outVo = BizAdminMapper.getCertSeqNo(BizAdminVO);
            BizAdminVO.setSeqNo(outVo.getSeqNo());

            // em_tran set
            BizAdminMapper.setCert(BizAdminVO);
            // tb_cellphone_cert set
            BizAdminMapper.setCellPhoneCert(BizAdminVO);


            // 인증번호 sms 발송
            ConnFactorySms smsSql = new ConnFactorySms();
            Connection conn = smsSql.createConnection();
            Statement state = conn.createStatement();
            conn.setAutoCommit(false);
            String query = "SELECT user_id FROM tb_user";
            pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                System.out.println(rs.getString("user_id"));
            }


            result = gsonUtil.toJson(new JsonOutputVo(Status.생성, outVo));

        }
        return result;

    }

    public String getCert(HttpServletRequest request, BizAdminVO BizAdminVO){
        String result = "";

        // 날짜 업데이트
        BizAdminMapper.setCertCrtDateUpdate(BizAdminVO);
        // 인증번호 정보 가져오기
        BizAdminVO outVo = BizAdminMapper.getCertInfo(BizAdminVO);

        if(outVo.getCertNo().length() > 0){
            result = gsonUtil.toJson(new JsonOutputVo(Status.조회, outVo));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.실패));
        }

        return result;

    }

//    public String setSubscribe(HttpServletRequest request, BizSubscribeVO bizSubscribeVO){
//        String result = "";
//        // 기존에 구독 정보가 있는지 체크
//        int subscribeCnt = BizAdminMapper.getSubscribe(bizSubscribeVO);
//        // 구독정보가 있으면 update
//        if(subscribeCnt > 0){
//            BizAdminMapper.setSubscribeUpd(bizSubscribeVO);
//        }else {
//            // 구독정보가 없으면 insert
//            BizAdminMapper.setSubscribeIns(bizSubscribeVO);
//        }
//        // 구독정보 들어갔는지 체크
//        subscribeCnt = BizAdminMapper.getSubscribe(bizSubscribeVO);
//
//        if(subscribeCnt > 0){
//            result = gsonUtil.toJson(new JsonOutputVo(Status.생성));
//        }else{
//            result = gsonUtil.toJson(new JsonOutputVo(Status.실패));
//        }
//
//        return result;
//    }

}
