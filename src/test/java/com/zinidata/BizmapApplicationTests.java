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

    @Test
    void fileDownLoadTest(){
        String fileUrl = "https://10.81.220.99/reports/dataset/202205/06/80366/consult.xml/";
        fileDownLoad(fileUrl);
    }

    void fileDownLoad(String fileUrl){

        URL url = null;
        InputStream in = null;
        OutputStream out = null;
        HttpServletResponse response = null;
        HttpServletRequest request = null;

        try {

            String resultData;
            if (fileUrl.indexOf("https") > -1) {    //해당 url이 https이면
                resultData = httpsGet(fileUrl);            //ssl인증서를 무시하는 함수를 호출한다.
                logger.debug("https resultData: { " +resultData+ "}");
            }

            url = new URL(fileUrl);
            // 만약 프로토콜이 https 라면 https SSL을 무시하는 로직을 수행해주어야 한다.('https 인증서 무시' 라는 키워드로 구글에 검색하면 많이 나옵니다.)

            in = url.openStream();

            while(true){
                //파일을 읽어온다.
                int data = in.read();
                if(data == -1){
                    break;
                }
                //파일을 쓴다.
                out.write(data);
            }

            in.close();
            out.close();

        } catch (Exception e) {
            System.out.println(e.getMessage());
//            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    public static String httpsGet(String strURL) throws Exception
    {
        URL url = null;
        HttpsURLConnection con = null;
        String ret = new String();

        try {
            url = new URL(strURL);
            ignoreSsl();
            con = (HttpsURLConnection)url.openConnection();


            BufferedReader br = null;
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));

            String input = null;

            while ((input = br.readLine()) != null){
                ret += input;
            }

            br.close();
        }
        catch (IOException e) {
            ExceptionUtils.getStackTrace(e);
        } finally {
            if (con != null) {
                con.disconnect();
            }
        }

        return ret;

    }

     public static void ignoreSsl() throws Exception{
        HostnameVerifier hv = new HostnameVerifier() {
            public boolean verify(String urlHostName, SSLSession session){
                return true;
            }
        };
        trustAllHttpsCertificates();
        HttpsURLConnection.setDefaultHostnameVerifier(hv);
    }

    private static void trustAllHttpsCertificates() throws Exception {
        TrustManager[] trustAllCerts = new TrustManager[1];
        TrustManager tm = new miTM();
        trustAllCerts[0] = tm;
        SSLContext sc = SSLContext.getInstance("SSL");
        sc.init(null, trustAllCerts, null);
        HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
    }

    static class miTM implements TrustManager,X509TrustManager {
        public X509Certificate[] getAcceptedIssuers() {
            return null;
        }

        public boolean isServerTrusted(X509Certificate[] certs) {
            return true;
        }

        public boolean isClientTrusted(X509Certificate[] certs) {
            return true;
        }

        public void checkServerTrusted(X509Certificate[] certs, String authType)
                throws CertificateException {
            return;
        }

        public void checkClientTrusted(X509Certificate[] certs, String authType)
                throws CertificateException {
            return;
        }
    }


}
