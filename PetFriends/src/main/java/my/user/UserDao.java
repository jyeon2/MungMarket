package my.user;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import my.user.UserBean;
import my.user.UserDao;

public class UserDao {
	private Connection conn = null; 

	private static UserDao instance;

	public static UserDao getInstance() {
		if(instance==null) {
			instance = new UserDao();
		}
		return instance;
	}

	private UserDao() {  
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
			System.out.println("conn:" + conn);  

		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int insertUser(UserBean ub) {
		System.out.println("conn:"+conn);
		int cnt=-1;
		
		PreparedStatement ps = null; 
		String sql = "insert into users(no,name,id,password,email,hp1,hp2,hp3)"
				+ " values(userseq.nextval,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, ub.getName());
			ps.setString(2, ub.getId());
			ps.setString(3, ub.getPassword());
			ps.setString(4, ub.getEmail());
			ps.setString(5, ub.getHp1());
			ps.setString(6, ub.getHp2());
			ps.setString(7, ub.getHp3());
			
			cnt=ps.executeUpdate();
			
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
	
	public UserBean getUserByHp(String name, String hp1, String hp2, String hp3) {
		System.out.println("conn:" + conn); 
		PreparedStatement ps = null;
		ResultSet rs = null;
		UserBean ub = null;
		
		String sql = "select * from users where name=? and hp1=? and hp2=? and hp3=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, hp1);
			ps.setString(3, hp2);
			ps.setString(4, hp3);
			rs = ps.executeQuery();
			if(rs.next()) {
				ub=getUserBean(rs);
			}
		} catch (SQLException e) {
			System.out.println("¿¡·¯");
		} finally {
			try {
				if(rs != null)
					rs.close();
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return ub;
	} //getUserByHp
	
	public UserBean getUserById(String id,String name, String hp1, String hp2, String hp3) {
		System.out.println("conn:" + conn); 
		PreparedStatement ps = null;
		ResultSet rs = null;
		UserBean ub = null;
		
		String sql = "select * from users where id=? and name=? and hp1=? and hp2=? and hp3=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, hp1);
			ps.setString(4, hp2);
			ps.setString(5, hp3);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				ub=getUserBean(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)
					rs.close();
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return ub;
	} //getUserById
	
	public UserBean getUserBean(ResultSet rs) throws SQLException{
		UserBean ub = new UserBean();
		ub.setNo(rs.getInt("no"));
		ub.setName(rs.getString("name"));
		ub.setId(rs.getString("id"));
		ub.setPassword(rs.getString("password"));
		ub.setEmail(rs.getString("email"));
		ub.setHp1(rs.getString("hp1"));
		ub.setHp2(rs.getString("hp2"));
		ub.setHp3(rs.getString("hp3"));
		return ub;
		
	}//getUserBean
	
	public UserBean getUserByInfo(String id,String password) {
		System.out.println("conn:" + conn); 
		PreparedStatement ps = null;
		ResultSet rs = null;
		UserBean ub = null;
		
		String sql = "select * from users where id=? and password=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, password);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				ub = getUserBean(rs);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return ub;
		
	}//getUserByInfo
	
	public boolean searchId(String userid) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select * from users where id = ?";
		boolean flag = false;

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);

			rs = ps.executeQuery();

			while (rs.next()) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return flag;
	}//searchId
}
