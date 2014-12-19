package org.imgsearch.mapper;

import java.util.List;

import org.imgsearch.vo.KeywordVO;


public interface AdminMapper {
	
	public void keywordInsert(KeywordVO vo)throws Exception;
	
	public List<KeywordVO> keywordSelect()throws Exception;
	
	public void keywordUpdate(KeywordVO vo)throws Exception;
	
	public void keywordDelete(int k_no)throws Exception;
	
}
