package Project_Home_Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_Home_Model.Home_Student_Dao;
import Project_LMS_Model.LMS_Notice_Dto;

@WebServlet("/Home/notice_detail.html")
public class NoticeController_detail extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Home_Student_Dao dao=new Home_Student_Dao();

		int notnum=Integer.parseInt(req.getParameter("num"));
		int cnt=Integer.parseInt(req.getParameter("cnt"));
		int notcnt=cnt+1;
		
		try {
			LMS_Notice_Dto bean=dao.noticeSelectOne(notnum,notcnt);
			req.setAttribute("bean", bean);
		} catch (SQLException e) {
			System.out.println("학생 공지사항 상세페이지 화면출력 에러");
			resp.sendRedirect("../index.html");
			return;
		}
		req.getRequestDispatcher("notice_detail.jsp").forward(req, resp);
	}
}
