package com.yorimichi.travel.service.tagSearch;

import com.yorimichi.travel.mapper.TagSearchMapper;
import com.yorimichi.travel.vo.DestinationVO;
import com.yorimichi.travel.vo.LocationVO;
import com.yorimichi.travel.vo.tagSearch.TagVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

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


    public List<Map<String, Object>> getTags() {

        return tagSearchMapper.getAllTags();
    }

    public List<LocationVO> searchGetLocation() {
        return tagSearchMapper.searchGetLocation();
    }


    public List<DestinationVO> searchTag(ArrayList<String> tagname) {
        List<DestinationVO> destinations = null;


        for (String tag : tagname) {
            List<DestinationVO> dest = null;

            if (tagSearchMapper.existsInTag(tagname) > 0) {
                dest = tagSearchMapper.searchGetDestinationByTag(tagname);
            } else if (tagSearchMapper.existsInLocation(tagname) > 0) {
                dest = tagSearchMapper.searchGetDestinationByLocation(tagname);
            } else {
                return Collections.emptyList();
            }



            if (destinations == null) {
                destinations = new ArrayList<>(dest); // 첫 결과는 그대로 저장
            } else {
                destinations.retainAll(dest); // 그 이후부터는 교집합
            }

            if (destinations.isEmpty()) {
                return Collections.emptyList();
            }



        }
        return destinations == null ? Collections.emptyList() : destinations;



//        List<DestinationVO> destinations = null;
//
//
//        for (String tag : tagname) {
//
//
//            boolean isTag = 0 < tagSearchMapper.existsInTag(tagname);
//            boolean isLocation = 0 < tagSearchMapper.existsInLocation(tagname);
//            System.out.println(tagname);
//            System.out.println(isTag);
//            System.out.println(isLocation);
//
//            if (isTag) {
//                destinations.add() tagSearchMapper.searchGetDestinationByTag(tagname);
//            } else if (isLocation) {
//                return tagSearchMapper.searchGetDestinationByLocation(tagname);
//            }
//        }


    }


}
