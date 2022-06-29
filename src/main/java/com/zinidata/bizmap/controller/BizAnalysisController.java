package com.zinidata.bizmap.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/bizmap/analysis")
public class BizAnalysisController {

    @GetMapping("analysisFree")
    public String analysisFree() {
        return "bizmap/analysis/analysisFree";
    }


}
