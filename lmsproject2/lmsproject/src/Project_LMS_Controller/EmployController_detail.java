package Project_LMS_Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_LMS_Model.LMS_EmployTeam_Dao;
import Project_LMS_Model.LMS_HireInfo_Dto;

@WebServlet("/LMS/Employ/employ_detail.html")
public class EmployController_detail extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			LMS_EmployTeam_Dao dao = new LMS_EmployTeam_Dao();
			
			int infonum = Integer.parseInt(req.getParameter("num"));
			int cnt = Integer.parseInt(req.getParameter("cnt"));
			System.out.println("채용정보 번호: "+infonum);
			System.out.println("채용정보 조회수: "+cnt);
			
			int infocnt = cnt+1;
			
			try {
				LMS_HireInfo_Dto bean = dao.employSelectOne(infonum, infocnt);
				req.setAttribute("bean", bean);
			} catch (SQLException e) {
				System.out.println("취업공고 상세페이지 화면출력 에러");
				resp.sendRedirect("../lmsLogin.html");
				req.getSession().setAttribute("lmslogin", null);
				return;
			}
			
			req.getRequestDispatcher("employ_detail.jsp").forward(req,resp);
			
	}
}

