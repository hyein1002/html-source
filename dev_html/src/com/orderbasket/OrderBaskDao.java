package com.orderbasket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.util.DBConnectionMgr;

public class OrderBaskDao {
	DBConnectionMgr dbMgr = DBConnectionMgr.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public List<Map<String, Object>> orderbasketList(){
		List<Map<String, Object>> olist = null;
		StringBuilder sql = new StringBuilder();
		try {
			sql.append("SELECT gubun_vc, name_vc, price_nu FROM t_orderbasket");
			con = dbMgr.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			olist = new ArrayList<Map<String,Object>>();
			while(rs.next()) {
				Map<String, Object> col = new HashMap<String, Object>();
				col.put("gubun_vc", rs.getString("gubun_vc"));
				col.put("name_vc", rs.getString("name_vc"));
				col.put("price_nu", rs.getInt("price_nu"));
				olist.add(col);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			
		}
		
		return olist;
	}
	public static void main(String[] args) {
		System.out.println(new OrderBaskDao().orderbasketList());
	}

}
