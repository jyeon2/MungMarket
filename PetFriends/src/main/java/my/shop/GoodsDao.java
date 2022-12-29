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

import com.oreilly.servlet.MultipartRequest;

public class GoodsDao {
	private Connection conn = null; 

	private static GoodsDao instance;

	public static GoodsDao getInstance() {
		if(instance==null) {
			instance = new GoodsDao();
		}
		return instance;
	}

	private GoodsDao() {  
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
	
	public int insertGoods(MultipartRequest mr){
		System.out.println("conn:"+conn);
		System.out.println(mr.getParameter("gname"));
		System.out.println(mr.getParameter("gcategory_fk"));
		System.out.println(mr.getFilesystemName("gimage"));
		System.out.println(mr.getFilesystemName("gviewimage"));
		System.out.println(mr.getParameter("gqty"));

		PreparedStatement ps = null;

		int cnt = -1;
		String sql = "insert into goods values(cateprod.nextval,?,?,?,?,?,?,?,?,?)";

		try {

			ps = conn.prepareStatement(sql);
			ps.setString(1,mr.getParameter("gname"));
			
			String gcategory_fk = mr.getParameter("gcategory_fk");
			
			ps.setString(2, gcategory_fk);
			ps.setString(3, mr.getFilesystemName("gimage"));
			ps.setString(4, mr.getFilesystemName("gviewimage"));
			ps.setInt(5, Integer.parseInt(mr.getParameter("gqty")));
			ps.setInt(6, Integer.parseInt(mr.getParameter("price")));
			ps.setString(7, mr.getParameter("gspec"));
			ps.setString(8, mr.getParameter("gcontents"));
			ps.setInt(9,Integer.parseInt(mr.getParameter("point")));

			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("insertGoods sql error");
		} finally {
			try {
				if(ps != null)
					ps.close();
			}catch(SQLException e) {
				
			}
		}
		System.out.println("cnt:" + cnt);
		
		return cnt;

	}//insertGoods
	
	public ArrayList<GoodsBean> getAllGoods(){
		System.out.println("conn:" + conn);
		ArrayList<GoodsBean> lists = new ArrayList<GoodsBean>();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select * from goods order by gnum";
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				GoodsBean gb = new GoodsBean();
				gb.setGnum(rs.getInt("gnum"));
				gb.setGname(rs.getString("gname"));
				gb.setGcategory_fk(rs.getString("gcategory_fk"));
				gb.setGimage(rs.getString("gimage"));
				gb.setGviewimage(rs.getString("gviewimage"));
				gb.setGqty(rs.getInt("gqty"));
				gb.setPrice(rs.getInt("price"));
				gb.setGspec(rs.getString("gspec"));
				gb.setPoint(rs.getInt("point"));
				
				lists.add(gb);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!= null)
					ps.close();
				if(rs!= null)
					rs.close();
			} catch (SQLException e) {

			}
		}

		return lists;
	}//getAllGoods
	
	public int deleteGoods(String gnum) {
		System.out.println("conn:" + conn);
		PreparedStatement ps = null;
		int cnt = -1;
		
		String sql ="delete goods where gnum=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, gnum);
			
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
		
	}//deleteGoods
	
	public GoodsBean selectByGnum(String gnum) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		GoodsBean gb = null;
		
		String sql = "select * from goods where gnum="+gnum;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				gb = new GoodsBean();
				gb.setGnum(rs.getInt("gnum"));
				gb.setGname(rs.getString("gname"));
				gb.setGcategory_fk(rs.getString("gcategory_fk"));
				gb.setGimage(rs.getString("gimage"));
				gb.setGviewimage(rs.getString("gviewimage"));
				gb.setGqty(rs.getInt("gqty"));
				gb.setPrice(rs.getInt("price"));
				gb.setGspec(rs.getString("gspec"));
				gb.setGcontents(rs.getString("gcontents"));
				gb.setPoint(rs.getInt("point"));

			}
			
			
		} catch (SQLException e) {
			System.out.println("list error");
		}finally {
			try {
				if(ps!= null)
					ps.close();
				if(rs!= null)
					rs.close();
			} catch (SQLException e) {

			}
		}

		return gb;
		
	}//selectByGnum
	
	public int updateGoods(MultipartRequest mr){
		PreparedStatement ps = null;
		String sql;
		int cnt=-1;
		
		sql = "update goods set gname=?,gimage=?, gviewimage=?, gqty=?, price=?, ";
		sql += " gspec=?, gcontents=?, point=?";
		sql += " where gnum="+mr.getParameter("gnum");
			   
		try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, mr.getParameter("gname"));
				ps.setString(2, mr.getFilesystemName("gimage"));
				ps.setString(3, mr.getFilesystemName("gviewimage"));
				ps.setString(4, mr.getParameter("gqty"));
				ps.setString(5, mr.getParameter("price"));
				ps.setString(6, mr.getParameter("gspec"));
				ps.setString(7, mr.getParameter("gcontents"));
				ps.setString(8, mr.getParameter("point"));
				
				cnt = ps.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {
					if(ps !=null)
						ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		
		return cnt;
	}//updateGoods
	
	public ArrayList<GoodsBean> selectByCategory(String code){
		PreparedStatement ps=null;
		ResultSet rs=null;
		ArrayList<GoodsBean> lists=new ArrayList<GoodsBean>();
		
		String sql="select * from goods where gcategory_fk like ? order by gnum";

		try {
			ps=conn.prepareStatement(sql);
			 ps.setString(1, code+"%");

			rs=ps.executeQuery();
			while(rs.next()) {
				GoodsBean gb=new GoodsBean();
				gb.setGnum(rs.getInt("gnum"));
				gb.setGname(rs.getString("gname"));
				gb.setGcategory_fk(rs.getString("gcategory_fk"));
				gb.setGimage(rs.getString("gimage"));
				gb.setGviewimage(rs.getString("gviewimage"));
				gb.setGqty(rs.getInt("gqty"));
				gb.setPrice(rs.getInt("price"));
				gb.setGspec(rs.getString("gspec"));
				gb.setGcontents(rs.getString("gcontents"));
				gb.setPoint(rs.getInt("point"));
				lists.add(gb);				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println(lists.size());
		return lists;
		
	}//selectByCategory
	
	

}
