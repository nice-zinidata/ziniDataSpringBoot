package com.zinidata.bizmap.controller.api;

import com.zinidata.bizmap.service.BizNoticeService;
import com.zinidata.bizmap.vo.BizNoticeVO;
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
@RequestMapping("/bizmap/notice")
public class BizNoticeControllerApi {

    private final BizNoticeService bizNoticeService;


    /***
     * boardNo : 게시판 번호 (1,2,3 ~)
     * @param bizNoticeVO
     * @return
     * @throws IOException
     */
    @ResponseBody
    @PostMapping(value="/getNotice")
    @ApiOperation(value="공지")
    @ApiResponses(value = {
            @ApiResponse(code=200, message = "공지")
    })
    public String getNotice(BizNoticeVO bizNoticeVO) throws IOException {
        String result = bizNoticeService.getNotice(bizNoticeVO);
        return result;
    }

}
