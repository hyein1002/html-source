package com.dept;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.util.DBConnectionMgr;

public class DeptDao {
	DBConnectionMgr	dbMgr = DBConnectionMgr.getInstance();//싱글톤 패턴으로 객체 가져다 쓰기
	Connection	con = null;
	PreparedStatement	pstmt	= null;
	ResultSet	rs	= null;
	public List<Map<String, Object>> deptList(){
		List<Map<String, Object>> dlist = null;
		StringBuilder	sql = new StringBuilder();
		try {
			sql.append("SELECT deptno, dname, loc FROM dept");
			con = dbMgr.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			//parsing-DBMS가 실행계획을 세운다-옵티마이저-open-fetch-close
			//세게 컬럼은 Map에 담고, 여러개의 로우는 list에 담는다.
			dlist = new ArrayList<Map<String,Object>>();
			Map<String, Object> rMap = null;
			while(rs.next()) {
				rMap = new HashMap<>();
				rMap.put("deptno", rs.getInt("deptno"));
				rMap.put("dname", rs.getString("dname"));
				rMap.put("loc", rs.getString("loc"));
				dlist.add(rMap);//컬럼3개, 로우1개가 담긴다.
			}
		} catch (Exception e) {
			System.out.println("[Query]"+sql.toString());
		}finally {
			dbMgr.freeConnection(con, pstmt, rs);
		}
		return dlist;
	}
	public List<DeptVO> deptVOList(){
		List<DeptVO> dlist = null;
		StringBuilder	sql = new StringBuilder();
		try {
			sql.append("SELECT deptno, dname, loc FROM dept");
			con = dbMgr.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			dlist = new ArrayList<DeptVO>();
			DeptVO dVO = null;
			while(rs.next()) {
				dVO = new DeptVO();
				dVO.setDeptno(rs.getInt("deptno"));
				dVO.setDname(rs.getString("dname"));
				dVO.setLoc(rs.getString("loc"));
				dlist.add(dVO);
			}
		} catch (Exception e) {
			System.out.println("[Query]"+sql.toString());
		}finally {
			dbMgr.freeConnection(con, pstmt, rs);
		}
		
		return dlist;
	}


}
