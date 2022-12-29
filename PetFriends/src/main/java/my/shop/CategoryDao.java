package my.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CategoryDao {
	
	private Connection conn = null; 

	private static CategoryDao instance;

	public static CategoryDao getInstance() {
		if(instance==null) {
			instance = new CategoryDao();
		}
		return instance;
	}

	private CategoryDao() {  
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
			 

		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int insertCategory(String code,String cname){
		System.out.println("conn:" + conn);
		int cnt =-1;
		PreparedStatement ps = null;
		
		String sql = "insert into pcategory values(cateseq.nextval,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, code);
			ps.setString(2, cname);
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null)
					ps.close();
			} catch (SQLException e) {

			}
		}
		System.out.print("cnt : "+ cnt);
		return cnt;
	}
	
	public ArrayList<CategoryBean> getAllCategory(){
		System.out.println("conn:"+conn);
		ArrayList<CategoryBean> lists = new ArrayList<CategoryBean>();
		
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			String sql = "select * from pcategory order by cnum";
			ps = conn.prepareStatement(sql);

			rs = ps.executeQuery();

			while(rs.next()) {
				CategoryBean cb = new CategoryBean();
				cb.setCnum(rs.getInt("cnum"));
				cb.setCode(rs.getString("code"));
				cb.setCname(rs.getString("cname"));
				
				lists.add(cb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null) {
					ps.close();
				}
				if(rs != null) {
					rs.close();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return lists;

	}//getAllCategory
	
	public int  deleteCategory(int cnum){
		int cnt=-1;
		PreparedStatement ps = null;
		
		String sql = "delete pcategory where cnum=?";

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cnum);
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null)
					ps.close();
			} catch (SQLException e) {

			}
		}

		return cnt;
		
	}//deleteCategory
	
	public int updateCategory(int cnum) {
		int cnt=-1;
		PreparedStatement ps = null;
		
		
		
		
		
		
		
		return cnt;
		
	}
}
