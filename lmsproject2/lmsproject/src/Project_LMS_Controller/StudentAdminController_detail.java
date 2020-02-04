package Project_LMS_Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_LMS_Model.LMS_GovernTeam_Dao;

@WebServlet("/LMS/Govern/studentAdmin_detail.html")
public class StudentAdminController_detail extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		LMS_GovernTeam_Dao dao=new LMS_GovernTeam_Dao();
		int stunum=Integer.parseInt(req.getParameter("num"));
		
		try {
			Object[] obj=dao.studentAdminSelectOne(stunum);
			req.setAttribute("bean", obj);
		} catch (SQLException e) {
			System.out.println("행정팀 수강생관리 상세페이지 화면처리 에러");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		
		req.getRequestDispatcher("studentAdmin_detail.jsp").forward(req, resp);
	}
}
