package org.imgsearch.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.imgsearch.common.Criteria;
import org.imgsearch.vo.EntVO;
import org.imgsearch.vo.StoreCVO;
import org.imgsearch.vo.StoreEVO;
import org.imgsearch.vo.StoreImageVO;
import org.imgsearch.vo.StoreKVO;
import org.imgsearch.vo.StoreMVO;
import org.imgsearch.vo.StoreReviewVO;
import org.imgsearch.vo.StoreVO;


public interface StoreMapper {
	@Select("select * from tbl_store "
			+ " WHERE #{type} LIKE concat('%',#{keyword},'%')"
			+ " order by s_no desc limit #{dbLimit},10")
	public List<StoreVO> storelist(Criteria cri);
	
	@Select("select count(*) from tbl_store"
			+ " WHERE #{type} LIKE concat('%',#{keyword},'%')"
			+ " order by s_no desc limit #{dbLimitTotal}, 101")
	public int storecount(Criteria cri);
	
	@Insert("insert into tbl_store ( s_name, s_homepage, s_lat, s_lng, s_address ) values (#{s_name}, #{s_homepage}, #{s_lat}, #{s_lng}, #{s_address}) ")
	public void storeregist(StoreVO vo);
	
	@Select("select * from tbl_store order by s_no desc limit 1")
	public StoreVO storelast();
	
	
	
	@Select("select * from tbl_store where s_no = #{s_no}")
	public StoreVO storeview(StoreVO vo);
	
	
	@Update("update tbl_store set s_name = #{s_name}, s_lat = #{s_lat}, s_lng = #{s_lng}, s_address = #{s_address} where s_no = #{s_no}")
	public void storemodify(StoreVO vo);
	
	@Delete("delete from tbl_store where s_no= #{s_no}")
	public void storeremove(StoreVO vo);
	
	
	//review
	
	@Select("select * from tbl_store_review where s_no= #{s_no} order by s_no desc")
	public List<StoreReviewVO> storereview(StoreVO vo);
	
	
	//image
	
	@Select("select * from tbl_store_image where s_no= #{s_no} order by s_no desc")
	public List<StoreImageVO> storeiview(StoreVO vo);
	
	@Insert("insert into tbl_store_image ( s_no, si_img ) values (#{s_no}, #{si_img}) ")
	public void storeiregist(StoreImageVO ivo);
	
	//ent
	@Select("select e_no, e_name from tbl_ent")
	public List<EntVO> entlistview();
	
	@Select("select e_no from tbl_ent where e_name = #{e_name}")
	public EntVO entnumfinder(EntVO entvo);
	
	@Select("select e_name from tbl_ent where e_no = #{e_no}")
	public String entnamefinder(int e_no);
	
	
	
	@Insert("insert into tbl_se_match (s_no, e_no) values (#{s_no}, #{e_no})")
	public void storeeregist(StoreEVO evo);
	
	@Select("select * from tbl_se_match where s_no = #{s_no}")
	public List<StoreEVO> storeseview(StoreVO vo);
	//menue
	@Insert("insert into tbl_store_menu (s_no, sm_menu, sm_price) values (#{s_no}, #{sm_menu}, #{sm_price})")
	public void storemregist(StoreMVO mvo);
	
	@Select("select * from tbl_store_menu where s_no = #{s_no}")
	public List<StoreMVO> storemview(StoreVO vo);
	
	//point
	@Select("select count(*) from tbl_store_reserv")
	public int storersview(StoreVO vo);
	
	@Select("select count(*) from tbl_store_menuview")
	public int storemvview(StoreVO vo);
	
	//keyword
	@Select("select * from tbl_keyword")
	public List<StoreKVO> keylistview();
	@Select("select * from tbl_keyword where k_keyword LIKE concat('%',#{k_keyword},'%')")
	public List<StoreKVO> keywordchoice(StoreKVO kvo);
	
	//category
	@Select("select * from tbl_category where c_parent = 0")
	public List<StoreCVO> catelistview();
	
	@Select("select * from tbl_category where c_parent = #{c_parent}")
	public List<StoreCVO> storecategory(StoreCVO cvo);
	
	@Select("select * from tbl_category where c_no = #{c_no}")
	public StoreCVO storecview(StoreCVO cvo);
	
	@Select("select * from tbl_sc_match where s_no = #{s_no} limit 1")
	public StoreCVO storescview(StoreVO vo);
	
	@Select("insert into tbl_sc_match (s_no, c_no) values (#{s_no}, #{c_no})")
	public void storecregist(StoreCVO cvo);
}
