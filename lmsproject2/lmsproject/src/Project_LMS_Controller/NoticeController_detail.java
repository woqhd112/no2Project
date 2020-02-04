package Project_LMS_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_LMS_Model.LMS_GovernTeam_Dao;
import Project_LMS_Model.LMS_Notice_Dto;

@WebServlet("/LMS/Govern/notice_detail.html")
public class NoticeController_detail extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		LMS_GovernTeam_Dao dao = new LMS_GovernTeam_Dao();
		
		int notnum = Integer.parseInt(req.getParameter("num"));
		int cnt = Integer.parseInt(req.getParameter("cnt"));
		System.out.println("공지사항 번호: "+notnum);
		System.out.println("공지사항 조회수: "+cnt);
		
		int notcnt = cnt+1;
		
		try {
			LMS_Notice_Dto bean = dao.noticeSelectOne(notnum, notcnt);
			req.setAttribute("bean", bean);
		} catch (SQLException e) {
			System.out.println("행정팀 공지사항 상세페이지 화면출력 에러");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		
		req.getRequestDispatcher("notice_detail.jsp").forward(req,resp);
			
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		int notnum = Integer.parseInt(req.getParameter("notnum"));
		String nottitle = req.getParameter("nottitle").trim();
		String notcontent = req.getParameter("notcontent").trim();
		
		System.out.println("파라미터 :"+notnum+","+nottitle+","+notcontent);
		LMS_GovernTeam_Dao dao = new LMS_GovernTeam_Dao();
		PrintWriter out=resp.getWriter();
		int result=0;
		try {
			result=dao.noticeUpdate(notnum, nottitle, notcontent);
		} catch (SQLException e) {
			System.out.println("행정팀 공지사항 상세페이지 수정처리 에러");
			out.print("fail1");
			out.flush();
			out.close();
		}
		if(result>0){
			out.print("ok");
			out.flush();
			out.close();
		}else{
			out.print("fail");
			out.flush();
			out.close();
		}
	}

}
