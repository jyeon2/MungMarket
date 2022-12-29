package notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import notice.NoticeBean;
import notice.NoticeDao;

public class NoticeDao {
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String id="jspid";
	String pw="jsppw";
	Connection conn = null;
	PreparedStatement ps =null;
	ResultSet rs = null;
	
	private static NoticeDao instance;
	
	public static NoticeDao getInstance() {
		if(instance==null) {
			instance = new NoticeDao();
		}
		return instance;
	}
	
	private NoticeDao(){
		System.out.println("NoticeDao생성자");
		try {
			Class.forName(driver);
			System.out.println("드라이버 연결 성공");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("드라이버 연결 오류");
		}
	}//NoticeDao 생성자
	
	public void getConnection() {
		try {
			conn=DriverManager.getConnection(url,id,pw);
			System.out.println("접속 성공");
		} catch (SQLException e) {
			System.out.println("접속 실패");
		}
		
	}//getConnection
	
	public int getArticleCount() {
		getConnection();
		int count = 0;
		String sql = "select count(*) as cnt from notice";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				count =  rs.getInt("cnt");
						
			}
		} catch (SQLException e) {
			System.out.println("getArticleCount");
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
				if(conn!=null)
					conn.close();
			} catch (SQLException e) {
				System.out.println("close");
			}
		}
		
		return count;
	}//getArticleCount
	
	public ArrayList<NoticeBean> getArticles(int start, int end){
		getConnection();
		ArrayList<NoticeBean> lists = new ArrayList<NoticeBean>();
		
		String sql = "select num, writer, subject, passwd, reg_date, readcount, ref, re_step, re_level, content " ;		        
		sql += "from (select rownum as rank, num, writer, subject, passwd, reg_date, readcount, ref, re_step, re_level, content ";
		sql += "from (select num, writer, subject, passwd, reg_date, readcount, ref, re_step, re_level, content ";
		sql += "from notice  ";
		sql += "order by ref desc, re_step asc )) ";
		sql += "where rank between ? and ? ";

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				NoticeBean nb = new NoticeBean();
				
				nb.setNum(rs.getInt("num"));
				nb.setWriter(rs.getString("writer"));
				nb.setSubject(rs.getString("subject"));
				nb.setPasswd(rs.getString("passwd"));
				nb.setReg_date(rs.getTimestamp("Reg_date"));
				nb.setReadcount(rs.getInt("readcount"));
				nb.setRef(rs.getInt("ref"));
				nb.setRe_step(rs.getInt("re_step"));
				nb.setRe_level(rs.getInt("re_level"));
				nb.setContent(rs.getString("content"));
				
				lists.add(nb);
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
				if(conn!=null)
					conn.close();
			} catch (SQLException e) {
				System.out.println("close");
			}
		}
		
		return lists;
		
	}//getArticles
	
	// 글쓰기(원글)
		public int insertArticle(NoticeBean nb){
			
			getConnection();
			PreparedStatement ps=null;
			
			String sql="insert into notice(num,writer,subject,passwd,reg_date,ref,re_step,re_level,content) " ;
			sql += " values(notice_seq.nextval,?,?,?,?,notice_seq.currval ,?,?,?)";
			
			int cnt=-1;
			try {
				ps=conn.prepareStatement(sql);
				ps.setString(1, nb.getWriter());
				ps.setString(2, nb.getSubject());
				ps.setString(3, nb.getPasswd());
				ps.setTimestamp(4, nb.getReg_date());
				ps.setInt(5, 0);
				ps.setInt(6, 0);
				ps.setString(7, nb.getContent());
									
				cnt = ps.executeUpdate();
				
			} catch (SQLException e) {
				System.out.println("insertArticle error");
				e.printStackTrace();
			}finally {
				try {
					if(conn != null)
						conn.close();
					
					if(ps != null)
						ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return cnt;

		}
		
		public NoticeBean getArticle(int num) {
			getConnection();
			String sql2 = "update notice set readcount=readcount+1 where num="+num;
			String sql="select * from notice where num="+num;
			NoticeBean nb=null;      
			try {

				ps=conn.prepareStatement(sql2);
				ps.executeUpdate();

				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				if(rs.next()) {
					nb = new NoticeBean();
					nb.setNum(rs.getInt("num"));
					nb.setWriter(rs.getString("writer"));
					nb.setSubject(rs.getString("subject"));
					nb.setPasswd(rs.getString("passwd"));
					nb.setReg_date(rs.getTimestamp("reg_date"));
					nb.setReadcount(rs.getInt("readcount"));
					nb.setRef(rs.getInt("ref"));
					nb.setRe_step(rs.getInt("re_step"));
					nb.setRe_level(rs.getInt("re_level"));
					nb.setContent(rs.getString("content"));

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if(conn!=null)
						conn.close();
					if(ps!=null)
						ps.close();
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}      
			return nb;
				
		}//getArticle
		
		public int replyArticle(NoticeBean nb) {
			getConnection();
			
			int cnt=-1;
			PreparedStatement ps = null;
			
			String sql1 = "update notice set re_step=re_step+1 where ref=? and re_step>?";
			
			
			String sql = "insert into notice(num,writer,subject,passwd,reg_date,ref,re_step,re_level,content)";
				sql	+= " values(notice_seq.nextval,?,?,?,?,?,?,?,?)";
			
			try {
				ps = conn.prepareStatement(sql1);
				ps.setInt(1, nb.getRef());
				ps.setInt(2, nb.getRe_step());
				
				ps.executeUpdate();
				
				ps = conn.prepareStatement(sql); 
				ps.setString(1, nb.getWriter());
				ps.setString(2, nb.getSubject());
				ps.setString(3, nb.getPasswd());
				ps.setTimestamp(4, nb.getReg_date());
				ps.setInt(5, nb.getRef());
				ps.setInt(6, nb.getRe_step() + 1);
				ps.setInt(7, nb.getRe_level() + 1);
				ps.setString(8, nb.getContent());
				
				cnt = ps.executeUpdate();
				
			} catch (SQLException e) {
				System.out.println("replyArticle 에러");
			} finally {
				try {
					if(conn!=null)
						conn.close();
					if(ps!=null)
						ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			System.out.println("출력완료");
			System.out.println("result3:"+cnt);
			
			return cnt;
		}//replyArticle
		
		public NoticeBean updateGetArticle(String num){
			getConnection();
			NoticeBean nb=null;  
			try {
				String sql = "select * from notice where num = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, num);
				
				rs = ps.executeQuery();
				
				if(rs.next()) {
					nb = new NoticeBean();
					nb.setNum(rs.getInt("num"));
					nb.setWriter(rs.getString("writer"));
					nb.setSubject(rs.getString("subject"));
					nb.setPasswd(rs.getString("passwd"));
					nb.setReg_date(rs.getTimestamp("reg_date"));
					nb.setReadcount(rs.getInt("readcount"));
					nb.setRef(rs.getInt("ref"));
					nb.setRe_step(rs.getInt("re_step"));
					nb.setRe_level(rs.getInt("re_level"));
					nb.setContent(rs.getString("content"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if(conn!=null)
						conn.close();
					if(ps!=null)
						ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			return nb; 
			
		}//updateGetArticle
		
		public int updateArticle(NoticeBean nb) {
			getConnection();
			int cnt =-1;
			try {
				String sql = "select passwd from notice where num="+nb.getNum();
				ps = conn.prepareStatement(sql);
				rs= ps.executeQuery();


				if(rs.next()) {
					String dbpasswd = rs.getString("passwd");

					if(nb.getPasswd().equals(dbpasswd)){
						String sql2 = "update notice set writer=?, subject=?, content=? where num=?";
						ps = conn.prepareStatement(sql2);
						ps.setString(1, nb.getWriter());
						ps.setString(2, nb.getSubject());
						ps.setString(3, nb.getContent());
						ps.setInt(4, nb.getNum());

						cnt = ps.executeUpdate();
					}

					else {
						cnt =-2;
					}

				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if(rs != null)
						rs.close();
					if(ps != null)
						ps.close();
					if(conn != null)
						conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			return cnt;
			
		}//updateArticle
		
		public int deleteNotice(NoticeBean nb){
			
			int cnt = -1;

			PreparedStatement ps = null;
			ResultSet rs = null;
			getConnection();

			System.out.println("수정하려고 입력한 비밀번호 :" + nb.getPasswd());
			try {
				String sql = "select passwd from notice where num=?";

				ps = conn.prepareStatement(sql);

				ps.setInt(1, nb.getNum());

				rs = ps.executeQuery();

				if (rs.next()) {

					if (nb.getPasswd().equals(rs.getString("passwd"))) {
						
						String sql2 = "delete notice where num=?";

						ps = conn.prepareStatement(sql2);
						ps.setInt(1,nb.getNum());

						cnt = ps.executeUpdate();
					}
					
					else {
						cnt= -2;
					}
				} 
				
			} catch (SQLException e) {
				System.out.println("deleteBoard sql error");
			} finally {
				try {
					if (conn != null)
						conn.close();
					if (ps != null)
						ps.close();
					if (rs != null)
						rs.close();
				} catch (SQLException e) {
					System.out.println("deleteBoard close error");
				}
			} // finally

			return cnt;

		}//deleteNotice

	}


