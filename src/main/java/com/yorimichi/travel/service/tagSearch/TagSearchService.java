package com.yorimichi.travel.service.tagSearch;

import com.yorimichi.travel.mapper.TagSearchMapper;
import com.yorimichi.travel.vo.DestinationVO;
import com.yorimichi.travel.vo.LocationVO;
import com.yorimichi.travel.vo.tagSearch.TagVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

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


    public Map<String, List<TagVO>> getTags() {
        List<TagVO> tags = tagSearchMapper.getAllTags();
        List<TagVO> temp = new ArrayList<>();
        List<TagVO> temp2 = new ArrayList<>();
        List<TagVO> temp3 = new ArrayList<>();
        Map<String, List<TagVO>> results = new HashMap<>();
        tags.forEach(tag -> {
            if (tag.getTag_category_name().equals("동행자 관계")) {
                temp.add(tag);
                results.put(tag.getTag_category_name(), temp);
            } else if (tag.getTag_category_name().equals("목적")) {
                temp2.add(tag);
                results.put(tag.getTag_category_name(), temp2);
            } else if (tag.getTag_category_name().equals("카테고리")) {
                temp3.add(tag);
                results.put(tag.getTag_category_name(), temp3);
            }
        });
        System.out.println(">>>>>>>>>>>>>>>>>>>>");
        System.out.println(results);
        return results;
    }

    public List<LocationVO> searchGetLocation() {
        return tagSearchMapper.searchGetLocation();
    }


    public List<DestinationVO> searchTag(ArrayList<String> tagname) {
        List<DestinationVO> destinations = null;


        for (String tag : tagname) {
            List<DestinationVO> dest = null;

            if (tagSearchMapper.existsInTag(tag) > 0) {
                dest = tagSearchMapper.searchGetDestinationByTag(tag);
            } else if (tagSearchMapper.existsInLocation(tag) > 0) {
                dest = tagSearchMapper.searchGetDestinationByLocation(tag);
            } else {
                return Collections.emptyList();
            }


            if (destinations == null) {
                destinations = new ArrayList<>();
                destinations.addAll(dest); // 첫 결과는 그대로 저장
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
