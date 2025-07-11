package com.yorimichi.travel.mapper;

import com.yorimichi.travel.vo.DestinationVO;
import com.yorimichi.travel.vo.LocationVO;
import com.yorimichi.travel.vo.tagSearch.TagVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Mapper
public interface TagSearchMapper {


    @Select(
            "select * " +
                    "from tag, tag_category " +
                    "where tag_id = tag_categroy_tag_id " +
                    "order by tag_category_name")
    public List<Map<String, Object>> getAllTags();


    @Select(
            "select *" +
                    "from location")
    public List<LocationVO> searchGetLocation();


    @Select("select * " +
            "from destination " +
            "join destination_tag on destination_number = destination_tag_destination_number " +
            "join tag on destination_tag_tag_id = tag_id " +
            "where tag_name = #{tag_name[0]}")
    public List<DestinationVO> searchGetDestinationByTag(ArrayList<String> tag_name);


    @Select("select * " +
            "from destination " +
            "join location " +
            "on destination_number = location_number " +
            "where location_name = #{tag_name[0]}")
    public List<DestinationVO> searchGetDestinationByLocation(ArrayList<String> tag_name);

    @Select("select count(*) from tag where tag_name = #{tag_name[0]}")
    public int existsInTag(ArrayList<String> tag_name);

    @Select("select count(*) from location where location_name = #{tag_name[0]}")
    public int existsInLocation(ArrayList<String> tag_name);

}
