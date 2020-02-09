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

@WebServlet("/LMS/Govern/faq_delete.html")
public class FAQController_delete extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int faqnum = Integer.parseInt(req.getParameter("faqnum"));
		
		System.out.println(faqnum);
		
		LMS_GovernTeam_Dao dao = new LMS_GovernTeam_Dao();
		PrintWriter out = resp.getWriter();
		int result = 0;
		try {	
			result = dao.FAQDelete(faqnum);
		} catch (SQLException e){
			System.out.println("행정팀 FAQ 삭제처리 에러");
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
