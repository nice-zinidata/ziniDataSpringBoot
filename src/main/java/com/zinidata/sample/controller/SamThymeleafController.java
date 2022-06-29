package com.zinidata.sample.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.HashMap;

@Controller
@RequestMapping("/sample")
@Slf4j
public class SamThymeleafController {

    @GetMapping("test")
    public String thymetest(Model model) {
        ArrayList<HashMap<String,String>> list = new ArrayList<>();
        for(int i=0; i<6; i++){
            HashMap<String, String> h = new HashMap<>();
            h.put("a", i + "_a");
            h.put("b", i + "_b");
            list.add(h);
        }

        model.addAttribute("name" , "test");
        model.addAttribute("list" , list);
        return "thymeleaf/sample/test";
    }

    @PostMapping("/test")
    public String thymetest2(
            @RequestParam("param1")String param1
            , Model model
    ) {
        ArrayList<HashMap<String,String>> list = new ArrayList<>();
        int param1_int = Integer.parseInt(param1);

        for(int i=0; i<param1_int; i++){
            HashMap<String, String> h = new HashMap<>();
            h.put("a", i + "_a");
            h.put("b", i + "_b");
            list.add(h);
        }

        model.addAttribute("name" , "test1");
        model.addAttribute("list" , list);
        return "thymeleaf/sample/test :: list";
    }

}
