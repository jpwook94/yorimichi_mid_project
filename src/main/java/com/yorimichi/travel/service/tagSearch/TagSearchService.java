package com.yorimichi.travel.service.tagSearch;

import com.yorimichi.travel.mapper.TagSearchMapper;
import com.yorimichi.travel.vo.DestinationVO;
import com.yorimichi.travel.vo.LocationVO;
import com.yorimichi.travel.vo.tagSearch.TagVO;
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


    public List<TagVO> getTags(String category_name) {
        return tagSearchMapper.getAllTags(category_name);
    }

    public List<LocationVO> searchGetLocation() {
        return tagSearchMapper.searchGetLocation();
    }


    public List<DestinationVO> searchTag(String tagname) {
        boolean isTag = 0 < tagSearchMapper.existsInTag(tagname);
        boolean isLocation = 0 < tagSearchMapper.existsInLocation(tagname);
        System.out.println(tagname);
        System.out.println(isTag);
        System.out.println(isLocation);

        if (isTag) {
            return tagSearchMapper.searchGetDestinationByTag(tagname);
        } else if (isLocation) {
            return tagSearchMapper.searchGetDestinationByLocation(tagname);
        } else {
            return null;
        }





    }


}
