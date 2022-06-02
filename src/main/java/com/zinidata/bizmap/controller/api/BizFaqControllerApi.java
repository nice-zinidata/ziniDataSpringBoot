package com.zinidata.bizmap.controller.api;

import com.zinidata.bizmap.service.BizFaqService;
import com.zinidata.bizmap.vo.BizFaqVO;
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
@RequestMapping("/bizmap/faq")
public class BizFaqControllerApi {

    private final BizFaqService bizFaqService;


    @ResponseBody
    @PostMapping(value="/getFaq")
    @ApiOperation(value="Faq")
    @ApiResponses(value = {
            @ApiResponse(code=200, message = "Faq")
    })
    public String getFaq(BizFaqVO bizFaqVO) throws IOException {
        String result = bizFaqService.getFaq(bizFaqVO);
        return result;
    }

}
