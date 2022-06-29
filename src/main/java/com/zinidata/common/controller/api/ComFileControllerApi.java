package com.zinidata.common.controller.api;

import com.zinidata.common.service.ComAdminService;
import com.zinidata.common.vo.ComAreaVO;
import com.zinidata.common.vo.ComFileVO;
import com.zinidata.common.vo.ComLoginVO;
import com.zinidata.common.vo.ComUpjongVO;
import com.zinidata.util.GsonUtil;
import com.zinidata.util.JsonOutputVo;
import com.zinidata.util.Status;
import eproject.Sys;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import lombok.RequiredArgsConstructor;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

@RequiredArgsConstructor
@Controller
@RequestMapping("/bizmap/common/file")
class ComFileControllerApi {

    @Autowired
    GsonUtil gsonUtil;

    @Value("${bizmap.home.dir}")
    private String homePath;

    @ResponseBody
    @PostMapping(value="upload")
    @ApiOperation(value="파일업로드")
    @ApiResponses(value = {
            @ApiResponse(code=200, message = "파일업로드")
    })
    public String upload(HttpServletRequest request) throws NoSuchAlgorithmException, IOException {

        // 오늘 날짜
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Calendar c1 = Calendar.getInstance();
        String strToday = sdf.format(c1.getTime());

        // 현재 시간
//        String homePath = homePath;
        String filePath = "/upload/";
        String saveFolder = homePath + filePath + strToday + "/";
        String encType = "UTF-8";
        int maxSize = 100 * 1024 * 1024;

        // 폴더 생성
        System.out.println(saveFolder);
        File Folder = new File(saveFolder);
        System.out.println(Folder.exists());
        if (!Folder.exists()) {
            Folder.mkdir(); //폴더 생성합니다.
        }
        // 파일 업로드
        MultipartRequest multi = null;
        multi = new MultipartRequest(request, saveFolder, maxSize, encType, new DefaultFileRenamePolicy());
        String url = multi.getParameter("url");

        String mem_no = multi.getParameter("mem_no");
        String idx = multi.getParameter("idx");

        String fileName = multi.getFilesystemName("uploadFile");
        String original = multi.getOriginalFileName("uploadFile");
        String type = multi.getContentType("uploadFile");

        System.out.println("mem_no : " + mem_no);
        System.out.println("idx : " + idx);
        System.out.println("저장된 파일 이름 : " + fileName);
        System.out.println("실제 파일 이름 : " + original);

        ComFileVO comFileVO = new ComFileVO();
        comFileVO.setFileName(fileName);
        comFileVO.setOriginal(original);
        comFileVO.setFilePath(strToday);
        comFileVO.setType(type);

        String result = gsonUtil.toJson(new JsonOutputVo(Status.성공, comFileVO));
        return result;
    }
}
