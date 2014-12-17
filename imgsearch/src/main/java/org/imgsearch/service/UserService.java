package org.imgsearch.service;

import java.util.List;

import javax.inject.Inject;

import org.imgsearch.mapper.UserMapper;
import org.imgsearch.vo.UserVO;
import org.springframework.stereotype.Service;

@Service
public class UserService {
	
	
	@Inject
	UserMapper um;
	
	UserVO vo = new UserVO();
	
//	유저 수를 조회하기 위한 서비스
	public int userCount(){
		return um.userCount();
	}
	
//	유저 목록을 보여주기 위한 서비스
	public List<UserVO> userList(){
		return um.userList();
	}
	
	
//	개별 유저를 조회하기 위한 서비스
	public List<UserVO> userInquiry(){
		return um.userInquiry(vo);
	}
	
//	광역 삭제 || 선택 삭제
//	추후 관리자 타입을 넣어서 관리자끼리는 삭제 못 하도록 변경 예정
	
	public void userDelete(List<UserVO> userList){
		
		int count = userList.size();
		
		for (int i = 0; i < count; i++) {
			
			vo.setU_id(userList.get(i).toString());
			um.userDelete(vo);
		}

		
	}

}
