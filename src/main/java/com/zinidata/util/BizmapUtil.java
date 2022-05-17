package com.zinidata.util;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.core.env.Environment;

import javax.annotation.PostConstruct;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.concurrent.ThreadLocalRandom;

@Slf4j
public class BizmapUtil {

    private static Environment environment;

    @Autowired
    private Environment activeEnvironment;

    @PostConstruct
    private void init () {
        environment = this.activeEnvironment;
    }

    /**
     * null check
     * @param str
     * @return
     */
    public static boolean isEmpty(Object str) {
        return str == null || "".equals(str);
    }


    public static String CurrentDateTime(){
        LocalDateTime now = LocalDateTime.now();
        String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

        return formatedNow;
    }

    public static String escapeCharDecode(String data){
        if(isEmpty(data)){
            return "";
        }
        data = StringUtils.replace(data, "\\\\n", "\\n");
        data = StringUtils.replace(data, "\\\\r", "\\r");
        data = StringUtils.replace(data, "\\\\t", "\\t");
        data = StringUtils.replace(data, "\\\\/", "\\/");
        data = StringUtils.replace(data, "\\\\'", "\\'");
        //data = StringUtils.replace(data, "\\\\\"", "\\\"");
        return data;
    }

    public static String setTimestampInJsonOutputVo(){
        StringBuffer sb = new StringBuffer();
        sb.append(getTimeStamp());
        sb.append("_");
        return sb.toString();
    }

    public static String getTimeStamp() {

        String rtnStr = null;

        // 문자열로 변환하기 위한 패턴 설정(년도-월-일 시:분:초:초(자정이후 초))
        String pattern = "yyyyMMddhhmmssSSS";

        SimpleDateFormat sdfCurrent = new SimpleDateFormat(pattern, LocaleContextHolder.getLocale());
        Timestamp ts = new Timestamp(System.currentTimeMillis());

        rtnStr = sdfCurrent.format(ts.getTime());

        return rtnStr;
    }

    /**
     * 특수문자를 웹 브라우저에서 정상적으로 보이기 위해 특수문자를 처리('<' -> & lT)하는 기능이다
     * @param 	srcString 		- '<'
     * @return 	변환문자열('<' -> "&lt"
     * @exception NullPointerException
     * @see
     */
    public static String getSpclStrCnvr(String srcString) throws NullPointerException{

        String rtnStr = null;

        try {
            StringBuffer strTxt = new StringBuffer("");

            char chrBuff;
            int len = srcString.length();

            for (int i = 0; i < len; i++) {
                chrBuff = (char) srcString.charAt(i);

                switch (chrBuff) {
                    case '<':
                        strTxt.append("&lt;");
                        break;
                    case '>':
                        strTxt.append("&gt;");
                        break;
                    case '&':
                        strTxt.append("&amp;");
                        break;
                    default:
                        strTxt.append(chrBuff);
                }
            }

            rtnStr = strTxt.toString();

        } catch (NullPointerException e) {
            return srcString;
        }

        return rtnStr;
    }

    public static int certNumber(){
        return ThreadLocalRandom.current().nextInt(100000, 1000000);
    }
}
