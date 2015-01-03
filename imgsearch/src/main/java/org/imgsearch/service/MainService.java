package org.imgsearch.service;

import java.util.List;

import javax.inject.Inject;

import org.imgsearch.common.Criteria;
import org.imgsearch.mapper.MainMapper;
import org.imgsearch.vo.CategoryVO;
import org.imgsearch.vo.EntVO;
import org.imgsearch.vo.StoreImageVO;
import org.imgsearch.vo.StoreMenuVO;
import org.imgsearch.vo.StoreReviewVO;
import org.imgsearch.vo.StoreVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

@Service
public class MainService {

	private static final Logger logger = LoggerFactory
			.getLogger(MainService.class);

	@Inject
	private MainMapper mapper;

	// ㄱ ㅏ게 가져오기
	public List<StoreVO> storeList(Criteria cri) {

		List<StoreVO> list;
		// 성향 없을때
		if (true) {
			list = mapper.storeList(cri);
		} else { // 성향 있을때
					// 비슷한 유형의 사람 구해옴
			String[] person = mapper.storeListTypePerson(cri);
			// 비슷한 유형의 사람으로 리뷰평점 높은순으로 가게데이터 가져옴
			list = mapper.storeListHaveType(person);
		}

		// 아래 이프문... 검색결과가 없을때 유클리디안디스턴스로 가까운녀석들 검색결과 갖고 온다.
		// 현재 유클리디안은 햇는데... 다이나믹 sql 구현을 못함... return mapper.storeList2(cri);
		// sql문 수정해야함
		if (list.isEmpty() == true) {
			//
			int[] uList = mapper.uDistanceList(cri);
			list = mapper.uDistanceStore(uList);
		}
		return list;

	}

	// 총 가게수 구하기
	public int storeTotal(Criteria cri) {

		List<StoreVO> list;
		int total = 0;
		// 성향 없을때
		if (true) {
			total = mapper.storeTotal(cri);
		} else { // 성향 있을때
					// 비슷한 유형의 사람 구해옴
			String[] person = mapper.storeListTypePerson(cri);
			// 비슷한 유형의 사람으로 리뷰평점 높은순으로 가게데이터 가져옴
			total = mapper.storeListHaveTypeTotal(person);
		}

		// 아래 이프문... 검색결과가 없을때 유클리디안디스턴스로 가까운녀석들 검색결과 갖고 온다.
		// 현재 유클리디안은 햇는데... 다이나믹 sql 구현을 못함... return mapper.storeList2(cri);
		// sql문 수정해야함
		if (total == 0) {
			//
			int[] uList = mapper.uDistanceList(cri);
			total = mapper.uDistanceStoreTotal(uList);
		}
		return total;

	}

	// 이미지 정보 가져오기
	public List<EntVO> entImg(@ModelAttribute("cri") Criteria cri) {

		List<EntVO> list;
		if (cri.getType().equals("default")) {
			list = mapper.entImgDefault(cri);
		} else if (cri.getType().equals("rank")) {
			list = mapper.entImgRank(cri);
		} else {
			list = mapper.entImgStyle(cri);
		}
		return list;
	}

	public int entImgTotal() {

		return mapper.entImgTotal();
	}

	// 스토어 정보보기(리드)
	public StoreVO storeView(Criteria cri) {
		StoreVO vo = mapper.storeView(cri);

		return vo;

	}

	// 특정가게 사진 전체 가져오기
	public List<StoreImageVO> storeImgList(Criteria cri) {
		return mapper.storeImgList(cri);

	}

	// 스토어 이미지 뷰(리스트)
	public List<StoreImageVO> storeMainImgList(List<StoreVO> list) {

		return mapper.storeMainImgList(list);
	}

	// 검색시 서치로그 저장
	public void searchLog(Criteria cri) {
		// 서치로그 넣는다..
		mapper.searchLog(cri);

		// 성향 없으면 로우 추가,,, 잇으면 수정
		if (mapper.checkUserGrow(cri) == null) {
			mapper.userGrowInsert(cri);
		} else {
			mapper.userGrowUpdate(cri);
		}
		// 연예인 랭크카운트 없으면 로우 추가,,, 잇으면 수정
		if (mapper.checkEntCount(cri) == null) {
			mapper.entCountInsert(cri);
		} else {
			mapper.entCountUpdate(cri);
		}

	}

	// 가게 메뉴보기
	public List<StoreMenuVO> storeMenuList(Criteria cri) {
		return mapper.storeMenuList(cri);
	}

	// 가게 리뷰보기
	public List<StoreReviewVO> storeReview(Criteria cri) {
		return mapper.storeReview(cri);
	}

	// 가게 리뷰 갯수보기
	public int storeReviewTotal(Criteria cri) {

		return mapper.storeReviewTotal(cri);

	}

	// 리뷰쓰기
	public void storeReviewWrite(StoreReviewVO rvo) {
		mapper.storeReviewWrite(rvo);
	}

	// 리뷰삭제
	public void storeReviewDelete(StoreReviewVO rvo) {
		mapper.storeReviewDelete(rvo);
	}

	// 리뷰수정
	public void storeReviewModify(StoreReviewVO rvo) {
		mapper.storeReviewModify(rvo);
	}
	
	// 매칭 연예인
	public List<EntVO> storeEntMatch(Criteria cri) {
		return mapper.storeEntMatch(cri);
	}
	
	// 가게 카테고리
	public List<CategoryVO> storeCategory(Criteria cri) {
		return mapper.storeCategory(cri);
	}

}
