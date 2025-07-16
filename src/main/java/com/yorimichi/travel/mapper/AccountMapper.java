package com.yorimichi.travel.mapper;

import com.yorimichi.travel.vo.DestinationVO;
import com.yorimichi.travel.vo.account.AccountVO;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface AccountMapper {

    @Select("select * from users")
    public List<AccountVO> selectAll();

    @Select("select  * from users where user_id=#{user_id}")
    AccountVO selectById(String userId);

    @Select("select * from destination")
    public List<DestinationVO> selectAllDestination();

    @Select("SELECT COUNT(*) FROM users WHERE user_id = #{user_id}")
    int countByUserId(String user_id); // 아이디로 개수를 세는 메서드 추가

    @Select("SELECT * FROM users WHERE user_id = #{user_id} AND user_pw = #{user_pw}")
    AccountVO login(@Param("user_id") String user_id, @Param("user_pw") String user_pw);

    @Insert("insert into users values (#{user_id},#{user_name},#{user_email},#{user_pw})")
    int insertUser(AccountVO user);

    @Update({"<script>",
            "UPDATE users",
            "  <set>",
            "    <if test='user_name != null and user_name != \"\"'>",
            "      user_name = #{user_name, jdbcType=VARCHAR},",
            "    </if>",
            "    <if test='user_email != null and user_email != \"\"'>",
            "      user_email = #{user_email, jdbcType=VARCHAR},",
            "    </if>",
            "    <if test='user_pw != null and user_pw != \"\"'>",
            "      user_pw = #{user_pw, jdbcType=VARCHAR},",
            "    </if>",
            "  </set>",
            "WHERE user_id = #{user_id, jdbcType=VARCHAR}",
            "</script>"})
    int updateUser(AccountVO user);
}
