package com.zinidata.bizmap.controller.api;

import com.zinidata.bizmap.service.BizMainService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequiredArgsConstructor
@Controller
@RequestMapping("/bizmap")
public class BizMainControllerApi {

    private final BizMainService bizMainService;


}
