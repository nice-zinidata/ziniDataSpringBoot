package com.zinidata.common.controller.api;

import com.zinidata.common.service.ComAdminService;
import com.zinidata.common.vo.ComAreaVO;
import com.zinidata.common.vo.ComLoginVO;
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
@RequestMapping("/common/admin")
class ComAdminControllerApi {

    private final ComAdminService comAdminService;

    @ResponseBody
    @PostMapping(value="/login")
    @ApiOperation(value="로그인")
    @ApiResponses(value = {
            @ApiResponse(code=200, message = "로그인")
    })
    public String login(HttpServletRequest request, ComLoginVO comLoginVO) throws NoSuchAlgorithmException {
        String result = comAdminService.login(request, comLoginVO);
        return result;
    }

    @ResponseBody
    @PostMapping(value="/getArea")
    @ApiOperation(value="지역검색")
    @ApiResponses(value = {
            @ApiResponse(code=200, message = "지역검색")
    })
    public String getArea(HttpServletRequest request, ComAreaVO comAreaVO) throws NoSuchAlgorithmException {
        String result = comAdminService.getArea(request, comAreaVO);
        return result;
    }

    @ResponseBody
    @PostMapping(value="/getUpjong")
    @ApiOperation(value="지역검색")
    @ApiResponses(value = {
            @ApiResponse(code=200, message = "지역검색")
    })
    public String getUpjong(HttpServletRequest request, ComUpjongVO comUpjongVO) throws NoSuchAlgorithmException {
        String result = comAdminService.getUpjong(request, comUpjongVO);
        return result;
    }

}
