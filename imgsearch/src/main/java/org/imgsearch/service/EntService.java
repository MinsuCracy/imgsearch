package org.imgsearch.service;

import java.util.List;

import javax.inject.Inject;

import org.imgsearch.common.Criteria;
import org.imgsearch.mapper.EntMapper;
import org.imgsearch.vo.EntVO;
import org.imgsearch.vo.StoreVO;
import org.imgsearch.web.HomeController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class EntService {

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	@Inject
	private EntMapper entMapper;

	public List<EntVO> entList(Criteria cri) {
		return entMapper.entList(cri);
	}

	public int entTotal(Criteria cri) {
		return entMapper.entTotalCount(cri);
	}

	public EntVO entRead(int e_no) {
		return entMapper.entRead(e_no);
	}

	public void entRegist(EntVO entVO) {
		entVO.setE_Atype(entVO.getE_age()); // A type 설정
		
		double btype = (entVO.getE_view() + entVO.getE_kind()) / 2.0;
		entVO.setE_Btype(btype); // B type 설정

		double ctype = (entVO.getE_intell() + entVO.getE_face() + entVO.getE_trouble() + entVO.getE_rumor()) / 4.0;
		entVO.setE_Ctype(ctype); // C type 설정

		entMapper.entRegist(entVO);
	}

	public void entModify(EntVO entVO) {
		entVO.setE_Atype(entVO.getE_age()); // A type 설정

		double btype = (entVO.getE_view() + entVO.getE_kind()) / 2.0;
		entVO.setE_Btype(btype); // B type 설정

		double ctype = (entVO.getE_intell() + entVO.getE_face() + entVO.getE_trouble() + entVO.getE_rumor()) / 4.0;
		entVO.setE_Ctype(ctype); // C type 설정

		entMapper.entModify(entVO);
	}

	public void entRemove(int e_no) {
		entMapper.entRemove(e_no);
	}
	
	public List<StoreVO> entStore(int e_no){
		return entMapper.entStore(e_no);
	}

}
