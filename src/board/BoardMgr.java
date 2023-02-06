package board;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DB.*;

public class BoardMgr {
	private DBConnectionMgr pool;
	private static final String SAVEFOLDER = "D:\\jspWork\\lego\\WebContent\\fileupload";
	private static final String ENCTYPE = "UTF-8";
	private static final int MAXSIZE = 5*1024*1024;
	
	public BoardMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	// review 글 삽입
	
	public boolean insertBoard(HttpServletRequest re) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;	// sql문 넣는곳
		MultipartRequest multi = null;	// 기타 다른 정보들 넣는 곳
		int board_fsize = 0;	// 파일 사이즈
		String board_pic = null;	// 파일 이름
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			File file = new File(SAVEFOLDER);
			if(file.exists())
				file.mkdir(); // 만드는 명령어 - 리눅스 언어 - 저장될 파일을 만들었으면 안 만들어도 됨.
									// 매개변수, 어디에?, 사이즈는?, 형식은?
			multi = new MultipartRequest(re, SAVEFOLDER, MAXSIZE, ENCTYPE,new DefaultFileRenamePolicy());
			
			if(multi.getFilesystemName("board_pic")!=null) {
				board_pic=multi.getFilesystemName("board_pic");
				board_fsize=(int)multi.getFile("board_pic").length();
			}
			// 테이블의 NUM은 시퀀스(자동으로 순서대로 번호가 들어감)로 처리한다.
			sql = "INSERT INTO BOARD VALUES(SEQ_BOARD.NEXTVAL,?,?,?,SYSDATE,?,?,SEQ_BOARD_REF.NEXTVAL,0,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql); // sql실행해랏
			pstmt.setString(1, multi.getParameter("board_sub"));
			pstmt.setString(2, multi.getParameter("board_con"));
			pstmt.setString(3, multi.getParameter("board_pass"));
			pstmt.setString(4, board_pic);
			pstmt.setInt(5, board_fsize);
			pstmt.setInt(6, Integer.parseInt(multi.getParameter("item_star")));
			pstmt.setString(7, multi.getParameter("board_ip"));
			pstmt.setString(8, multi.getParameter("uer_id"));
			pstmt.setInt(9, Integer.parseInt(multi.getParameter("item_no")));
			pstmt.setInt(10, Integer.parseInt(multi.getParameter("like_count")));
			pstmt.executeUpdate();	// 꼭 잊지말구 합시당
			
			if(pstmt.executeUpdate() == 1) {
				flag = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt);
		}
		return flag;
	}
	// 게시판의 총 글 수
	public int getTotalCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;	// sql문 넣는곳
		ResultSet rs = null;
		int totalCount = 0;
		
		try {
			con = pool.getConnection();
			sql = "SELECT COUNT(*) FROM BOARD where ITEM_NO =" + num;
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				totalCount = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return totalCount;
	}
	// 평점 평균
	public int getAvg(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;	// sql문 넣는곳
		ResultSet rs = null;
		int avg = 0;
		
		try {
			con = pool.getConnection();
			sql = "SELECT ROUND(AVG(item_star),1) FROM board where item_no =" + num;
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				avg = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return avg;
	}
	// 별점 카운트
	public int starCount(int num, int star) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;	// sql문 넣는곳
		ResultSet rs = null;
		int starCount = 0;	

		try {
			con = pool.getConnection();
			sql = "SELECT COUNT(item_star) FROM board where item_no = ? and item_star =" + star;
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next())
				starCount = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return starCount;
	}
	
	
	// 리뷰 내용
	public BoardBean getBoard(int num){
		BoardBean bean = new BoardBean();
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;	
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			sql = "SELECT* FROM BOARD WHERE item_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setBoard_no(rs.getInt(1));
				bean.setBoard_sub(rs.getString(2));
				bean.setBoard_con(rs.getString(3));
				bean.setBoard_pass(rs.getString(4));
				bean.setBoard_date(rs.getString(5));
				bean.setBoard_pic(rs.getString(6));
				bean.setBoard_fsize(rs.getInt(7));
				bean.setBoard_ref(rs.getInt(8));
				bean.setPos(rs.getInt(9));
				bean.setItem_star(rs.getInt(10));
				bean.setBoard_ip(rs.getString(12));
				bean.setUser_id(rs.getString(13));
				bean.setItem_no(rs.getInt(14));
				bean.setLike_count(rs.getInt(15));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return bean;
	}
	// 리뷰페이지 리스트
	public ArrayList<BoardBean> getBoardlist(int num, int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;	
		ResultSet rs = null;
		ArrayList<BoardBean> alist = new ArrayList<BoardBean>();
		
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM BOARD where item_no = ? and board_ref between ? and ? order by board_date desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setBoard_no(rs.getInt("board_no"));
				bean.setItem_star(rs.getInt("item_star"));
				bean.setUser_id(rs.getString("user_id"));
				bean.setBoard_sub(rs.getString("board_sub"));
				bean.setBoard_date(rs.getString("board_date"));
				bean.setBoard_con(rs.getString("board_con"));
				bean.setBoard_ip(rs.getString("board_ip"));
				alist.add(bean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return alist;
	}
	
	//파일 다운로드
	public void downLoad(HttpServletRequest request, HttpServletResponse response, JspWriter out, PageContext pagecontext) {
		
		try {
			String board_pic = request.getParameter("board_pic");
			File file = new File(UtilMgr.con(SAVEFOLDER+File.separator+board_pic));
								// UtilMgr.con 클래스이름.메소드
			byte b[] = new byte[(int)file.length()];
			response.setHeader("Accept-Ranges", "bytes");
			// 이 구문이 있으면 다운 받던 것을 이어받을 수 있다.
			String strClient = request.getHeader("User-Agent");
			if(strClient.indexOf("MSIE6.0")!=-1) {
				response.setContentType("application/smnet; charset=UTF-8");
				response.setHeader("Content-Disposition","board_pic="+ board_pic + ";");
			}else {
				response.setContentType("application/smnet; charset=UTF-8");
				response.setHeader("Content-Disposition","attachment;board_pic="+ board_pic + ";");
			}
			out.clear();
			out = pagecontext.pushBody();
			if(file.isFile()) {
				BufferedInputStream fin = new BufferedInputStream(new FileInputStream(file));
				BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());
				int read = 0;
				while((read = fin.read(b)) != -1) {
					outs.write(b, 0, read);
				}//while
				outs.close();
				fin.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	// count 증가 - 수정함/sql문확인함
	public void upCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;	

		try {
			con = pool.getConnection();
			sql = "UPDATE BOARD SET BOARD_COUNT =+ 1 WHERE BOARD_NO = "+ num;
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt);
		}
	}
	//수정
//	public void updateBoard(BoardBean bean) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		String sql = null;
//		
//		try {
//			con = pool.getConnection();
//			sql = "UPDATE BOARD SET NAME=?, SUBJECT=?, CONTENT=? WHERE NUM=?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, bean.getName());
//			pstmt.setString(2, bean.getSubject());
//			pstmt.setString(3, bean.getContent());
//			pstmt.setInt(4, bean.getNum());
//			pstmt.executeUpdate();
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}finally {
//			pool.freeConnection(con,pstmt);
//		}
//	}
	// 게시판 글 삭제
//	public boolean deleteBoard(int num){
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		String sql = null;
//		ResultSet rs = null;
//		boolean flag = false;
//		
//		try {
//			con = pool.getConnection();
//			sql="SELECT COUNT(*) FROM BOARD WHERE REF=?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, num);
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				int result = rs.getInt(1);
//				if(result == 1) {
//					flag= true;
//					// 파일은 서버에 올라간 것이기에 따로 삭제를 해야된다.
//					sql = "SELECT FILENAME FROM BOARD WHERE NUM=?";
//					pstmt = con.prepareStatement(sql);
//					pstmt.setInt(1, num);
//					rs = pstmt.executeQuery();
//					if(rs.next() && rs.getString(1) != null) {
////						if(!(rs.getString(1).equals(""))) {}  파일이 없는 경우
//						File file = new File(SAVEFOLDER + "/" + rs.getString(1));
//						if(file.exists()) {
//							UtilMgr.delete(SAVEFOLDER + "/" + rs.getString(1));
//						}
//					}
//					// 파일도 없고 댓글도 없을 때 실행되는 삭제문.
//					sql = "DELETE FROM BOARD WHERE NUM=?";
//					pstmt = con.prepareStatement(sql);
//					pstmt.setInt(1, num);
//					pstmt.executeUpdate();
//				}
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}finally {
//			pool.freeConnection(con,pstmt,rs);
//		}
//		return flag;
//	}
	
	// 답변의 위치값 증가
//	public void replyUpBoard(int ref, int pos) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		String sql = null;
//		
//		try {
//			con = pool.getConnection();
//			sql = "UPDATE BOARD SET POS = POS+1 WHERE REF=? and POS > ? ";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, ref);
//			pstmt.setInt(2, pos);
//			pstmt.executeUpdate();
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}finally {
//			pool.freeConnection(con,pstmt);
//		}
//	}
	// 댓글
//	public void replyBoard(BoardBean bean) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		String sql = null;
//		ResultSet rs = null;
//		
//		try {
//			con = pool.getConnection();
//			sql = "INSERT INTO BOARD VALUES(SEQ_BOARD.NEXTVAL,?,?,?,?,?,?,SYSDATE,?,?,0,null,null)";
////			int depth = bean.getDepth()+1;
//			int pos = bean.getPos()+1;
//			
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, bean.getName());
//			pstmt.setString(2, bean.getSubject());
//			pstmt.setString(3, bean.getContent());
//			pstmt.setInt(4, pos);
//			pstmt.setInt(5, bean.getRef());
////			pstmt.setInt(6, depth);
//			pstmt.setString(7, bean.getPass());
//			pstmt.setString(8, bean.getBoard_ip());
//			pstmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}finally {
//			pool.freeConnection(con,pstmt, rs);
//		}
//	}
//	
//	public static void main(String [] args) {
//		new BoardMgr().insert();
//	}
//	public void insert() {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		String sql = null;
//		
//		try {
//			con = pool.getConnection();
//			sql = "INSERT INTO BOARD(num, name, subject, content, ref, pos, depth, regdate) VALUES(seq_board.NEXTVAL, '이름', ?, '내용', seq_board.CURRVAL, 0, 0, '2022/12/08')";
//			pstmt = con.prepareStatement(sql);
//			for(int i = 1; i <= 8; i++ ) {
//				pstmt.setString(1, "제목"+i);
//			    pstmt.executeUpdate();
//			}
//			         
//			         
//			} catch (Exception e) {
//				e.printStackTrace();
//			} finally {
//				pool.freeConnection(con, pstmt);
//			}
//		
//	}
	
}// class
