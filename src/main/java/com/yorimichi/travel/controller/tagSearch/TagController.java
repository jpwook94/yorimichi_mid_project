package com.yorimichi.travel.controller.tagSearch;


import com.yorimichi.travel.service.tagSearch.TagSearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/api")
@RestController
public class TagController {

    @Autowired
    private TagSearchService tagSearchService;

    @GetMapping("/tagPage")
    public String tagPage(Model model) {
        model.addAttribute("tags1", tagSearchService.getTags(1));
        model.addAttribute("tags2", tagSearchService.getTags(2));
        model.addAttribute("tags3", tagSearchService.getTags(3));
//        model.addAttribute("tags4", tagSearchService.searchGetLocation());
        return "tagSearch/tagPage";
    }








//    @PostMapping("/tagPage")
//    public String TagSelect(){
//        return "tagSearch/tagPage";
//    }


    }




