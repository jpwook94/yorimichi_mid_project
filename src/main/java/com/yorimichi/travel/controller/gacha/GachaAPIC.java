package com.yorimichi.travel.controller.gacha;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

// 비동기 할때 쓰는거
@RequestMapping("/api/gacha")
@Controller
public class GachaAPIC {

    @GetMapping
    public String catePage(int cate){
        System.out.println(cate);
        if(cate == 1){
            return "gacha/gachamascot";
        } else if (cate == 2) {
            return "gacha/gachadestination";

        } else if (cate == 3){
            return "gacha/gachafood";
        }
        return "";
    }
}
