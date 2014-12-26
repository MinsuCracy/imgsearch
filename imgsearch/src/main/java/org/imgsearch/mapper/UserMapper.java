package org.imgsearch.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.imgsearch.vo.UserVO;

public interface UserMapper {
	
//	전체 회원 수 조회를 위한 쿼리
	@Select("select count(*) from (select * from tbl_user limit #{dbLimitTotal}, 101) as tbl")
	public int userCount(int dbLimitTotal);
	
	@Select("select * from tbl_user limit #{getDbLimit}, 10")
	public List<UserVO> userList(int getDbLimit);
	
	
//	개별 회원 조회를 위한 쿼리
	@Select("select * from"
			+ " tbl_user where"
			+ " u_id = #{u_id} || u_email = #{u_email}")
	public List<UserVO> userInquiry(UserVO vo);
	
	
//	회원 읽기를 위한 쿼리
	@Select("select * from tbl_user as tbl1 left join tbl_user_grow as tbl2 on tbl1.u_no = tbl2.u_no where tbl1.u_no = #{u_no}")
	public UserVO userRead(UserVO vo);

// 회원 삭제를 위한 쿼리
@Delete("delete from tbl_user where u_no=#{u_no}")
	public int userDelete(UserVO vo);


//회원 추가를 위한 쿼리
@Insert("insert into tbl_user (u_id, u_pw, u_email, u_age, u_gender, u_job, u_type)"
		+ " values(#{u_id}, #{u_pw},#{u_email},#{u_age},#{u_gender},#{u_job},#{u_type})")
	public int userInsert(UserVO vo);

//최근 등록 한 회원의 u_no 가져오기
@Select("select u_no from tbl_user where u_id=#{u_id}")
	public int getUno(UserVO vo);

//회원 성향 추가를 위한 쿼리
@Insert("insert tbl_user_grow (u_no, ug_age, ug_view, ug_kind, "
		+ "ug_intell, ug_face, ug_trouble, ug_rumor, ug_Atype, ug_Btype, ug_Ctype )"
		+ " values(#{u_no}, #{ug_age}, #{ug_view},#{ug_kind}, #{ug_intell}, #{ug_face}, #{ug_trouble}, #{ug_rumor}, #{ug_Atype}, #{ug_Btype}, #{ug_Ctype})")
	public void userGrow(UserVO vo);

//회원 수정을 위한 쿼리
@Update("update tbl_user set u_pw =#{u_pw}, u_email=#{u_email}, u_age=#{u_age}, u_gender=#{u_gender}, u_job=#{u_job}, u_type=#{u_type} where u_no = #{u_no}")
	public int userUpdate(UserVO vo);

//회원 성향 존부 확인을 위한 쿼리
@Select("select count(*) from tbl_user_grow where u_no=#{u_no}")
	public int userGrowCheck(UserVO vo);

//회원 성향 수정을 위한 쿼리
@Update("update tbl_user_grow set"
		+ " ug_age=#{ug_age}, ug_view=#{ug_view}, ug_kind=#{ug_kind}, ug_intell=#{ug_intell}, ug_face=#{ug_face},"
		+ " ug_trouble=#{ug_trouble}, ug_rumor=#{ug_rumor}, ug_Atype=#{ug_Atype}, ug_Btype=#{ug_Btype}, ug_Ctype=#{ug_Ctype}"
		+ " where u_no=#{u_no}")
	public void userGrowUpdate(UserVO vo);



	public String getUserPw(String userId);
}
