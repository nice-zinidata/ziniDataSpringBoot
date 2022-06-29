package com.zinidata.bizmapAdmin.controller.api;

import com.zinidata.bizmapAdmin.service.BizAdminService;
import com.zinidata.bizmapAdmin.vo.BizAdminVO;
import com.zinidata.bizmapAdmin.vo.output.BizAdminOutVO;
import com.zinidata.sample.service.SamMainService;
import com.zinidata.sample.vo.SamLoginVO;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

@RequiredArgsConstructor
@Controller
@RequestMapping("/bizmapAdmin")
public class BizAdminControllerApi {

    private final BizAdminService bizAdminService;

    // 회원현황 검색 기능
    @ResponseBody
    @PostMapping(value="/member/memList")
    @ApiOperation(value="회원검색")
    @ApiResponses(value = {
            @ApiResponse(code=200, message = "회원검색")
    })
    public String memberList(HttpSession session, BizAdminVO bizAdminVO) {
        String result="";
        result = bizAdminService.memberList(session, bizAdminVO);
        return result;
    }
    // 회원현황 검색 기능(변경일자를 얻기위한 히스토리 쿼리)
    @ResponseBody
    @PostMapping(value="/member/memHstList")
    @ApiOperation(value="회원 히스토리 검색")
    @ApiResponses(value = {
            @ApiResponse(code=200, message = "회원 히스토리 검색")
    })
    public String memberHstList(HttpSession session, BizAdminVO bizAdminVO) {
        String result="";
        result = bizAdminService.memberHstList(session, bizAdminVO);
        return result;
    }

    // 서비스신청내역 검색 기능
    @ResponseBody
    @PostMapping(value="/member/svcList")
    @ApiOperation(value="서비스신청내역 검색")
    @ApiResponses(value = {
            @ApiResponse(code=200, message = "서비스신청내역 검색")
    })
    public String svcList(HttpSession session, BizAdminVO bizAdminVO) {
        String result="";
        result = bizAdminService.svcList(session, bizAdminVO);
        return result;
    }

}
