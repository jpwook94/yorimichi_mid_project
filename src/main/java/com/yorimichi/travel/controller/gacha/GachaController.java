package com.yorimichi.travel.controller.gacha;


import com.yorimichi.travel.service.gacha.GachaService;
import com.yorimichi.travel.vo.DestinationVO;
import com.yorimichi.travel.vo.LocationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class GachaController {

    @Autowired
    private GachaService gachaService;

    @ResponseBody
    @GetMapping("/pick")
    public LocationVO pickMascot(Model model) {
        LocationVO randomLocation = gachaService.getRandomLocation();
        model.addAttribute("pickedloc", randomLocation);
        return randomLocation; // 뽑은 객체
    }

    @ResponseBody
    @GetMapping("/pickSSR")
    public DestinationVO pickDestination(Model model) {
        DestinationVO randomDestination = gachaService.getRandomDestination();
        model.addAttribute("pickeddest", randomDestination);
        return randomDestination;
    }


//    @GetMapping("/gacha-mascot")
//    public String gachaMascot(Model model) {
//        model.addAttribute("content", "gacha/gacha.jsp");
//        model.addAttribute("gachacontent", "/WEB-INF/views/gacha/gachamascot.jsp");
//        return "main";
//    }
//
//    @GetMapping("/gacha-destination")
//    public String gachaDestination(Model model) {
//        model.addAttribute("content", "gacha/gacha.jsp");
//        model.addAttribute("gachacontent", "/WEB-INF/views/gacha/gachadestination.jsp");
//        return "main";
//    }
//
//    @GetMapping("/gacha-food")
//    public String gachaFood(Model model) {
//        model.addAttribute("content", "gacha/gacha.jsp");
//        model.addAttribute("gachacontent", "/WEB-INF/views/gacha/gachafood.jsp");
//        return "main";
//    }



}
