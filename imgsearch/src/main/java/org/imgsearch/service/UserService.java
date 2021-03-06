package org.imgsearch.service;

import java.util.List;

import javax.inject.Inject;

import org.imgsearch.mapper.UserMapper;
import org.imgsearch.vo.StoreVO;
import org.imgsearch.vo.UserVO;
import org.springframework.stereotype.Service;



@Service
public class UserService{
	
	
	
	
	@Inject
	UserMapper um;
	
//	유저 생성을 위한 서비스
	public String userInsert(UserVO vo){
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
	
//	유저 수를 조회하기 위한 서비스
	public int userCount(int dbLimitTotal){
		return um.userCount(dbLimitTotal);
	}
	
//	유저 목록을 보여주기 위한 서비스
	public List<UserVO> userList(int getDbLimit){
		return um.userList(getDbLimit);
	}
	
//	개별 유저를 조회하기 위한 서비스
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
	
	
// 유저 정보를 읽기 위한 서비스
	public UserVO userRead(UserVO vo){
		vo = um.userRead(vo);
		return vo;
	}
	
//	유저의 정보를 변경하기 위한 서비스
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
	
	
	
	
//	삭제를 위한 서비스
	public String userDelete(UserVO vo){
		
		String result = "fail";

		if(um.userDelete(vo) != 0){
			result="success";
		}

		return result;
		
		
	}

	public List<UserVO> frienList(String userId) {
		return um.getFriendList(userId);
	}
	
	public List<StoreVO> getBookMark(String userId){
		return um.getBookMark(userId);
	}
	
}
