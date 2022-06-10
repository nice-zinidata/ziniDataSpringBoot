package com.zinidata;

import org.apache.commons.lang3.exception.ExceptionUtils;
import org.apache.log4j.Logger;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.net.ssl.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URL;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;


@SpringBootTest
class BizmapApplicationTests {

    protected Logger logger = Logger.getLogger(this.getClass());
//    @Test
//    void setReport() throws IOException {
//
//        StringBuffer sb = new StringBuffer();
//        String[] cols;
//        boolean synthView = false;
//        String dir = "src/main/resources/reports/dataset" + "/202205" + "/06";
//        String charSet = option.get("charSet", "utf-8");
//
//        // consult.xml
//        String consult = "consult.xml";
//        String fullNameConsult = dir + "/" + consult;
//        HashMap<?, ?> rsMap = params.getResultSetMap();
//        ResultSetWrapper rs1 = (ResultSetWrapper) rsMap.get("consult_rSaleEsti");
//
//        sb.append("<root>");
//        sb.append("<consult_rSaleEsti>");
//        cols = rs1.getColumnNames();
//        while (rs1.next()) {
//            sb.append("<row>");
//            for (int i = 0; i < cols.length; i++)
//                sb.append("<").append(cols[i]).append(">").append(rs1.getValue(cols[i])).append("</").append(cols[i]).append(">");
//            sb.append("</row>");
//        }
//        sb.append("</consult_rSaleEsti>");
//        sb.append("</root>");
//
//        FileUtil.write(dir, consult, sb.toString(), charSet);
//
//
//        // info.xml
//        String info = "info.xml";
//        String fullNameInfo = dir + "/" + info;
//
//        HashMap<?, ?> rsMap = params.getResultSetMap();
//        ResultSetWrapper rs2 = (ResultSetWrapper) rsMap.get("consult_rAreaInfo");
//
//        sb.append("<root>");
//        sb.append("<consult_rAreaInfo>");
//        cols = rs2.getColumnNames();
//        while (rs2.next()) {
//            sb.append("<row>");
//            for (int i = 0; i < cols.length; i++)
//                sb.append("<").append(cols[i]).append(">").append(rs2.getValue(cols[i])).append("</").append(cols[i]).append(">");
//            sb.append("</row>");
//        }
//        sb.append("</consult_rAreaInfo>");
//        sb.append("</root>");
//
//        FileUtil.write(dir, consult, sb.toString(), charSet);
//
//    }


//    @Test
//    void getFreeReport() throws IOException {
//
//        boolean synthView = false;
//        String dir = "src/main/resources/reports/dataset" + "/202205" + "/06";
//        JSONObject rs_obj = new JSONObject();
//
//        // consult.xml
//        String consult = "consult.xml";
//        String fullNameConsult = dir + "/" + consult;
//        File consult_f = new File(fullNameConsult);
//        if(consult_f.exists()) {
//            synthView = true;
//            System.out.println("파일없음");
//        }
//
//        JSONArray consult_rSaleEsti       = new JSONArray();
//
//        XMLUtil consultXmlUtil = new XMLUtil(consult);
//        HashMap<?, ?> rsMapCon = consultXmlUtil.getResultSetMap();
//        ResultSetWrapper rsCon1 = (ResultSetWrapper) rsMapCon.get("consult_rSaleEsti");       // 유동인구 분포
//
//        while (rsCon1 != null && rsCon1.next()) {
//            rs_obj = new JSONObject();
//            for(int i=1;i<rsCon1getColumnCount(*) + 1; i++){
//                rs_obj.put(rsCon1.getColumnName(i), rsCon1.getValue(i));
//            }
//            consult_rSaleEsti.put(rs_obj);
//        }
//
//
//        // info.xml
//        String info = "info.xml";
//        String fullNameInfo = dir + "/" + info;
//        File info_f = new File(fullNameInfo);
//        if(info_f.exists()) {
//            synthView = true;
//            System.out.println("파일없음");
//        }
//
//        JSONArray consult_rAreaInfo       = new JSONArray();
//        XMLUtil infoXmlUtil = new XMLUtil(info);
//        HashMap<?, ?> rsMapInfo = infoXmlUtil.getResultSetMap();
//        ResultSetWrapper rsInfo1 = (ResultSetWrapper) rsMapInfo.get("consult_rAreaInfo");       // 유동인구 분포
//
//        while (rsInfo1 != null && rsInfo1.next()) {
//            rs_obj = new JSONObject();
//            for(int i=1;i<rsInfo1.getColumnCount(*) + 1; i++){
//                rs_obj.put(rsInfo1.getColumnName(i), rsInfo1.getValue(i));
//            }
//            consult_rAreaInfo.put(rs_obj);
//        }
//    }



}
