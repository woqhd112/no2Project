package Project_LMS_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_LMS_Model.LMS_FAQ_Dto;
import Project_LMS_Model.LMS_GovernTeam_Dao;

@WebServlet("/LMS/Govern/faq_detail.html")
public class FAQController_detail extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		LMS_GovernTeam_Dao dao = new LMS_GovernTeam_Dao();
		
		int faqnum = Integer.parseInt(req.getParameter("num"));
		System.out.println("FAQ 번호: "+faqnum);
		
		try {
			LMS_FAQ_Dto bean = dao.FAQSelectOne(faqnum);
			req.setAttribute("bean", bean);
		} catch (SQLException e) {
			System.out.println("행정팀 FAQ 상세페이지 화면출력 에러");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		
		req.getRequestDispatcher("faq_detail.jsp").forward(req,resp);

		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		int faqnum = Integer.parseInt(req.getParameter("faqnum"));
		String faqtitle = req.getParameter("faqtitle").trim();
		String faqcontent = req.getParameter("faqcontent").trim();
		
		System.out.println("파라미터 :"+faqnum+","+faqtitle+","+faqcontent);
		LMS_GovernTeam_Dao dao = new LMS_GovernTeam_Dao();
		PrintWriter out=resp.getWriter();
		int result=0;
		
		try {
			result=dao.FAQUpdate(faqnum, faqtitle, faqcontent);
		} catch (SQLException e) {
			System.out.println("행정팀 FAQ 상세페이지 수정처리 에러");
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
