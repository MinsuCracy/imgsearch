package org.imgsearch.service;

import java.util.List;

import javax.inject.Inject;

import org.imgsearch.mapper.AdminMapper;
import org.imgsearch.vo.KeywordVO;
import org.springframework.stereotype.Service;

@Service
public class AdminService implements AdminMapper{

	@Inject
	private AdminMapper am;
	
	@Override
	public void keywordInsert(KeywordVO vo) throws Exception {
		am.keywordInsert(vo);
	}


	@Override
	public List<KeywordVO> keywordSelect() throws Exception {
		return am.keywordSelect();
	}


	@Override
	public void keywordUpdate(KeywordVO vo) throws Exception {
		am.keywordUpdate(vo);
	}


	@Override
	public void keywordDelete(int k_no) throws Exception {
		am.keywordDelete(k_no);
	}
}
