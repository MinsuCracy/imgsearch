package org.imgsearch.mapper;

import java.util.List;

import org.imgsearch.common.Criteria;
import org.imgsearch.vo.EntVO;
import org.imgsearch.vo.StoreVO;

public interface EntMapper {
	
	public List<EntVO> entList(Criteria cri);

	public int entTotalCount(Criteria cri);
	
	public EntVO entRead(int e_no);
	
	public void entRegist(EntVO entVO);
	
	public void entModify(EntVO entVO);
	
	public void entRemove(int e_no);
	
	public List<StoreVO> entStore(int e_no);
	
	public EntVO entSearch(String e_name);
	
}
