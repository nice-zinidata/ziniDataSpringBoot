package com.zinidata.bizmap.controller.api;

import com.zinidata.bizmap.service.BizMainService;
import com.zinidata.bizmap.vo.BizMainVO;
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
    @PostMapping(value="/login")
    @ApiOperation(value="로그인")
    @ApiResponses(value = {
            @ApiResponse(code=200, message = "로그인")
    })
    public String admiFeatures(HttpServletRequest request, BizMainVO bizMainVO) throws NoSuchAlgorithmException {
        String result = bizMainService.login(request, bizMainVO);
        return result;
    }

}
