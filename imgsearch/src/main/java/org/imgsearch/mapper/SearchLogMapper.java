package org.imgsearch.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.imgsearch.common.Criteria;
import org.imgsearch.vo.SearchLogVO;
import org.imgsearch.vo.UserVO;

public interface SearchLogMapper {
	
	@Select("select e_name, sum(tbl1.cnt) as cnt from tbl_eu_match as tbl1 natural join tbl_ent as tbl2 group by tbl1.e_no order by cnt desc limit 5")
	public List<SearchLogVO> favoriteEnt();
	
	@Select("select sl_keyword, count(sl_keyword) as cnt from tbl_searchlog group by sl_keyword order by cnt desc limit 0, 5")
	public List<SearchLogVO> favoriteKeyword();
	
	@Select("select count(*) from (select * from tbl_searchlog limit #{dbLimitTotal}, 101) as tbl")
	public int searchLogCount(Criteria cri);
	
	@Select("select tbl1.sl_no, tbl1.u_no, tbl1.e_no, tbl1.sl_keyword, tbl1.sl_searchdate, tbl2.e_name"
			+ " from tbl_searchlog as tbl1 inner join tbl_ent as tbl2 on tbl1.e_no = tbl2.e_no"
			+" order by tbl1.sl_no desc"
			+ " limit #{dbLimit}, 10")
	public List<SearchLogVO> searchLogList(Criteria cri);

	
}
