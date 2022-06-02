package com.zinidata.bizmap.controller.api;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.zinidata.bizmap.service.BizAnalysisService;
import com.zinidata.bizmap.vo.BizAnalysisVO;
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
@RequestMapping("/bizmap/analysis")
public class BizAnalysisControllerApi {

    private final BizAnalysisService bizAnalysisService;

    /***
     * 4326 형식
     * xAxis        : x 좌표
     * yAxis        : y 좌표
     * upjongCd     : upjong3Cd
     * @param bizAnalysisVO
     * @return
     * @throws JsonProcessingException
     */
    @ResponseBody
    @PostMapping(value="/admiFeatures")
    @ApiOperation(value="마우스 오버 구역 표시")
    @ApiResponses(value = {
            @ApiResponse(code=200, message = "마우스 오버 구역 표시")
    })
    public String admiFeatures(BizAnalysisVO bizAnalysisVO) throws JsonProcessingException {
        String result = bizAnalysisService.admiFeatures(bizAnalysisVO);
        return result;
    }


    @ResponseBody
    @PostMapping(value="/getFreeReport")
    @ApiOperation(value="기본보고서 가져오기")
    @ApiResponses(value = {
            @ApiResponse(code=200, message = "기본보고서 가져오기")
    })
    public String getFreeReport(BizAnalysisVO bizAnalysisVO) throws IOException {
        String result = bizAnalysisService.getFreeReport(bizAnalysisVO);
        return result;
    }

}
