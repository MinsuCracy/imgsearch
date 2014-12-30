package org.imgsearch.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.inject.Inject;

import org.imgsearch.mapper.UserMapper;
import org.imgsearch.vo.UserVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserService implements UserDetailsService{
	
	String userPw = null;
	int uno = 0;
	
	private static final Logger logger = LoggerFactory.getLogger(UserService.class);
	
	@Inject
	UserMapper um;
	
//	���� ������ ���� ����
	public String userInsert(UserVO vo){
//		�Ʒ��� ������� ���ϸ� ���⼭ �ɷ��ݴϴ�.
		String result = "fail";
		
		if(vo.getU_id() != null && 
				vo.getU_pw() != null && 
				vo.getU_email() != null && 
				vo.getU_age() > 0 && 
				vo.getU_gender()!=null){
			
				um.userInsert(vo);
				int uno = um.getUno(vo);
				
				vo.setU_no(uno);
				vo.setUg_Atype(vo.getUg_age());
				vo.setUg_Btype((vo.getUg_view()+vo.getUg_kind())/2);
				vo.setUg_Ctype((vo.getUg_intell()+vo.getUg_face()+vo.getUg_trouble()+vo.getUg_rumor())/4);
				um.userGrow(vo);
				result = "success";
			
		}
		
		return result;
	}
	
//	���� ���� ��ȸ�ϱ� ���� ����
	public int userCount(int dbLimitTotal){
		return um.userCount(dbLimitTotal);
	}
	
//	���� ����� �����ֱ� ���� ����
	public List<UserVO> userList(int getDbLimit){
		return um.userList(getDbLimit);
	}
	
//	���� ������ ��ȸ�ϱ� ���� ����
	public List<UserVO> userInquiry(String inputData){

		UserVO vo = new UserVO();
		
		int atMarkResult = inputData.indexOf("@");
		int dotResult = inputData.indexOf(".");
		
		if(atMarkResult > 0 && atMarkResult < dotResult){
			vo.setU_email(inputData);
		}
		
		if(atMarkResult == -1 && dotResult == -1){
			vo.setU_id(inputData);
		}
		
		return um.userInquiry(vo);
	}
	
	
// ���� ������ �б� ���� ����
	public UserVO userRead(UserVO vo){
		vo = um.userRead(vo);
		return vo;
	}
	
//	������ ������ �����ϱ� ���� ����
	public String userUpdate(UserVO vo){
		String result = "fail";
		if(vo.getU_no() > 0 && 
				vo.getU_pw() != null && 
				vo.getU_email() != null && 
				vo.getU_age() > 0 && 
				vo.getU_gender()!=null){
			try{
				um.userUpdate(vo);
				vo.setUg_Atype(vo.getUg_age());
				vo.setUg_Btype((vo.getUg_view()+vo.getUg_kind())/2);
				vo.setUg_Ctype((vo.getUg_intell()+vo.getUg_face()+vo.getUg_trouble()+vo.getUg_rumor())/4);
				if(um.userGrowCheck(vo) >0){
					um.userGrowUpdate(vo);
				}else{
					um.userGrow(vo);
				}
				
				result = "success";
				}catch(Exception e){
				}
		}
		
		return result;
	}
	
	
	
	
//	������ ���� ����
	public String userDelete(UserVO vo){
		
		String result = "fail";

		if(um.userDelete(vo) != 0){
			result="success";
		}

		return result;
		
		
	}
	private UserMapper userMapper;
	
	
	public void setUserMapper(UserMapper userMapper){
		this.userMapper = userMapper;
	}
	
	
	//�α���
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		
		
//		String userPw = userMapper.getUserPw(userName);
		UserVO vo = userMapper.getUser(userName);
		
		uno = vo.getU_no();
		userPw = vo.getU_pw();
			
		setUno(uno);
		
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
		roles.add(new SimpleGrantedAuthority("ROLE_USER"));

		UserDetails user = new User(userName, userPw, roles);

		return user;
	}
	//���� uno
	public void setUno(int uno)
    {
        this.uno = uno;
    }
	//���� uno
    public int getUno()
    {
        return uno;
    }
    
    //ģ�� ��� �ϱ����� ���翩��
	public UserVO existFriend(UserVO vo) {
		return um.exist(vo);
	}

	public void insertFriend(UserVO vo) {
		um.insertFriend(vo);
		
	}
}
