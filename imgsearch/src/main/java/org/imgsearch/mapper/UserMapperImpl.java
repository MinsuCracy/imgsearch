package org.imgsearch.mapper;

import java.util.List;

import org.imgsearch.vo.UserVO;
import org.mybatis.spring.support.SqlSessionDaoSupport;

public class UserMapperImpl extends SqlSessionDaoSupport implements UserMapper {



	@Override
	public List<UserVO> userInquiry(UserVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int userDelete(UserVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String getUserPw(String userid) {
		return (String)getSqlSession().selectOne("org.imgsearch.mapper.UserMapper.getUserPw", userid);
	}

	@Override
	public int userCount(int dbLimitTotal) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UserVO> userList(int getDbLimit) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserVO userRead(UserVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int userInsert(UserVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getUno(UserVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void userGrow(UserVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int userUpdate(UserVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int userGrowCheck(UserVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void userGrowUpdate(UserVO vo) {
		// TODO Auto-generated method stub
		
	}

}
