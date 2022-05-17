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

@RequiredArgsConstructor
@Controller
@RequestMapping("/bizmap")
public class BizMainControllerApi {

    private final BizMainService bizMainService;

    @ResponseBody
    @PostMapping(value="/setCert")
    @ApiOperation(value="인증번호 발송")
    @ApiResponses(value = {
            @ApiResponse(code=200, message = "인증번호 발송")
    })
    public String setCert(HttpServletRequest request, BizCertVO bizCertVO){
        String result = bizMainService.setCert(request, bizCertVO);
        return result;
    }

    @ResponseBody
    @PostMapping(value=" /getCert")
    @ApiOperation(value="인증번호 확인")
    @ApiResponses(value = {
            @ApiResponse(code=200, message = "인증번호 확인")
    })
    public String getCert(HttpServletRequest request, BizCertVO bizCertVO){
        String result = bizMainService.getCert(request, bizCertVO);
        return result;
    }

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
