package com.yorimichi.travel.controller.tagSearch;


import com.yorimichi.travel.service.account.LikesService;
import com.yorimichi.travel.service.tagSearch.TagSearchService;
import com.yorimichi.travel.vo.DestinationVO;
import com.yorimichi.travel.vo.account.AccountVO;
import com.yorimichi.travel.vo.tagSearch.TagVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RequestMapping("/search")
@RestController
public class TagSearchController {

    @Autowired
    private TagSearchService tagSearchService;

    @Autowired
    private LikesService likesService;



    @GetMapping("/tag-search")
    public List<DestinationVO> tagSearch(@RequestParam("tags") ArrayList<String> tag_name) {
//        System.out.println(tag_name);
        List<DestinationVO> results =  tagSearchService.searchTag(tag_name);
        return results;
    }

    @GetMapping("/dest-search")
    public List<TagVO> destSearch(@RequestParam("dest") int destination_number) {
        System.out.println("목적지 번호 : " + destination_number);
        List<TagVO> results =  tagSearchService.searchdest(destination_number);
        return results;
    }




}
