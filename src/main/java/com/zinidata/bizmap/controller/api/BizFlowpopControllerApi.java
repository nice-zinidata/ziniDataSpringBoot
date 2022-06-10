package com.zinidata.bizmap.controller.api;

import com.zinidata.bizmap.service.BizFlowpopService;
import com.zinidata.bizmap.vo.BizFlowpopVO;
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
@RequestMapping("/bizmap/flowpop")
public class BizFlowpopControllerApi {

    private final BizFlowpopService bizFlowpopService;

    @ResponseBody
    @PostMapping(value="/getFlowpop")
    @ApiOperation(value="유동인구 출력(포인트)")
    @ApiResponses(value = {
            @ApiResponse(code=200, message = "유동인구 출력(포인트)")
    })
    public String getFlowpop(BizFlowpopVO bizFlowpopVO) {
        String result = bizFlowpopService.getFlowpop(bizFlowpopVO);
        return result;
    }

}
