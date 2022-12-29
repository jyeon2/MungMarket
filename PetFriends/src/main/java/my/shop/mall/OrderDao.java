package my.shop.mall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import my.shop.GoodsBean;

public class OrderDao {
	private Connection conn = null;

	public OrderDao() {
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
	}// »ý¼ºÀÚ

	public int insertOrders(int uno , CartBean cbean){
		Vector<GoodsBean> lists = cbean.getAllGoods();
		PreparedStatement ps = null;
		String sql;
		int cnt = -1;

		for(GoodsBean gb : lists) {
			try {	
				sql = "insert into orders values(order_seq.nextval,?,?,?,?)";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, uno);
				ps.setInt(2, gb.getGnum());
				ps.setInt(3, gb.getGqty());
				ps.setInt(4, gb.getTotalPrice());
				cnt += ps.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if(ps !=null)
						ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}//for	

		return cnt;

	}//insertOrders
	
}
