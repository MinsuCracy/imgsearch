package org.imgsearch.mapper;

import java.util.List;

import org.imgsearch.common.Criteria;
import org.imgsearch.vo.UserLogVO;

	public interface UserLogMapper {
		
		public List<UserLogVO> userLogList(Criteria cri);
		
		public int userLogTotalCount(Criteria cri);
		
}
