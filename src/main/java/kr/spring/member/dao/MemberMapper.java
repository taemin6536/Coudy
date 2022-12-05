package kr.spring.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.member.vo.MemberVO;

@Mapper
public interface MemberMapper {

	@Select("SELECT member_seq.nextval FROM dual")
	public int selectMem_num();
	
	@Insert("INSERT INTO member (mem_num) VALUES (#{mem_num})")
	public void insertMember(MemberVO member);
	
	@Insert("INSERT INTO member_detail (mem_num, name, passwd, phone, email, "
			+ "zipcode, address1,address2,id) "
			+ "VALUES(#{mem_num},#{name},#{passwd},#{phone},#{email}, "
			+ "#{zipcode},#{address1},#{address2},#{id})")
	public void insertMember_detail(MemberVO member);  
	
	
	@Select("SELECT m.mem_num, d.id, m.auth, d.passwd, d.photo, d.email, d.name "
			+ "FROM member m LEFT OUTER JOIN member_detail d "
			+ "ON m.mem_num=d.mem_num "
			+ "WHERE d.id = #{d.id}")
	public MemberVO selectCheckMember(String id);
	
	@Select("SELECT * FROM member m JOIN member_detail d ON m.mem_num=d.mem_num WHERE m.mem_num = #{mem_num}")
	public MemberVO selectMember(Integer mem_num);
	

	public void updateMember(MemberVO member);
	
	@Update("UPDATE member_detail SET name=#{name}, phone=#{phone}, email=#{email}, zipcode=#{zipcode}, "
			+ "address1=#{address1}, address2=#{address2}, modify_date=SYSDATE WHERE mem_num=#{mem_num}")
	public void updateMember_detail(MemberVO member);
	
	@Update("UPDATE member_detail SET passwd=#{passwd} WHERE mem_num=#{mem_num}")
	public void updatePasswd(MemberVO member);
	
	@Update("UPDATE member SET auth=0 WHERE mem_num=#{mem_num}")
	public void deleteMember(Integer mem_num);
	
	@Delete("DELETE FROM member_detail WHERE mem_num=#{mem_num}")
	public void deleteMember_detail(Integer mem_num);
	
	//프로필 이미지 업데이트
	@Update("UPDATE member_detail SET photo=#{photo}, photo_name=#{photo_name} WHERE mem_num=${mem_num}")
	public void updateProfile(MemberVO member);
	
	
	//============관리자===============//
	public int selectRowCount(Map<String,Object> map);
	
	public List<MemberVO> selectList(Map<String,Object> map);
	
	@Update("Update member SET auth=#{auth} WHERE mem_num=#{mem_num}")
	public void updateByAdmin(MemberVO member);
}


















