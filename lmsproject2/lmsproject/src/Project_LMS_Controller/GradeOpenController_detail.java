package Project_LMS_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_Home_Model.Home_Student_Dto;
import Project_LMS_Model.LMS_EmployTeam_Dao;
import Project_LMS_Model.LMS_HireInfo_Dto;
import Project_LMS_Model.LMS_SalesTeam_Dao;
import Project_LMS_Model.LMS_Score_Dto;
import Project_Utils.Common_dao;
import Project_Utils.Paging;

@WebServlet("/LMS/Employ/gradeOpen_detail.html")
public class GradeOpenController_detail extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
			LMS_EmployTeam_Dao dao = new LMS_EmployTeam_Dao();
			int stunum = Integer.parseInt(req.getParameter("num"));
			System.out.println("학생 번호: "+stunum);
			try {
				Object[] obj=dao.gradeOpenSelectOne(stunum);
				req.setAttribute("bean", obj);
			} catch (SQLException e) {
				System.out.println("취업팀 성적조회 상세페이지 화면출력 에러");
				resp.sendRedirect("../lmsLogin.html");
				req.getSession().setAttribute("lmslogin", null);
				return;
			}
			
			req.getRequestDispatcher("gradeOpen_detail.jsp").forward(req,resp);
			
	}
}