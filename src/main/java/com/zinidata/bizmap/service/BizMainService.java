package com.zinidata.bizmap.service;

import com.zinidata.bizmap.mapper.BizMainMapper;
import com.zinidata.bizmap.vo.BizCertVO;
import com.zinidata.bizmap.vo.BizSubscribeVO;
import com.zinidata.common.vo.ComUpjongVO;
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
import javax.servlet.http.HttpSession;
import java.net.InetAddress;
import java.net.URLDecoder;
import java.net.UnknownHostException;
import java.sql.*;
import java.util.ArrayList;

@Slf4j
@RequiredArgsConstructor
@Service
public class BizMainService {

    @Autowired
    GsonUtil gsonUtil;

    @Value("${bizmap.reports.trancallback}")
    private String tranCallback;

    @Value("${bizmap.url}")
    private String adminUrl;

    private final BizMainMapper bizMainMapper;

    PreparedStatement pstmt = null;

    public String setCert(HttpServletRequest request, BizCertVO bizCertVO) throws SQLException, UnknownHostException {
        String result = "";

        // 여러번 발송한 ip인지 확인
        InetAddress ip = InetAddress.getLocalHost();
        bizCertVO.setIpAddr(ip.getHostAddress());
        int certCnt = bizMainMapper.getCertCnt(bizCertVO);

        // 동일한 IP 에서 최근 1시간 내 전송 횟수 10건 초화 잠시뒤 요청
        if(certCnt > 10){
            result = gsonUtil.toJson(new JsonOutputVo(Status.실패, certCnt));

        }else{
            // 인증번호 발송
            int randomStr = BizmapUtil.certNumber();
            bizCertVO.setRandomStr(randomStr);
            bizCertVO.setTranCallback(tranCallback);
            bizCertVO.setTranMsg("[나이스비즈맵]고객님의SMS인증번호는 " + randomStr + " 입니다.\n정확히 입력해 주세요");

            // 인증번호 seqNo 가져오기
            BizCertVO outVo = bizMainMapper.getCertSeqNo(bizCertVO);
            bizCertVO.setSeqNo(outVo.getSeqNo());

            // em_tran set
            bizMainMapper.setCert(bizCertVO);
            // tb_cellphone_cert set
            bizMainMapper.setCellPhoneCert(bizCertVO);

            // 구독정보 sms 발송
            int cnt = 0;
            ConnFactorySms smsSql = new ConnFactorySms();
            Connection conn = smsSql.createConnection();
            Statement state = conn.createStatement();
            conn.setAutoCommit(false);

            String query = "Insert into em_tran(tran_phone, tran_callback, tran_status, tran_date, tran_msg , tran_type, tran_rslt) \n" +
                    "select '" + bizCertVO.getMobileNo() + "', '1566-2122','1',now() , concat('[나이스비즈맵]고객님의 SMS인증번호는 "+ randomStr +" 입니다. 정확히 입력해주세요.'), '4' ,'0'";
            log.info("-----------------인증번호 문자-------------");
            log.info(query);
            state.executeUpdate(query);
            conn.commit();

            state.close();
            conn.close();

            result = gsonUtil.toJson(new JsonOutputVo(Status.생성, bizCertVO));

        }
        return result;

    }

    public String getCert(HttpServletRequest request, BizCertVO bizCertVO){
        String result = "";

        // 날짜 업데이트
        bizMainMapper.setCertCrtDateUpdate(bizCertVO);
        // 인증번호 정보 가져오기
        BizCertVO outVo = bizMainMapper.getCertInfo(bizCertVO);

        if(outVo.getCertNo().length() > 0){
            result = gsonUtil.toJson(new JsonOutputVo(Status.조회, outVo));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.실패));
        }

        return result;

    }

    public String setSubscribe(HttpServletRequest request, BizSubscribeVO bizSubscribeVO) throws SQLException {
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

        if(subscribeCnt > 0){

            // 구독정보 sms 발송
            int cnt = 0;
            ConnFactorySms smsSql = new ConnFactorySms();
            Connection conn = smsSql.createConnection();
            Statement state = conn.createStatement();
            conn.setAutoCommit(false);
            String query = "select count(*) cnt from tb_subscribe_info where mobile_no='" + bizSubscribeVO.getMobileNo() + "'";
            pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()){
                cnt = rs.getInt("cnt");
            }

            String upjong_nm =  bizSubscribeVO.getUpjongNm();
            String admi_nm = bizSubscribeVO.getAreaNm();
//            String upjong_nm =  URLDecoder.decode(dic.get("upjong_nm", ""), "utf-8").replaceAll("@@", ">");
//            String admi_nm = URLDecoder.decode(dic.get("admi_nm", ""), "utf-8");
            if(cnt > 0){
                //update
                if(bizSubscribeVO.getGubun().equals("1") ){
                    query = "update tb_subscribe_info set mem_type = '" + bizSubscribeVO.getMemType()
                            +"', interest_areacd = '" + bizSubscribeVO.getInterestAreacd()
                            +"', interest_upjong='" + bizSubscribeVO.getInterestUpjong()
                            +"', free_yn='" + 1
                            +"', admi_nm='" + bizSubscribeVO.getAreaNm()
                            +"', upjong_nm='" + bizSubscribeVO.getUpjongNm()
                            +"', use_yn='1'"
                            +", update_date=now()"
                            +", send_date=null where mobile_no='" + bizSubscribeVO.getMobileNo() + "'";
                }else{// 구독 취소
                    query = "update tb_subscribe_info set use_yn = '0', update_date=now() where mobile_no='" + bizSubscribeVO.getMobileNo() + "'";
                }
                log.info("-----------------구독정보-------------");
                state.executeUpdate(query);
                conn.commit();
            }else{
                //insert
                query = "insert into tb_subscribe_info(mobile_no, mem_type, interest_areacd, interest_upjong, use_yn, free_yn, admi_nm, upjong_nm, update_date)" +
                        "values ('" + bizSubscribeVO.getMobileNo() +"','" + bizSubscribeVO.getMemType() +"','" + bizSubscribeVO.getInterestAreacd() +"','"
                        + bizSubscribeVO.getInterestUpjong() +"','1','" + 1 +"','"
                        + bizSubscribeVO.getAreaNm() +"','" + bizSubscribeVO.getUpjongNm() +"', now())";

                log.info("-----------------구독정보-------------");
                log.info(query);
                state.executeUpdate(query);
                conn.commit();
            }

            String message = "[bizmap-기본보고서]\\n";
            message += adminUrl + "/reportFree?admi=" + bizSubscribeVO.getInterestAreacd();
            message += "&upjong=" + bizSubscribeVO.getInterestUpjong();
            log.info(message);

            query = "Insert into em_tran(tran_phone, tran_callback, tran_status, tran_date, tran_msg , tran_type, tran_rslt) \n" +
                    "select '" + bizSubscribeVO.getMobileNo() + "', '1566-2122','1',now() , '" + message + "', '4' ,'0'";

//            query = "Insert into em_tran( tran_phone, tran_callback, tran_status, tran_date, tran_msg , tran_type, tran_rslt) \n" +
//                    "select " + bizSubscribeVO.getMobileNo() + "', '1566-2122','1',now() , concat('[bizmap-기본보고서]\\n','" + adminUrl + "/reportFree?admi=','" + bizSubscribeVO.getInterestAreacd() + "','&upjong=','" + bizSubscribeVO.getInterestUpjong() + "'), '4' ,'0'";
            log.info("-----------------구독정보 문자-------------");
            log.info(query);
            state.executeUpdate(query);
            conn.commit();

            state.close();
            conn.close();


            result = gsonUtil.toJson(new JsonOutputVo(Status.생성));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.실패));
        }

        return result;
    }

}
