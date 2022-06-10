package com.zinidata.bizmap.controller.api;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.zinidata.bizmap.service.BizYouTubeService;
import com.zinidata.bizmap.vo.BizYouTubeVO;
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
@RequestMapping("/bizmap/youTube")
public class BizYouTubeControllerApi {

    private final BizYouTubeService bizYouTubeService;

    /***
     * 없으면 전체
     * youtubeNo    : 11
     * @param bizYouTubeVO
     * @return
     * @throws IOException
     */
    @ResponseBody
    @PostMapping(value="/getYouTube")
    @ApiOperation(value="유튜브URL 가져오기")
    @ApiResponses(value = {
            @ApiResponse(code=200, message = "유튜브URL 가져오기")
    })
    public String getYouTube(BizYouTubeVO bizYouTubeVO) throws IOException {
        String result = bizYouTubeService.getYouTube(bizYouTubeVO);
        return result;
    }

}
