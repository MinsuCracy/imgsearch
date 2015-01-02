package org.imgsearch.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.imgsearch.common.Criteria;
import org.imgsearch.vo.EntVO;
import org.imgsearch.vo.StoreImageVO;
import org.imgsearch.vo.StoreMenuVO;
import org.imgsearch.vo.StoreReviewVO;
import org.imgsearch.vo.StoreVO;

public interface MainMapper {
	
	// �������̹����� �⺻ ������ �̾ƿ��� (�̹��� �����ؼ� �������� ��� �߰��ؾ���)
//	@Select(" select * from (select store.*, ent.e_name from tbl_se_match as se "
//				+ " natural join tbl_store as store natural join tbl_ent as ent where se.e_no=#{e_no}) as data1 "
//				+ " natural join ( select * from tbl_sk_match as sk "
//						+ " natural join tbl_keyword as keyword where keyword.k_keyword = #{keyword}) as data2")
	// ��ũ�Ѷ��� ����
	@Select("select s_no, s_name, s_homepage, s_lat, s_lng, s_address, si_no, si_img as s_img from tbl_store as store"
				+" natural join tbl_store_image as img"
				+" where 1=1"
				+" group by store.s_no limit #{dbLimit},100")
	public List<StoreVO> storeList(Criteria cri);
	
	
//	@Select("select * from tbl_store")
//	public List<StoreVO> storeList2(Criteria cri);
	
	// ������ ������ ������ ����� ������ ������� ���ؿ´�
	@Select("select user.u_no, user.u_gender,user.u_age, sqrt("
					+" (pow(ug_atype-(select ug_atype from tbl_user_grow where u_no = 8),2))"
					+" + (pow(ug_btype-(select ug_btype from tbl_user_grow where u_no = 8),2))"
					+" + (pow(ug_ctype-(select ug_ctype from tbl_user_grow where u_no = 8),2))"
					+" )as distance"
						+" from tbl_user_grow" 
						+" natural join tbl_user as user"
						+" where u_no!=8 "
					+" and user.u_age < (select u_age from tbl_user where u_no=8)+15 "
	                +" and user.u_age > (select u_age from tbl_user where u_no=8)-15"
	                +" and user.u_gender = (select u_gender from tbl_user where u_no=8)"
				+" order by distance asc limit #{dbLimit},10")
	public String[] storeListTypePerson(Criteria cri);
	
	// ������ ������ ������ ����� ������ ������� ���ؿ� �����͸� ������� ���Ը���Ʈ�� �����´�
	@Select(" select * "
          +" from (select store.*, ent.e_name from tbl_se_match as se"
				 +" natural join tbl_store as store natural join tbl_ent as ent where se.e_no=24) as data1"
			+" natural join ( select * from tbl_sk_match as sk "
			+" natural join tbl_keyword as keyword where keyword.k_keyword = '�ѽ�')  as store"
		    +" left outer join"
            +" (select s_no,avg(r_score) as avgResult" 
            +" from "
				+" (select u_id, s_no,r_score from tbl_store_review where u_id = 1 or u_id=2 or u_id=3) as sr"
			+" group by s_no order by avgResult desc) as review"
            +" on store.s_no = review.s_no"
            +" order by avgResult desc limit #{dbLimit},10")
	public List<StoreVO> storeListHaveType(String[] person);
	
	// (��Ŭ�����)  ������� ������ ��ó �������� ���� �̾ƿ���
	@Select("select result.e_no as e_no from "
				+" (select e_no, sqrt( "
					+" (pow(e_atype-(select e_atype from tbl_ent where e_no = #{e_no}),2)) "
					+" +(pow(e_btype-(select e_btype from tbl_ent where e_no = #{e_no}),2)) "
					+" +(pow(e_ctype-(select e_ctype from tbl_ent where e_no = #{e_no}),2)) "
					+" )as distance "
				+" from tbl_ent where e_no!=#{e_no} order by distance asc) as result "
				+" limit #{dbLimit},3 ")	
	public int[] uDistanceList(Criteria cri);
	
	// ��� ���� ������ ��Ŭ����� �������� ������ ���� ����Ʈ ��������
	@Select("select * from (select store.*, ent.e_name from tbl_se_match as se" 
				+" natural join tbl_store as store natural join tbl_ent as ent where se.e_no=38) as data1" 
				+" natural join ( select * from tbl_sk_match as sk "
				+" natural join tbl_keyword as keyword where keyword.k_keyword = '���̽�ũ��') as data2")
	public List<StoreVO> uDistanceStore(int[] ulist);
	
	
	// �ٽ��ؾ���
	// ������ ��Ż ���� ���ϱ�
	@Select("select count(*) from tbl_store limit #{dbLimitTotal},101")
	public int storeTotal(Criteria cri);
	
	// ���������������� ������ ��Ż���� ���ϱ�
	@Select("select count(*)"
           +" from (select store.*, ent.e_name from tbl_se_match as se"
				 +" natural join tbl_store as store natural join tbl_ent as ent where se.e_no=24) as data1"
			+" natural join ( select * from tbl_sk_match as sk "
		 +" natural join tbl_keyword as keyword where keyword.k_keyword = '�ѽ�')  as store"
		    +" left outer join"
            +" (select s_no,avg(r_score) as avgResult"
            +" from "
			 +" (select u_id, s_no,r_score from tbl_store_review where u_id = 1 or u_id=2 or u_id=3) as sr"
			+" group by s_no order by avgResult desc) as review"
            +" on store.s_no = review.s_no"
            +" order by avgResult desc limit 0,10")
	public int storeListHaveTypeTotal(String[] person);
	
	// ��� ���� ������ ��Ŭ����� �������� ������ ���� ���� ���ϱ�
	@Select("select count(s_no) from (select store.*, ent.e_name from tbl_se_match as se" 
				+" natural join tbl_store as store natural join tbl_ent as ent where se.e_no=38) as data1" 
				+" natural join ( select * from tbl_sk_match as sk "
				+" natural join tbl_keyword as keyword where keyword.k_keyword = '���̽�ũ��') as data2")
	public int uDistanceStoreTotal(int[] ulist);
	
	
	// searchLog userGrow entCount �������� ���� Ʈ���輱���� �ұ�??
	// ��ġ�α� �����Է�
	@Insert("insert into tbl_searchlog (u_no, e_no, sl_keyword) values(#{u_no}, #{e_no} , #{keyword})")
	public void searchLog(Criteria cri);
	
	// �����ֳ� ���� ����..
	@Select("select u_no from tbl_user_grow where u_no=#{u_no}")
	public Object checkUserGrow(Criteria cri);
	
	// �������� �ֱ�(���� ������)
	@Insert("INSERT INTO tbl_user_grow"
			+" (u_no, ug_age, ug_view, ug_kind, ug_intell, ug_face, ug_trouble, ug_rumor, ug_Atype, ug_Btype, ug_Ctype, ug_cnt)"
			+" SELECT #{u_no}, e_age, e_view, e_kind, e_intell, e_face, e_trouble, e_rumor, e_Atype, e_Btype, e_Ctype, 1"
			+" FROM tbl_ent WHERE e_no = #{e_no}")
	public void userGrowInsert(Criteria cri);
	
	// �������� ������Ʈ
	@Update("update tbl_user_grow as g, tbl_ent as e"
				+" set g.ug_age = (g.ug_age + e.e_age),"
				 +" g.ug_view = (g.ug_view + e.e_view),"
				 +" g.ug_kind = (g.ug_kind + e.e_kind),"
				 +" g.ug_intell = (g.ug_intell + e.e_intell),"
				 +" g.ug_face = (g.ug_face + e.e_face),"
				 +" g.ug_trouble = (g.ug_trouble + e.e_trouble),"
				 +" g.ug_rumor = (g.ug_rumor + e.e_rumor),"
				 +" g.ug_Atype = ((g.ug_Atype * g.ug_cnt) + e.e_age) / (g.ug_cnt + 1),"
				 +" g.ug_Btype = ((g.ug_Btype * g.ug_cnt) + (e.e_view + e.e_kind) / 2) / (g.ug_cnt + 1),"
				 +" g.ug_Ctype = ((g.ug_Ctype * g.ug_cnt) + (e.e_intell + e.e_face + e.e_trouble + e.e_rumor) / 4) / (g.ug_cnt + 1),"
				 +" g.ug_cnt = (g.ug_cnt + 1)"
				+" where e.e_no = #{e_no} and g.u_no = #{u_no}")
	public void userGrowUpdate(Criteria cri);
	
	// ��ũī��Ʈ �ֳ� ���� ����..
	@Select("select * from tbl_eu_match where u_no=#{u_no} and e_no=#{e_no}")
	// ��ũī��Ʈ �ֱ�..
	public Object checkEntCount(Criteria cri);	
	@Insert("INSERT INTO tbl_eu_match (u_no,e_no,cnt) values (#{u_no},#{e_no},1)")
	//��ũī��Ʈ ����..
	public void entCountInsert(Criteria cri);
	@Update("update tbl_eu_match set cnt=cnt+1 where u_no=#{u_no} and e_no=#{e_no}")
	public void entCountUpdate(Criteria cri);
	
	
	//���� ���� �Ѱ��� �������
	@Select("select * from tbl_store where s_no=#{s_no}")
	public StoreVO storeView(Criteria cri);
	
	
	// �Ʒ� ���� ���̳��� sql�� ����?
	// ������ ������ �̹��� �⺻��
	@Select("select e_img,e_no from tbl_ent limit #{dbLimit},13")
	public List<EntVO> entImgDefault(Criteria cri);
	
	// ������ ������ �̹��� ��ũ��
	@Select("select ent.e_no, data1.eu_no, data1.u_no, data1.cnt, ent.e_name, ent.e_img"
				+" from tbl_ent as ent"
				+" left outer join "
				+" (select ent.e_no, eu.eu_no, eu.u_no, eu.cnt, ent.e_name, ent.e_img"
				+" from tbl_ent as ent"
				+" natural join tbl_eu_match as eu"
				+" where u_no=2) as data1"
				+" on ent.e_no = data1.e_no"
				+" order by cnt desc limit #{dbLimit},13")	
	public List<EntVO> entImgRank(Criteria cri);
	// ������ ������ �̹��� ���� ����� ����
	@Select("select e_no,e_img,sqrt("
			+" (pow(e_Atype-(select ug_Atype from tbl_user_grow where u_no = 6),2))"
		+" + (pow(e_Btype-(select ug_Btype from tbl_user_grow where u_no = 6),2))"
		+" + (pow(e_Ctype-(select ug_Ctype from tbl_user_grow where u_no = 6),2))"
		+" )as distance from tbl_ent  order by distance asc limit #{dbLimit},13")
	public List<EntVO> entImgStyle(Criteria cri);
	
	// �̹��� ��Ż ī��Ʈ
	@Select("select count(e_no) from tbl_ent")
	public int entImgTotal();
	
	
	// ���� ���� ���� ��� ��������	(�Խ��� ��ǥ����_
	public List<StoreImageVO> storeMainImgList(List<StoreVO> list);

	
	// ���Ի��� ��ü ��������
	@Select("select * from tbl_store_image where s_no = #{s_no}")
	public List<StoreImageVO> storeImgList(Criteria cri);
	
	
	@Select("select sm_menu,sm_price from tbl_store_menu where s_no= #{s_no} ")
	public List<StoreMenuVO> storeMenuList(Criteria cri);
	
	// ���丮��Ʈ
	@Select("select * from tbl_store_review where s_no=#{s_no} order by r_no desc limit #{dbLimit},10 ")
	public List<StoreReviewVO> storeReview(Criteria cri);
	 
	// ���䰹��
	@Select("select count(r_no) from (select r_no from tbl_store_review where s_no=#{s_no} limit #{dbLimit},101)as result ")
	public int storeReviewTotal(Criteria cri);
	 
	// ���侲��
	@Insert("insert into tbl_store_review (s_no,u_id,r_comment,r_score) values (#{s_no},'tester', #{r_comment},5)")
	public void storeReviewWrite(StoreReviewVO rvo);
	
	// ���������
	 @Delete("delete from tbl_store_review where r_no = #{r_no}")
	 public void storeReviewDelete(StoreReviewVO rvo);
	 
	 // ��������ϱ�
	 @Update("update tbl_store_review set r_comment = #{r_comment} , r_regdate = current_timestamp where r_no = #{r_no}")
	 public void storeReviewModify(StoreReviewVO rvo);
	
}
