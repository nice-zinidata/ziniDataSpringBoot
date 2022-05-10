package com.zinidata.bizmap.service;

import com.google.gson.Gson;
import com.zinidata.bizmap.mapper.BizAnalysisMapper;
import com.zinidata.bizmap.vo.BizAnalysisVO;
import com.zinidata.bizmap.vo.BizAnalysisVO;
import com.zinidata.util.BizmapUtil;
import com.zinidata.util.GsonUtil;
import com.zinidata.util.JsonOutputVo;
import com.zinidata.util.Status;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@Slf4j
@RequiredArgsConstructor
@Service
public class BizAnalysisService {


    @Autowired
    GsonUtil gsonUtil;

    private final BizAnalysisMapper bizAnalysisMapper;

    @Value("${bizmap.reports.dataset}")
    private String repotsDir;

    public String admiFeatures(BizAnalysisVO bizAnalysisVO){
        ArrayList<BizAnalysisVO> outVo = bizAnalysisMapper.getAdmiFeatures(bizAnalysisVO);
        ArrayList<BizAnalysisVO> outVo2 = bizAnalysisMapper.getStoreCnt(bizAnalysisVO);

        // 상가 데이터
        outVo.get(0).setStoreCnt(BizmapUtil.isEmpty(outVo2.get(0).getStoreCnt()) ? 0 : outVo2.get(0).getStoreCnt());

        String result = "";

        if(!BizmapUtil.isEmpty(outVo)){
            // 로그인 성공
            result = gsonUtil.toJson(new JsonOutputVo(Status.조회, outVo));
        }else{
            // 로그인 실패
            result = gsonUtil.toJson(new JsonOutputVo(Status.실패));
        }

        return result;
    }

    // xml 파일 생성하기
    public String setFreeReport(BizAnalysisVO bizAnalysisVO) throws IOException {
        // anal_no 생성
        int analNo = bizAnalysisMapper.setReportAnalNo(bizAnalysisVO);
        BizAnalysisVO outVo = new BizAnalysisVO();

        /*StringBuffer sb = new StringBuffer();
        String[] cols;
        boolean synthView = false;
        String dir = "src/main/resources/reports/dataset" + "/202205" + "/06" + "/" + analNo;
        String charSet = option.get("charSet", "utf-8");

        // consult.xml
        String consult = "consult.xml";
        String fullNameConsult = dir + "/" + consult;
        HashMap<?, ?> rsMap = params.getResultSetMap();
        ResultSetWrapper rs1 = (ResultSetWrapper) rsMap.get("consult_rSaleEsti");

        sb.append("<root>");
        sb.append("<consult_rSaleEsti>");
        cols = rs1.getColumnNames();
        while (rs1.next()) {
            sb.append("<row>");
            for (int i = 0; i < cols.length; i++)
                sb.append("<").append(cols[i]).append(">").append(rs1.getValue(cols[i])).append("</").append(cols[i]).append(">");
            sb.append("</row>");
        }
        sb.append("</consult_rSaleEsti>");
        sb.append("</root>");

        FileUtil.write(dir, consult, sb.toString(), charSet);


        // info.xml
        String info = "info.xml";
        String fullNameInfo = dir + "/" + info;

        HashMap<?, ?> rsMap = params.getResultSetMap();
        ResultSetWrapper rs2 = (ResultSetWrapper) rsMap.get("consult_rAreaInfo");

        sb.append("<root>");
        sb.append("<consult_rAreaInfo>");
        cols = rs2.getColumnNames();
        while (rs2.next()) {
            sb.append("<row>");
            for (int i = 0; i < cols.length; i++)
                sb.append("<").append(cols[i]).append(">").append(rs2.getValue(cols[i])).append("</").append(cols[i]).append(">");
            sb.append("</row>");
        }
        sb.append("</consult_rAreaInfo>");
        sb.append("</root>");

        FileUtil.write(dir, consult, sb.toString(), charSet);

        */


        Gson gson = new Gson();
        String result = gson.toJson(outVo);

        return result;
    }

    // xml 파일 가져오기
    public String getFreeReport(BizAnalysisVO bizAnalysisVO) throws IOException {
        ArrayList<BizAnalysisVO> outVo = bizAnalysisMapper.getFreeReport(bizAnalysisVO);

        /*boolean synthView = false;
        String dir = "src/main/resources/reports/dataset" + "/202205" + "/06" + "/" + bizAnalysisVO.getAnalNo();
        JSONObject rs_obj = new JSONObject();

        // consult.xml
        String consult = "consult.xml";
        String fullNameConsult = dir + "/" + consult;
        File consult_f = new File(fullNameConsult);
        if(consult_f.exists()) {
            synthView = true;
            System.out.println("파일없음");
        }

        JSONArray consult_rSaleEsti       = new JSONArray();

        XMLUtil consultXmlUtil = new XMLUtil(consult);
        HashMap<?, ?> rsMapCon = consultXmlUtil.getResultSetMap();
        ResultSetWrapper rsCon1 = (ResultSetWrapper) rsMapCon.get("consult_rSaleEsti");       // 유동인구 분포

        while (rsCon1 != null && rsCon1.next()) {
            rs_obj = new JSONObject();
            for(int i=1;i<rsCon1.getColumnCount(*) + 1; i++){
                rs_obj.put(rsCon1.getColumnName(i), rsCon1.getValue(i));
            }
            consult_rSaleEsti.put(rs_obj);
        }


        // info.xml
        String info = "info.xml";
        String fullNameInfo = dir + "/" + info;
        File info_f = new File(fullNameInfo);
        if(info_f.exists()) {
            synthView = true;
            System.out.println("파일없음");
        }

        JSONArray consult_rAreaInfo       = new JSONArray();
        XMLUtil infoXmlUtil = new XMLUtil(info);
        HashMap<?, ?> rsMapInfo = infoXmlUtil.getResultSetMap();
        ResultSetWrapper rsInfo1 = (ResultSetWrapper) rsMapInfo.get("consult_rAreaInfo");       // 유동인구 분포

        while (rsInfo1 != null && rsInfo1.next()) {
            rs_obj = new JSONObject();
            for(int i=1;i<rsInfo1.getColumnCount(*) + 1; i++){
                rs_obj.put(rsInfo1.getColumnName(i), rsInfo1.getValue(i));
            }
            consult_rAreaInfo.put(rs_obj);
        }*/


        Gson gson = new Gson();
        String result = gson.toJson(outVo);

        return result;
    }
}
