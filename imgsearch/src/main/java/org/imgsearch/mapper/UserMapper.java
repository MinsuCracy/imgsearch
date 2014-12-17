package org.imgsearch.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.imgsearch.vo.UserVO;

public interface UserMapper {
	
//	전체 회원 수 조회를 위한 쿼리
	@Select("select count(*) from tbl_user")
	public int userCount();
	
	@Select("select * from tbl_user")
	public List<UserVO> userList();
	
	
//	개별 회원 조회를 위한 쿼리
	@Select("select * from"
			+ " tbl_user where"
			+ " u_id = #{u_id} || u_email = #{u_email}")
	public List<UserVO> userInquiry(UserVO vo);
	

// 회원 삭제를 위한 쿼리
@Delete("delete from tbl_user where u_id=#{u_id}")
	public int userDelete(UserVO vo);



}