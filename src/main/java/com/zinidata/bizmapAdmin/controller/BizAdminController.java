package com.zinidata.bizmapAdmin.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/bizmapAdmin")
public class BizAdminController {

//    @GetMapping("index")
//    public String index() {
//        return "bizmapAdmin/index";
//    }

    @GetMapping("main")
    public String main()   {
        return "bizmapAdmin/main";
    }

    @GetMapping("member/member")
    public String member()   {
        return "bizmapAdmin/member/member";
    }

    @GetMapping("member/service")
    public String serivce()   {
        return "bizmapAdmin/member/service";
    }

//    @GetMapping("contents")
//    public String contents() {
//        return "bizmapAdmin/contents/contents1";
//    }

    @GetMapping("contents/report")
    public String report()   {
        return "bizmapAdmin/contents/report";
    }

}
