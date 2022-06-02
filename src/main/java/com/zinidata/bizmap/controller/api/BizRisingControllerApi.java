package com.zinidata.bizmap.controller.api;

import com.zinidata.bizmap.service.BizRisingService;
import com.zinidata.bizmap.vo.BizRisingUpjongVO;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@RequiredArgsConstructor
@Controller
@RequestMapping("/bizmap/rising")
public class BizRisingControllerApi {

    private final BizRisingService bizRisingService;

    @ResponseBody
    @PostMapping(value="/getRisingUpjong")
    @ApiOperation(value="뜨는업종")
    @ApiResponses(value = {
            @ApiResponse(code=200, message = "유동인구 출력(포인트)")
    })
    public String getRising(BizRisingUpjongVO bizRisingUpjongVO) {
        String result = bizRisingService.getRisingUpjong(bizRisingUpjongVO);
        return result;
    }

}
