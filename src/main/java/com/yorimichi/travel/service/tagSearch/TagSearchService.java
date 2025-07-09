package com.yorimichi.travel.service.tagSearch;

import com.yorimichi.travel.mapper.TagSearchMapper;
import com.yorimichi.travel.vo.tagSearch.TagSearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TagSearchService {

    @Autowired
    private TagSearchMapper tagSearchMapper;

//    public List<TestVO> getAllTest(){
//        ArrayList<TestVO> list = new ArrayList<>();
//        TestVO test =  new TestVO();
//        test.setTest("11");
//        list.add(test);
//        test =  new TestVO();
//        test.setTest("22");
//        list.add(test);
//        return list;
//    }


    public List<TagSearchVO> getTags(int category_id) {
        return tagSearchMapper.getAllTags(category_id);
    }

//    public List<LocationVO> searchGetLocation() {
//    }
}
