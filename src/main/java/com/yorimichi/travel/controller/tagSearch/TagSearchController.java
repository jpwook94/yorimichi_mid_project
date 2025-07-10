package com.yorimichi.travel.controller.tagSearch;


import com.yorimichi.travel.service.tagSearch.TagSearchService;
import com.yorimichi.travel.vo.DestinationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/search")
@RestController
public class TagSearchController {

    @Autowired
    private TagSearchService tagSearchService;




    @GetMapping("/tag-search")
    public List<DestinationVO> tagSearch(@RequestParam("name") String tag_name) {
        System.out.println(tag_name);
        System.out.println(tagSearchService.searchTag(tag_name));
        return tagSearchService.searchTag(tag_name);
    }
//
//
//    @PostMapping("/tagPage")
//    public String TagSelect(){
//        return "tagSearch/tagPage";
//    }




}
