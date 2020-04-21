package com.dept;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.util.DBConnectionMgr;

public class EmpDao {

	Connection con = null;
	PreparedStatement	pstmt = null;
	ResultSet	rs = null;
	DBConnectionMgr	dbMgr = DBConnectionMgr.getInstance();
	
	public List<Map<String, Object>> empList(){
		List<Map<String,Object>> eList = new ArrayList<Map<String,Object>>();
		Map<String,Object> eMap = null; 
		StringBuilder	sql = new StringBuilder();
		try {
			con = dbMgr.getConnection();
			sql.append("SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno FROM emp");
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				eMap = new HashMap<String, Object>();
				eMap.put("empno", rs.getInt("empno"));
				eMap.put("ename", rs.getString("ename"));
				eMap.put("job", rs.getString("job"));
				eMap.put("mgr", rs.getInt("mgr"));
				eMap.put("hiredate", rs.getString("hiredate"));
				eMap.put("sal", rs.getInt("sal"));
				eMap.put("comm", rs.getInt("comm"));
				eMap.put("deptno", rs.getInt("deptno"));
				eList.add(eMap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return eList;
	}
	
	public static void main(String[] args) {
		EmpDao ed = new EmpDao();
		System.out.println(ed.empList());
	}

}
