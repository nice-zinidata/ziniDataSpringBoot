package com.zinidata.bizmap.controller.api;

import com.zinidata.bizmap.service.BizConsultingService;
import com.zinidata.bizmap.vo.BizAttachVO;
import com.zinidata.bizmap.vo.BizConsultingVO;
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
@RequestMapping("/bizmap/consulting")
public class BizConsultingControllerApi {

    private final BizConsultingService bizConsultingService;


    /***
     * boardNo : 게시판 번호 (1,2,3 ~)
     * @param bizConsultingVO
     * @return
     * @throws IOException
     */
    @ResponseBody
    @PostMapping(value="getConsulting")
    @ApiOperation(value="게시글 조회")
    @ApiResponses(value = {
            @ApiResponse(code=200, message = "게시글 조회")
    })
    public String getConsulting(BizConsultingVO bizConsultingVO) throws IOException {
        String result = bizConsultingService.getConsulting(bizConsultingVO);
        return result;
    }

    /***
     * boardNo : 게시판 번호 (1,2,3 ~)
     * @param bizConsultingVO
     * @return
     * @throws IOException
     */
    @ResponseBody
    @PostMapping(value="setConsulting")
    @ApiOperation(value="게시글 등록")
    @ApiResponses(value = {
            @ApiResponse(code=200, message = "게시글 등록")
    })
    public String setConsulting(BizConsultingVO bizConsultingVO) throws IOException {
        String result = bizConsultingService.setConsulting(bizConsultingVO);
        return result;
    }


    /***
     * boardNo : 게시판 번호 (1,2,3 ~)
     * @param bizAttachVO
     * @return
     * @throws IOException
     */
    @ResponseBody
    @PostMapping(value="setAttachInfo")
    @ApiOperation(value="게시글 파일 업로드 정보")
    @ApiResponses(value = {
            @ApiResponse(code=200, message = "게시글 등록")
    })
    public String setAttachInfo(BizAttachVO bizAttachVO) throws IOException {
        String result = bizConsultingService.setAttachInfo(bizAttachVO);
        return result;
    }

}
