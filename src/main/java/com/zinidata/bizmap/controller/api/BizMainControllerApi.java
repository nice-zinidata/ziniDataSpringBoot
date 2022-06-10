package com.zinidata.bizmap.controller.api;

import com.zinidata.bizmap.service.BizMainService;
import com.zinidata.bizmap.vo.BizCertVO;
import com.zinidata.bizmap.vo.BizSubscribeVO;
import com.zinidata.common.vo.ComUpjongVO;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

@RequiredArgsConstructor
@Controller
@RequestMapping("/bizmap")
public class BizMainControllerApi {

    private final BizMainService bizMainService;

    /***
     * mobileNo         : 휴대폰 번호
     * memNm            : 이름
     * @param request
     * @param bizCertVO
     * @return : seqNo : 인증번호 sequence
     * @throws SQLException
     */
    @ResponseBody
    @PostMapping(value="/setCert")
    @ApiOperation(value="인증번호 발송")
    @ApiResponses(value = {
            @ApiResponse(code=200, message = "인증번호 발송")
    })
    public String setCert(HttpServletRequest request, BizCertVO bizCertVO) throws SQLException {
        String result = bizMainService.setCert(request, bizCertVO);
        return result;
    }

    /***
     * mobileNo     : 휴대폰번호
     * memNm        : 이름
     * seqNo        : 인증번호 sequence
     * @param request
     * @param bizCertVO
     * @return
     */
    @ResponseBody
    @PostMapping(value="/getCert")
    @ApiOperation(value="인증번호 확인")
    @ApiResponses(value = {
            @ApiResponse(code=200, message = "인증번호 확인")
    })
    public String getCert(HttpServletRequest request, BizCertVO bizCertVO){
        String result = bizMainService.getCert(request, bizCertVO);
        return result;
    }

    /***
     * mobileNo         : 전화번호
     * memNm            : 이름
     * memType          : 유형
     * interestAreacd   : 지역
     * interestUpjong   : 업종
     * personalInfo     : 개인정보 동의
     * marketingInfo    : 마케팅동의
     * @param request
     * @param bizSubscribeVO
     * @return
     */
    @ResponseBody
    @PostMapping(value="/subscribe")
    @ApiOperation(value="구독하기")
    @ApiResponses(value = {
            @ApiResponse(code=200, message = "구독하기")
    })
    public String setSubscribe(HttpServletRequest request, BizSubscribeVO bizSubscribeVO){
        String result = bizMainService.setSubscribe(request, bizSubscribeVO);
        return result;
    }

}
