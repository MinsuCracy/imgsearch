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

	// �� ���� ��������
	public List<StoreVO> storeList(Criteria cri) {

		List<StoreVO> list;
		// ���� ������
		if (true) {
			list = mapper.storeList(cri);
		} else { // ���� ������
					// ����� ������ ��� ���ؿ�
			String[] person = mapper.storeListTypePerson(cri);
			// ����� ������ ������� �������� ���������� ���Ե����� ������
			list = mapper.storeListHaveType(person);
		}

		// �Ʒ� ������... �˻������ ������ ��Ŭ����ȵ��Ͻ��� �����༮�� �˻���� ���� �´�.
		// ���� ��Ŭ������� �޴µ�... ���̳��� sql ������ ����... return mapper.storeList2(cri);
		// sql�� �����ؾ���
		if (list.isEmpty() == true) {
			//
			int[] uList = mapper.uDistanceList(cri);
			list = mapper.uDistanceStore(uList);
		}
		return list;

	}

	// �� ���Լ� ���ϱ�
	public int storeTotal(Criteria cri) {

		List<StoreVO> list;
		int total = 0;
		// ���� ������
		if (true) {
			total = mapper.storeTotal(cri);
		} else { // ���� ������
					// ����� ������ ��� ���ؿ�
			String[] person = mapper.storeListTypePerson(cri);
			// ����� ������ ������� �������� ���������� ���Ե����� ������
			total = mapper.storeListHaveTypeTotal(person);
		}

		// �Ʒ� ������... �˻������ ������ ��Ŭ����ȵ��Ͻ��� �����༮�� �˻���� ���� �´�.
		// ���� ��Ŭ������� �޴µ�... ���̳��� sql ������ ����... return mapper.storeList2(cri);
		// sql�� �����ؾ���
		if (total == 0) {
			//
			int[] uList = mapper.uDistanceList(cri);
			total = mapper.uDistanceStoreTotal(uList);
		}
		return total;

	}

	// �̹��� ���� ��������
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

	// ����� ��������(����)
	public StoreVO storeView(Criteria cri) {
		StoreVO vo = mapper.storeView(cri);

		return vo;

	}

	// Ư������ ���� ��ü ��������
	public List<StoreImageVO> storeImgList(Criteria cri) {
		return mapper.storeImgList(cri);

	}

	// ����� �̹��� ��(����Ʈ)
	public List<StoreImageVO> storeMainImgList(List<StoreVO> list) {

		return mapper.storeMainImgList(list);
	}

	// �˻��� ��ġ�α� ����
	public void searchLog(Criteria cri) {
		// ��ġ�α� �ִ´�..
		mapper.searchLog(cri);

		// ���� ������ �ο� �߰�,,, ������ ����
		if (mapper.checkUserGrow(cri) == null) {
			mapper.userGrowInsert(cri);
		} else {
			mapper.userGrowUpdate(cri);
		}
		// ������ ��ũī��Ʈ ������ �ο� �߰�,,, ������ ����
		if (mapper.checkEntCount(cri) == null) {
			mapper.entCountInsert(cri);
		} else {
			mapper.entCountUpdate(cri);
		}

	}

	// ���� �޴�����
	public List<StoreMenuVO> storeMenuList(Criteria cri) {
		return mapper.storeMenuList(cri);
	}

	// ���� ���亸��
	public List<StoreReviewVO> storeReview(Criteria cri) {
		return mapper.storeReview(cri);
	}

	// ���� ���� ��������
	public int storeReviewTotal(Criteria cri) {

		return mapper.storeReviewTotal(cri);

	}

	// ���侲��
	public void storeReviewWrite(StoreReviewVO rvo) {
		mapper.storeReviewWrite(rvo);
	}

	// �������
	public void storeReviewDelete(StoreReviewVO rvo) {
		mapper.storeReviewDelete(rvo);
	}

	// �������
	public void storeReviewModify(StoreReviewVO rvo) {
		mapper.storeReviewModify(rvo);
	}
	
	// ��Ī ������
	public List<EntVO> storeEntMatch(Criteria cri) {
		return mapper.storeEntMatch(cri);
	}
	
	// ���� ī�װ�
	public List<CategoryVO> storeCategory(Criteria cri) {
		return mapper.storeCategory(cri);
	}

}
