package com.zinidata.sample.controller;

import com.zinidata.sample.service.SamMainService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/sample")
public class SamMainController {

    private final SamMainService samMainService;

    @GetMapping("login")
    public String login() {
        return "sample/login";
    }

    @GetMapping("signUp")
    public String signUp() {
        return "sample/signUp";
    }

    @GetMapping("main")
    public String main(Model model, HttpSession session) {
        if(com.zinidata.util.BizmapUtil.isEmpty(session.getAttribute("userId"))){
            return "sample/login";
        }
        log.info("# Main Model: {}", model);
        return "sample/main";
    }

    @GetMapping("index")
    public String index(Model model, HttpSession session) {
        if(com.zinidata.util.BizmapUtil.isEmpty(session.getAttribute("userId"))){
            return "sample/login";
        }
        return "sample/index";
    }

}
