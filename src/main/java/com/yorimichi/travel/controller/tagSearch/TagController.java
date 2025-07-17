package com.yorimichi.travel.controller.tagSearch;


import com.google.gson.Gson;
import com.yorimichi.travel.service.account.LikesService;
import com.yorimichi.travel.service.tagSearch.TagSearchService;
import com.yorimichi.travel.vo.DestinationVO;
import com.yorimichi.travel.vo.LocationVO;
import com.yorimichi.travel.vo.account.AccountVO;
import com.yorimichi.travel.vo.tagSearch.TagVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
public class TagController {

    @Autowired
    private TagSearchService tagSearchService;

    @Autowired
    private LikesService likesService;

    @GetMapping("/tag-page")
    public String tagPage(Model model, HttpSession session) {
        Map<String, List<TagVO>> tagList = tagSearchService.getTags();
        AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");
        model.addAttribute("tagList", tagList);


//        model.addAttribute("tags1", tagSearchService.getTags("목적"));
//        model.addAttribute("tags2", tagSearchService.getTags("카테고리"));
//        model.addAttribute("tags3", tagSearchService.getTags("동행자 관계"));
        String jsonLocations = new Gson().toJson(tagSearchService.searchGetLocation());

        model.addAttribute("tags4", tagSearchService.searchGetLocation());
        model.addAttribute("tags5", jsonLocations);
        System.out.println(model.getAttribute("tags4"));
        if (loginUser != null) {
            List<Integer> likedDestinations = likesService.getLikedDestinationIds(loginUser.getUser_id());
            model.addAttribute("likedDestinations", likedDestinations);
            return "tagSearch/tagPage";
        } else {
            return "tagSearch/tagPage";
        }
    }


//    @PostMapping("/tagPage")
//    public String TagSelect(){
//        return "tagSearch/tagPage";
//    }


}




