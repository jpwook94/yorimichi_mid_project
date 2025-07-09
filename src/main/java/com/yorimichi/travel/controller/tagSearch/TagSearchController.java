package com.yorimichi.travel.controller.tagSearch;


import com.yorimichi.travel.service.tagSearch.TagSearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class TagSearchController {

    @Autowired
    private TagSearchService tagSearchService;




    @GetMapping("/tagPage")
    public String tagPage() {
        return "tagSearch/tagPage";
    }


    @PostMapping("/tagPage")
    public String TagSelect(){
        return "tagSearch/tagPage";
    }




}
