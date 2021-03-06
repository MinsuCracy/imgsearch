package org.imgsearch.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.imgsearch.common.Criteria;
import org.imgsearch.vo.CategoryVO;
import org.imgsearch.vo.EntVO;
import org.imgsearch.vo.KeywordVO;
import org.imgsearch.vo.SEmatchVO;
import org.imgsearch.vo.SKmatchVO;
import org.imgsearch.vo.StoreImageVO;
import org.imgsearch.vo.StoreMenuVO;
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
	
	@Delete("delete from tbl_store_image where s_no= #{s_no}")
	public void storeiremove(StoreVO vo);
	
	
	//ent
	@Select("select e_no, e_name from tbl_ent")
	public List<EntVO> entlistview();
	
	@Select("select e_no from tbl_ent where e_name = #{e_name}")
	public EntVO entnumfinder(EntVO entvo);
	
	@Select("select e_name from tbl_ent where e_no = #{e_no}")
	public String entnamefinder(int e_no);
	
	@Insert("insert into tbl_se_match (s_no, e_no) values (#{s_no}, #{e_no})")
	public void storeeregist(SEmatchVO evo);
	
	@Select("select * from tbl_se_match where s_no = #{s_no}")
	public List<SEmatchVO> storeseview(StoreVO vo);
	
	@Update("update tbl_se_match set e_no = #{e_no} where s_no = #{s_no}")
	public void storeemodify(SEmatchVO evo);
	
	@Delete("delete from tbl_se_match where s_no= #{s_no}")
	public void storeeremove(StoreVO vo);
	
	
	//menue
	@Insert("insert into tbl_store_menu (s_no, sm_menu, sm_price) values (#{s_no}, #{sm_menu}, #{sm_price})")
	public void storemregist(StoreMenuVO mvo);
	
	@Select("select * from tbl_store_menu where s_no = #{s_no}")
	public List<StoreMenuVO> storemview(StoreVO vo);
	
	@Delete("delete from tbl_store_menu where s_no= #{s_no}")
	public void storemremove(StoreVO vo);
	
	
	//point
	@Select("select count(*) from tbl_store_reserv")
	public int storersview(StoreVO vo);
	
	@Select("select count(*) from tbl_store_menuview")
	public int storemvview(StoreVO vo);
	
	
	//keyword
	@Select("select * from tbl_keyword")
	public List<SKmatchVO> keylistview();
	
	@Select("select * from tbl_keyword where k_keyword LIKE concat('%',#{k_keyword},'%')")
	public List<SKmatchVO> keywordchoice(SKmatchVO kvo);
	
	@Insert("insert into tbl_sk_match (s_no, k_no) values (#{s_no}, #{k_no})")
	public void storeskmregist(SKmatchVO kvo);
	
	@Select("select * from tbl_sk_match where s_no = #{s_no}")
	public List<KeywordVO> storeskmview(StoreVO vo);
	
	@Select("select * from tbl_keyword where k_no = #{k_no}")
	public KeywordVO sotrekview(KeywordVO kvo);
	
	@Delete("delete from tbl_sk_match where s_no= #{s_no}")
	public void storeskmremove(StoreVO vo);
	
	
	//category
	@Select("select * from tbl_category where c_parent = 0")
	public List<CategoryVO> catelistview();
	
	@Select("select * from tbl_category where c_parent = #{c_parent}")
	public List<CategoryVO> storecategory(CategoryVO cvo);
	
	@Select("select * from tbl_category where c_no = #{c_no}")
	public CategoryVO storecview(CategoryVO cvo);
	
	@Select("select * from tbl_sc_match where s_no = #{s_no} limit 1")
	public CategoryVO storescview(StoreVO vo);
	
	@Select("insert into tbl_sc_match (s_no, c_no) values (#{s_no}, #{c_no})")
	public void storecregist(CategoryVO cvo);
	
	@Delete("delete from tbl_sc_match where s_no= #{s_no}")
	public void storescmremove(StoreVO vo);
	
	@Update("update tbl_sc_match set c_no = #{c_no} where s_no = #{s_no}")
	public void storescmmodify(CategoryVO cvo);
	
}
