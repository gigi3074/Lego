package board;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/boardUpdate")
public class BoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//비밀번호 맞는지 확인하기 위해 값들 가져오기
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();

		BoardMgr bMgr = new BoardMgr(); // 객체를 만들어서 그쪽에 있는 것을 가져와서 씀
		// 기존에 들어있는 bean의 값 가져오기 - 비밀번호 확인하고 내용 수정을 하기 위해 가져옴
		BoardBean bean = (BoardBean)session.getAttribute("bean");
		String nowPage = request.getParameter("nowPage");
		
		// 사용자로부터 새롭게 받은 값을 bean에 넣기
		BoardBean upBean = new BoardBean();
		upBean.setBoard_no(Integer.parseInt(request.getParameter("num")));
		upBean.setName(request.getParameter("name"));
		upBean.setSubject(request.getParameter("subject"));
		upBean.setContent(request.getParameter("content"));		
		
		String inPass = bean.getPass();
		String upPass = request.getParameter("pass");
		if(inPass.equals(upPass)) {
			bMgr.updateBoard(upBean);
			response.sendRedirect("read.jsp?nowPage="+nowPage+"&num="+upBean.getNum());
		}else {
			out.print("<script>");
			out.print("alert('비밀번호가 일치하지 않습니다.');");
			out.print("history.go(-1);");
			out.print("</script>");
		}
		
	}

}
