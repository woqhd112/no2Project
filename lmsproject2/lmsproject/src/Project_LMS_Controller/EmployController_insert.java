package Project_LMS_Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_LMS_Model.LMS_EmployTeam_Dao;
import Project_LMS_Model.LMS_HireInfo_Dto;

@WebServlet("/LMS/Employ/employ_insert.html")
public class EmployController_insert extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			
			req.getRequestDispatcher("employ_insert.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		String infotitle = req.getParameter("infotitle").trim();
		String cmpname = req.getParameter("cmpname").trim();
		String cmpexp = req.getParameter("cmpexp").trim();
		String cmplink = req.getParameter("cmplink").trim();
		String infoauthor = req.getParameter("infoauthor").trim();
		
		LMS_EmployTeam_Dao dao = new LMS_EmployTeam_Dao();
		try {
			dao.employInsert(infotitle, infoauthor, cmpname, cmpexp, cmplink);
		} catch (SQLException e) {
			System.out.println("취업공고 등록처리 에러");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		resp.sendRedirect("employ.html");
	}
}
