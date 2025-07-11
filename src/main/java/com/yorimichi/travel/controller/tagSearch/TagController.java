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
        List<Map<String, Object>> tagList = tagSearchService.getTags();
        List<Map<String, TagVO>> results = new ArrayList<>();

        for (Map<String, Object> map : tagList) {
            Map<String, TagVO> tags = new HashMap<>();
            int tag_id = (int) map.get("tag_id");
            String tag_name = (String) map.get("tag_name");
            String categoryName = (String) map.get("tag_category_name");

            TagVO tag = new TagVO();
            tag.setTag_id(tag_id);
            tag.setTag_name(tag_name);

            tags.put(categoryName, tag);
            results.add(tags);
        }

        model.addAttribute("tagList", results);




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




