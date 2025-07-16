package com.yorimichi.travel.controller.gacha;


import com.yorimichi.travel.service.gacha.GachaService;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

// 비동기 할때 쓰는거
@RequestMapping("/api/gacha")
@Controller
public class GachaAPIC {

    @Autowired
    private GachaService gachaService;

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

    @GetMapping(value = "/food", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public void foodGacha(HttpServletResponse response, String where){
        System.out.println(where);
        System.out.println("=================>>>");
        gachaService.getRandomFoodFromGemma(response, where);
    }

}
