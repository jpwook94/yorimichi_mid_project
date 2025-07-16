package com.yorimichi.travel.controller.tagSearch;


import com.yorimichi.travel.service.account.AccountService;
import com.yorimichi.travel.service.account.LikesService;
import com.yorimichi.travel.service.tagSearch.TagSearchService;
import com.yorimichi.travel.vo.DestinationVO;
import com.yorimichi.travel.vo.account.AccountVO;
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

    @Autowired
    private AccountService accountService;

    @GetMapping("/tag-search")
    public List<DestinationVO> tagSearch(@RequestParam("tags") ArrayList<String> tag_name, HttpSession session, Model model) {
        System.out.println(tag_name);
        List<DestinationVO> results =  tagSearchService.searchTag(tag_name);
        return results;
    }
}
