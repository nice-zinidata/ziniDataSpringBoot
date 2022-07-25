package com.zinidata.bizmap.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/bizmap")
public class BizMainController {

    @GetMapping("index")
    public String index() {
        return "bizmap/index";
    }

    @GetMapping("subscribe")
    public String subscribe() {
        return "bizmap/subscribe";
    }

    @GetMapping("support")
    public String support() {
        return "bizmap/support";
    }


}
