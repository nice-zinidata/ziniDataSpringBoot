package com.zinidata.bizmapAdmin.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/bizmap/admin")
public class BizAdminController {

    @GetMapping("/main")
    public String main()   {
        return "bizmapAdmin/main";
    }

    @GetMapping("/member/member1")
    public String member1()   {
        return "bizmapAdmin/member/member1";
    }

    @GetMapping("/member/member2")
    public String member2()   {
        return "bizmapAdmin/member/member2";
    }


    @GetMapping("/contents/contents1")
    public String contents1()   {
        return "bizmapAdmin/contents/contents1";
    }

    @GetMapping("/contents/contents2")
    public String contents2()   {
        return "bizmapAdmin/contents/contents2";
    }

}
