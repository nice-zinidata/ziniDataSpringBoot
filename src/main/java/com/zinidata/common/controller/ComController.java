package com.zinidata.common.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/bizmap/common")
public class ComController {

	@GetMapping("")
	public String common() {
		return "";
	}

	@GetMapping("fileDownLoad")
	public String fileDownLoad() {
		return "fileDownLoad";
	}

}
