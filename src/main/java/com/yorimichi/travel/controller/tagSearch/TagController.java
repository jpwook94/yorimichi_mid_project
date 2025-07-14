package com.yorimichi.travel.controller.tagSearch;


import com.yorimichi.travel.service.tagSearch.TagSearchService;
import com.yorimichi.travel.vo.tagSearch.TagVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class TagController {

    @Autowired
    private TagSearchService tagSearchService;

    @GetMapping("/tag-page")
    public String tagPage(Model model) {
        Map<String, List<TagVO>> tagList = tagSearchService.getTags();
        model.addAttribute("tagList", tagList);


//        model.addAttribute("tags1", tagSearchService.getTags("목적"));
//        model.addAttribute("tags2", tagSearchService.getTags("카테고리"));
//        model.addAttribute("tags3", tagSearchService.getTags("동행자 관계"));
        model.addAttribute("tags4", tagSearchService.searchGetLocation());
        return "tagSearch/tagPage";
    }









//    @PostMapping("/tagPage")
//    public String TagSelect(){
//        return "tagSearch/tagPage";
//    }


    }




