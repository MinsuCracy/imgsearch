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
	
//	���� ���� ��ȸ�ϱ� ���� ����
	public int userCount(){
		return um.userCount();
	}
	
//	���� ����� �����ֱ� ���� ����
	public List<UserVO> userList(){
		return um.userList();
	}
	
	
//	���� ������ ��ȸ�ϱ� ���� ����
	public List<UserVO> userInquiry(){
		return um.userInquiry(vo);
	}
	
//	���� ���� || ���� ����
//	���� ������ Ÿ���� �־ �����ڳ����� ���� �� �ϵ��� ���� ����
	
	public void userDelete(List<UserVO> userList){
		
		int count = userList.size();
		
		for (int i = 0; i < count; i++) {
			
			vo.setU_id(userList.get(i).toString());
			um.userDelete(vo);
		}

		
	}

}
