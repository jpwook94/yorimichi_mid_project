package com.yorimichi.travel.controller.tagSearch;


import com.yorimichi.travel.service.tagSearch.TagSearchService;
import com.yorimichi.travel.vo.DestinationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RequestMapping("/search")
@RestController
public class TagSearchController {

    @Autowired
    private TagSearchService tagSearchService;




    @GetMapping("/tag-search")
    public List<DestinationVO> tagSearch(@RequestParam("tags") ArrayList<String> tag_name) {
        System.out.println(tag_name);
        List<DestinationVO> results =  tagSearchService.searchTag(tag_name);
        return results;
    }
//
//
//    @PostMapping("/tagPage")
//    public String TagSelect(){
//        return "tagSearch/tagPage";
//    }




}
