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
                    "from tag " +
                    "join tag_category " +
                    "on tag_id = tag_category_tag_id " +
                    "where tag_category_name = #{category_name}")
    public List<TagVO> getAllTags(String category_name);


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
            "where location_name = #{tag_name}")
    public List<DestinationVO> searchGetDestinationByLocation(String tag_name);

    @Select("select count(*) from tag where tag_name = #{tag_name}")
    public int existsInTag(String tag_name);

    @Select("select count(*) from location where location_name = #{tag_name}")
    public int existsInLocation(String tag_name);

}
