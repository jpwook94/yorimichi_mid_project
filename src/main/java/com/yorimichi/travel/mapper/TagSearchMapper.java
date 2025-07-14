package com.yorimichi.travel.mapper;

import com.yorimichi.travel.vo.DestinationVO;
import com.yorimichi.travel.vo.LocationVO;
import com.yorimichi.travel.vo.tagSearch.TagVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface TagSearchMapper {


    @Select(
            "select * " +
                    "from tag t, tag_category tc " +
                    "where t.tag_id = tc.tag_category_tag_id " +
                    "order by tag_category_name")
    public List<TagVO> getAllTags();


    @Select(
            "select *" +
                    "from location")
    public List<LocationVO> searchGetLocation();


    @Select("select * " +
            "from destination " +
            "join destination_tag on destination_number = destination_tag_destination_number " +
            "join tag on destination_tag_tag_id = tag_id " +
            "where tag_name = #{tag_name}")
    public List<DestinationVO> searchGetDestinationByTag(String tag_name);


    @Select("select * " +
            "from destination " +
            "join location " +
            "on destination_number = location_number " +
            "where location_name = #{tag_name[0]}")
    public List<DestinationVO> searchGetDestinationByLocation(String tag_name);

    @Select("select count(*) from tag where tag_name = #{tag_name[0]}")
    public int existsInTag(String tag_name);

    @Select("select count(*) from location where location_name = #{tag_name[0]}")
    public int existsInLocation(String tag_name);

}
