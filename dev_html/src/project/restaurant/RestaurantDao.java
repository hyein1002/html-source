package project.restaurant;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import com.util.DBConnectionMgr;

import oracle.jdbc.OracleCallableStatement;//오라클 회사에서 지원하는 클래스
import oracle.jdbc.OracleTypes;

public class RestaurantDao {
	DBConnectionMgr 	dbMgr 	= DBConnectionMgr.getInstance();
	Connection 			con		= null;
	PreparedStatement	pstmt	= null;
	CallableStatement	cstmt	= null;
	OracleCallableStatement	osctmt	= null;
	ResultSet			rs		= null;
	/********************************
	 * 프로시저를 활용하여 로그인 처리하기
	 * @param mem_id : 사용자가 입력한 아이디 
	 * @param mem_pw : 사용자가 입력한 비번
	 * @return msg : proc_login2020(u_id IN varchar2, u_pw IN varchar2, msg OUT varchar2)
	 ********************************/
	public String login(String mem_id, String mem_pw) {
		String msg = null;
		int result = 0;
		try {
			con = dbMgr.getConnection();
			cstmt = con.prepareCall("{call proc_login2020(?,?,?)}");
			cstmt.setString(1, mem_id);
			cstmt.setString(2, mem_pw);
			cstmt.registerOutParameter(3, OracleTypes.VARCHAR);//OUT속성일때만
			//cstmt.execute();//반환타입이 불리언, 인트로 하고싶으면 익스큐트업데이트
			result=cstmt.executeUpdate();
			
			msg = cstmt.getString(3);
			System.out.println("result:"+result+", msg:"+msg);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		
		return msg;
	}
	public List<Map<String,Object>> procRestList(){
		List<Map<String,Object>> mrList = new Vector<Map<String,Object>>();

		try {
			con = dbMgr.getConnection();
			cstmt = con.prepareCall("{call proc_restaurant(?)}");
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.execute();
			osctmt = (OracleCallableStatement) cstmt;
			rs = osctmt.getCursor(1);
			Map<String,Object> rMap = null;
			int i = 0;
			while(rs.next()) {
				rMap = new HashMap<String, Object>();
				rMap.put("res_num", rs.getInt("res_num"));
				rMap.put("res_name", rs.getString("res_name"));
				rMap.put("res_tel", rs.getString("res_tel"));
				rMap.put("res_addr", rs.getString("res_addr"));
				rMap.put("res_like", rs.getInt("res_like"));
				rMap.put("res_hate", rs.getInt("res_hate"));
				rMap.put("res_photo", rs.getString("res_photo"));
				rMap.put("res_info", rs.getString("res_info"));
				rMap.put("res_time", rs.getString("res_time"));
				rMap.put("lat", rs.getDouble("lat"));
				rMap.put("lng", rs.getDouble("lng"));
				mrList.add(rMap);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return mrList;
	}
	public int restINS(Map<String,Object> pMap) {
		int result = 0;
		StringBuilder	sql		= new StringBuilder();
		sql.append("INSERT INTO restaurant(res_num, res_name, res_tel, res_addr, res_like ");
		sql.append("		, res_hate, res_photo, res_info, res_time, lat, lng)          ");
		sql.append("		 VALUES(seq_restaurant_num.nextval,?,?,?,0,0,?,?,?,?,?)       ");
		try {
			con = dbMgr.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			int i = 0;
			pstmt.setString(++i, pMap.get("res_name").toString());
			pstmt.setString(++i, pMap.get("res_tel").toString());
			pstmt.setString(++i, pMap.get("res_addr").toString());
			pstmt.setString(++i, pMap.get("res_photo").toString());
			pstmt.setString(++i, pMap.get("res_info").toString());
			pstmt.setString(++i, pMap.get("res_time").toString());
			pstmt.setDouble(++i, Double.parseDouble(pMap.get("lat").toString()));
			pstmt.setDouble(++i, Double.parseDouble(pMap.get("lng").toString()));
			result = pstmt.executeUpdate();
			System.out.println("result:"+result);
			
		} catch (SQLException se) {
			System.out.println("[[query]]"+sql.toString());
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbMgr.freeConnection(con, pstmt, rs);
		}
		return result;
	}
	
	public int restUPD(Map<String,Object> pMap) {
		int result = 0;
		StringBuilder	sql		= new StringBuilder();
		sql.append("UPDATE restaurant set res_num=?, res_name=?, res_tel=?, res_addr=?, res_like=? ");
		sql.append("		, res_hate=?, res_photo=?, res_info=?, res_time=?, lat=?, lng=?         ");
		sql.append("		 WHERE res_num=?       ");
		try {
			con = dbMgr.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			int i = 0;
			pstmt.setInt(++i, Integer.parseInt(pMap.get("res_num").toString()));
			pstmt.setString(++i, pMap.get("res_name").toString());
			pstmt.setString(++i, pMap.get("res_tel").toString());
			pstmt.setString(++i, pMap.get("res_addr").toString());
			pstmt.setInt(++i, Integer.parseInt(pMap.get("res_like").toString()));
			pstmt.setInt(++i, Integer.parseInt(pMap.get("res_hate").toString()));
			pstmt.setString(++i, pMap.get("res_photo").toString());
			pstmt.setString(++i, pMap.get("res_info").toString());
			pstmt.setString(++i, pMap.get("res_time").toString());
			pstmt.setDouble(++i, Double.parseDouble(pMap.get("lat").toString()));
			pstmt.setDouble(++i, Double.parseDouble(pMap.get("lng").toString()));
			pstmt.setInt(++i, Integer.parseInt(pMap.get("res_num").toString()));
			result = pstmt.executeUpdate();
			System.out.println("result:"+result);
			
		} catch (SQLException se) {
			System.out.println("[[query]]"+sql.toString());
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbMgr.freeConnection(con, pstmt, rs);
		}
		return result;
	}
	
	public int restDEL(Map<String,Object> pMap) {
		int result = 0;
		StringBuilder	sql		= new StringBuilder();
		sql.append("UPDATE restaurant set res_num=?, res_name=?, res_tel=?, res_addr=?, res_like=? ");
		sql.append("		, res_hate=?, res_photo=?, res_info=?, res_time=?, lat=?, lng=?         ");
		sql.append("		 WHERE res_num=?       ");
		try {
			con = dbMgr.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			int i = 0;
			pstmt.setInt(++i, Integer.parseInt(pMap.get("res_num").toString()));
			pstmt.setString(++i, pMap.get("res_name").toString());
			pstmt.setString(++i, pMap.get("res_tel").toString());
			pstmt.setString(++i, pMap.get("res_addr").toString());
			pstmt.setInt(++i, Integer.parseInt(pMap.get("res_like").toString()));
			pstmt.setInt(++i, Integer.parseInt(pMap.get("res_hate").toString()));
			pstmt.setString(++i, pMap.get("res_photo").toString());
			pstmt.setString(++i, pMap.get("res_info").toString());
			pstmt.setString(++i, pMap.get("res_time").toString());
			pstmt.setDouble(++i, Double.parseDouble(pMap.get("lat").toString()));
			pstmt.setDouble(++i, Double.parseDouble(pMap.get("lng").toString()));
			pstmt.setInt(++i, Integer.parseInt(pMap.get("res_num").toString()));
			result = pstmt.executeUpdate();
			System.out.println("result:"+result);
			
		} catch (SQLException se) {
			System.out.println("[[query]]"+sql.toString());
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbMgr.freeConnection(con, pstmt, rs);
		}
		return result;
	}
	
	public List<Map<String, Object>> restSEL() {
		List<Map<String,Object>> rList = new Vector<Map<String,Object>>();
		StringBuilder	sql		= new StringBuilder();
		sql.append("SELECT res_num, res_name, res_tel, res_addr, res_like ");
		sql.append("		, res_hate, res_photo, res_info, res_time, lat, lng FROM restaurant  ");
		try {
			con = dbMgr.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			Map<String,Object> rMap = null;
			int i = 0;
			while(rs.next()) {
				rMap = new HashMap<String, Object>();
				rMap.put("res_num", rs.getInt("res_num"));
				rMap.put("res_name", rs.getString("res_name"));
				rMap.put("res_tel", rs.getString("res_tel"));
				rMap.put("res_addr", rs.getString("res_addr"));
				rMap.put("res_like", rs.getInt("res_like"));
				rMap.put("res_hate", rs.getInt("res_hate"));
				rMap.put("res_photo", rs.getString("res_photo"));
				rMap.put("res_info", rs.getString("res_info"));
				rMap.put("res_time", rs.getString("res_time"));
				rMap.put("lat", rs.getDouble("lat"));
				rMap.put("lng", rs.getDouble("lng"));
				rList.add(rMap);
			}
			
		} catch (SQLException se) {
			System.out.println("[[query]]"+sql.toString());
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbMgr.freeConnection(con, pstmt, rs);
		}
		return rList;
	}
	public List<Map<String, Object>> mapRestList() {
		List<Map<String,Object>> mrList = new ArrayList<Map<String,Object>>();
		StringBuilder	sql		= new StringBuilder();
		sql.append("SELECT  res_name, res_photo, lat, lng FROM restaurant  ");
		try {
			con = dbMgr.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			Map<String,Object> rMap = null;
			while(rs.next()) {
				rMap = new HashMap<String, Object>();
				rMap.put("res_name", rs.getString("res_name"));
				rMap.put("res_photo", rs.getString("res_photo"));
				rMap.put("lat", rs.getDouble("lat"));
				rMap.put("lng", rs.getDouble("lng"));
				mrList.add(rMap);
			}
			
		} catch (SQLException se) {
			System.out.println("[[query]]"+sql.toString());
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbMgr.freeConnection(con, pstmt, rs);
		}
		return mrList;
	}
	public static void main(String[] args) {
		RestaurantDao	d	= new RestaurantDao();
		//List<Map<String,Object>> mList = d.procRestList();
		//System.out.println(mList);
		String msg = d.login("test", "123");
		System.out.println(msg);
	}
}
