package wish_lists;

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

public class WishMgr {
	private DBConnectionMgr pool;
	private static final String SAVEFOLDER = "D:\\jspWork\\lego\\WebContent\\fileupload";
	private static final String ENCTYPE = "UTF-8";
	private static final int MAXSIZE = 5*1024*1024;
	
	public WishMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	 public void bGood(int idx) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;	// sql문 넣는곳
			MultipartRequest multi = null;	// 기타 다른 정보들 넣는 곳
			
		    try {
		      sql = "update board set good = good + 1 where idx = ?";
		      pstmt = con.prepareStatement(sql);
		      pstmt.setInt(1, idx);
		      pstmt.executeUpdate();
		      
		      if(pstmt != null) pstmt.close();
		      
		      sql = "update board set readnum = readnum - 1 where idx = ?";
		      pstmt = con.prepareStatement(sql);
		      pstmt.setInt(1, idx);
		      pstmt.executeUpdate();
		      
		    } catch (SQLException e) {
		      System.out.println("SQL 에러 : " + e.getMessage());
		      e.printStackTrace();
		    } finally {
				pool.freeConnection(con,pstmt);
		    }
		  }

} //class