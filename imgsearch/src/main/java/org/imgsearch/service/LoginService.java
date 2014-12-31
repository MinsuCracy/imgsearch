package org.imgsearch.service;

import java.util.ArrayList;
import java.util.Collection;

import javax.inject.Inject;

import org.imgsearch.mapper.UserMapper;
import org.imgsearch.vo.UserVO;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class LoginService implements UserDetailsService {

	private UserMapper userMapper;
	String userPw = null;
	int uno = 0;

	public void setUserMapper(UserMapper userMapper){
		this.userMapper = userMapper;
	}
	
	@Override
	public UserDetails loadUserByUsername(String userName){
//	String userPw = userMapper.getUserPw(userName);
	UserVO vo = userMapper.getUser(userName);
	
	uno = vo.getU_no();
	userPw = vo.getU_pw();
		
	setUno(uno);
	
	Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
	roles.add(new SimpleGrantedAuthority("ROLE_USER"));
	UserDetails user = new User(userName, userPw, roles);

	return user;
	}

	
	//유저 uno
	public void setUno(int uno)
    {
        this.uno = uno;
    }
	//유저 uno
    public int getUno()
    {
        return uno;
    }
    
    //친구 등록 하기전에 존재여부
	public UserVO existFriend(UserVO vo) {
		return userMapper.exist(vo);
	}

	public void insertFriend(UserVO vo) {
		userMapper.insertFriend(vo);
		
	}
}
