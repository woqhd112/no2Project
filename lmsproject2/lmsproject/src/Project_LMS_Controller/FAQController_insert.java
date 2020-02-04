package Project_LMS_Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_LMS_Model.LMS_GovernTeam_Dao;

@WebServlet("/LMS/Govern/faq_insert.html")
public class FAQController_insert extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.getRequestDispatcher("faq_insert.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");

		String faqtitle = req.getParameter("faqtitle").trim();
		String faqcontent = req.getParameter("faqcontent").trim();
		String faqauthor = req.getParameter("faqauthor").trim();
	
		LMS_GovernTeam_Dao dao = new LMS_GovernTeam_Dao();
		try {
			dao.FAQInsert(faqtitle, faqcontent, faqauthor);
		} catch (SQLException e) {
			System.out.println("행정팀 FAQ 등록처리 에러");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		resp.sendRedirect("faq.html");
	}
}
