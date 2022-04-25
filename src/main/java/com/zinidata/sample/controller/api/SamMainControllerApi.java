package com.zinidata.sample.controller.api;

import com.zinidata.sample.service.SamMainService;
import com.zinidata.sample.vo.SamLoginVO;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;

@RequiredArgsConstructor
@Controller
@RequestMapping("/sample")
public class SamMainControllerApi {

    private final SamMainService samMainService;

    @ResponseBody
    @PostMapping(value="/loginProc")
    @ApiOperation(value="로그인처리")
    @ApiResponses(value = {
            @ApiResponse(code=200, message = "로그인처리")
    })
    public String loginProc(SamLoginVO samLoginvO, HttpSession session) throws NoSuchAlgorithmException {
        String result = samMainService.loginProc(samLoginvO, session);
        return result;
    }

    @ResponseBody
    @PostMapping("/check")
    public String check(SamLoginVO samLoginvO) throws NoSuchAlgorithmException {
        String result = samMainService.getUserCheck(samLoginvO);
        return result;
    }

    @ResponseBody
    @PostMapping("/signUpProc")
    public String signUpProc(SamLoginVO samLoginvO) throws NoSuchAlgorithmException {
        String result = samMainService.setSignUpProc(samLoginvO);
        return result;
    }

}
