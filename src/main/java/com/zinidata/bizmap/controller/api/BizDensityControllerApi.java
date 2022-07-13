package com.zinidata.bizmap.controller.api;

import com.zinidata.bizmap.service.BizDensityService;
import com.zinidata.bizmap.vo.BizDensityVO;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;


@RequiredArgsConstructor
@Controller
@RequestMapping("/bizmap/density")
public class BizDensityControllerApi {

    private final BizDensityService bizDensityService;


    @ResponseBody
    @PostMapping(value="getDensity")
    @ApiOperation(value="밀집도 출력 (42만 블록)\n")
    @ApiResponses(value = {
            @ApiResponse(code=200, message = "밀집도 출력 (42만 블록)\n")
    })
    public String getDensity(BizDensityVO bizDensityVO) throws IOException {
        String result = bizDensityService.getDensity(bizDensityVO);
        return result;
    }

}
