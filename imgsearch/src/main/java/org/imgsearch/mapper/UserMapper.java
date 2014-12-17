package org.imgsearch.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.imgsearch.vo.UserVO;

public interface UserMapper {
	
//	��ü ȸ�� �� ��ȸ�� ���� ����
	@Select("select count(*) from tbl_user")
	public int userCount();
	
	@Select("select * from tbl_user")
	public List<UserVO> userList();
	
	
//	���� ȸ�� ��ȸ�� ���� ����
	@Select("select * from"
			+ " tbl_user where"
			+ " u_id = #{u_id} || u_email = #{u_email}")
	public List<UserVO> userInquiry(UserVO vo);
	

// ȸ�� ������ ���� ����
@Delete("delete from tbl_user where u_id=#{u_id}")
	public int userDelete(UserVO vo);



}