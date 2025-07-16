package com.yorimichi.travel.mapper;

import com.yorimichi.travel.vo.DestinationVO;
import com.yorimichi.travel.vo.LocationVO;
import com.yorimichi.travel.vo.tagSearch.TagVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;
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
            "from destination d " +
            "join location l " +
            "on d.location_number = l.location_number " +
            "where location_name = #{tag_name}")
    public List<DestinationVO> searchGetDestinationByLocation(String tag_name);

    @Select("select count(*) from tag where tag_name = #{tag_name}")
    public int existsInTag(String tag_name);

    @Select("select count(*) from location where location_name = #{tag_name}")
    public int existsInLocation(String tag_name);

    @Select("select * from tag t " +
            "join destination_tag dt on t.tag_id = dt.destination_tag_tag_id " +
            "join destination d on dt.destination_tag_destination_number = d.destination_number " +
            "where d.destination_number = #{destination_number}")
    public List<TagVO> searchGetTagByDestN(int destination_number);
}
