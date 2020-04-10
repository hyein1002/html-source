package jeasyui.member;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.util.DBConnectionMgr;

import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;
import oracle.jdbc.oracore.OracleType;
/*
 * DML(기본) - 프로시저 - MyBatis[DRM솔루션-30%이상 줄어듦-일괄수정처리]
 */
public class MemberDao {
	Connection	con	 = null;
	PreparedStatement	pstmt = null;
	CallableStatement	cstmt = null;
	ResultSet	rs = null;//rs.next(),rs.previous(),rs.absolutee(3)
	DBConnectionMgr	dbMgr = DBConnectionMgr.getInstance();
	OracleCallableStatement	ocstmt = null;
	//회원 목록 조회 실습1 - SELECT문
	public List<Map<String, Object>> memberList(){
		List<Map<String, Object>> mList = null;
		StringBuilder sql = new StringBuilder();
		Map<String,Object> mMap = null;
		try {
			sql.append("SELECT mem_no,mem_id,mem_pw,mem_name,zipcode,mem_addr,mem_email FROM member_t");
			con = dbMgr.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			mList = new ArrayList<Map<String,Object>>();
			while(rs.next()) {
				mMap = new HashMap<String, Object>();
				mMap.put("mem_no", rs.getInt("mem_no"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mList;
	}
	//회원 목록 조회 실습2 - 프로시저
	public List<Map<String, Object>> procMemberList(){
		List<Map<String, Object>> mList = null;
		try {
			con = dbMgr.getConnection();
			cstmt = con.prepareCall("{call proc_memberList(?)}");
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.execute();//프로시저 처리 요청 메소드 호출
			//오라클에서만 제공되는 REFCURSOR이므로 오라클에서 제공하는 인터페이스로 형전환하기
			ocstmt = (OracleCallableStatement)cstmt;
			rs = ocstmt.getCursor(1);
			Map<String,Object> rmap = null;
			mList = new ArrayList<Map<String,Object>>();
			while(rs.next()) {//커서의 위치에 데이터가 있는거야? 응
				rmap = new HashMap<String, Object>();
				rmap.put("mem_no", rs.getInt("mem_no"));
				rmap.put("mem_id", rs.getString("mem_id"));
				rmap.put("mem_pw", rs.getString("mem_pw"));
				rmap.put("mem_name", rs.getString("mem_name"));
				rmap.put("zipcode", rs.getString("zipcode"));
				rmap.put("mem_addr", rs.getString("mem_addr"));
				rmap.put("mem_email", rs.getString("mem_email"));
				mList.add(rmap);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return mList;
	}
	public static void main(String[] args) {
		MemberDao	mdao = new MemberDao();
		List<Map<String, Object>> mList = null;
		mList = mdao.procMemberList();
		if(mList!=null) {
			System.out.println("mList.size()==>"+mList.size());
		}
	}

}
