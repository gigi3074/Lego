package wish_lists;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board_global/likes.do")
public class AjaxLikesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int wist_no = Integer.parseInt(request.getParameter("wist_no"));
		int board_no = Integer.parseInt(request.getParameter("board_no"));
		String user_id = request.getParameter("user_id");
		
		WishBean lbean = new WishBean();
		lbean.setWist_no(wist_no);
		lbean.setBoard_no(board_no);
		lbean.setUser_id(user_id);
		
		int result = new CommentMgr().likesInsert(lbean);
		if(result >= 1) {
			new CommentMgr().likesUp(bnum);
			int liksCnt = new WishMgr().getBoard(bnum).getLikes();
			response.getWriter().print(liksCnt);
		}else {
			response.getWriter().print(0);
		}
	}

}