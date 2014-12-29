package org.imgsearch.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.imgsearch.vo.UserVO;

public interface UserMapper {
	
//	��ü ȸ�� �� ��ȸ�� ���� ����
	@Select("select count(*) from (select * from tbl_user limit #{dbLimitTotal}, 101) as tbl")
	public int userCount(int dbLimitTotal);
	
	@Select("select * from tbl_user limit #{getDbLimit}, 10")
	public List<UserVO> userList(int getDbLimit);
	
	
//	���� ȸ�� ��ȸ�� ���� ����
	@Select("select * from"
			+ " tbl_user where"
			+ " u_id = #{u_id} || u_email = #{u_email}")
	public List<UserVO> userInquiry(UserVO vo);
	
	
//	ȸ�� �б⸦ ���� ����
	@Select("select * from tbl_user as tbl1 left join tbl_user_grow as tbl2 on tbl1.u_no = tbl2.u_no where tbl1.u_no = #{u_no}")
	public UserVO userRead(UserVO vo);

// ȸ�� ������ ���� ����
@Delete("delete from tbl_user where u_no=#{u_no}")
	public int userDelete(UserVO vo);


//ȸ�� �߰��� ���� ����
@Insert("insert into tbl_user (u_id, u_pw, u_email, u_age, u_gender, u_job, u_type)"
		+ " values(#{u_id}, #{u_pw},#{u_email},#{u_age},#{u_gender},#{u_job},#{u_type})")
	public int userInsert(UserVO vo);

//�ֱ� ��� �� ȸ���� u_no ��������
@Select("select u_no from tbl_user where u_id=#{u_id}")
	public int getUno(UserVO vo);

//ȸ�� ���� �߰��� ���� ����
@Insert("insert tbl_user_grow (u_no, ug_age, ug_view, ug_kind, "
		+ "ug_intell, ug_face, ug_trouble, ug_rumor, ug_Atype, ug_Btype, ug_Ctype )"
		+ " values(#{u_no}, #{ug_age}, #{ug_view},#{ug_kind}, #{ug_intell}, #{ug_face}, #{ug_trouble}, #{ug_rumor}, #{ug_Atype}, #{ug_Btype}, #{ug_Ctype})")
	public void userGrow(UserVO vo);

//ȸ�� ������ ���� ����
@Update("update tbl_user set u_pw =#{u_pw}, u_email=#{u_email}, u_age=#{u_age}, u_gender=#{u_gender}, u_job=#{u_job}, u_type=#{u_type} where u_no = #{u_no}")
	public int userUpdate(UserVO vo);

//ȸ�� ���� ���� Ȯ���� ���� ����
@Select("select count(*) from tbl_user_grow where u_no=#{u_no}")
	public int userGrowCheck(UserVO vo);

//ȸ�� ���� ������ ���� ����
@Update("update tbl_user_grow set"
		+ " ug_age=#{ug_age}, ug_view=#{ug_view}, ug_kind=#{ug_kind}, ug_intell=#{ug_intell}, ug_face=#{ug_face},"
		+ " ug_trouble=#{ug_trouble}, ug_rumor=#{ug_rumor}, ug_Atype=#{ug_Atype}, ug_Btype=#{ug_Btype}, ug_Ctype=#{ug_Ctype}"
		+ " where u_no=#{u_no}")
	public void userGrowUpdate(UserVO vo);



	public String getUserPw(String userId);
}
