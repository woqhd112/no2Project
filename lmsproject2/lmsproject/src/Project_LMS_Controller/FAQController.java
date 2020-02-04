package Project_LMS_Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_LMS_Model.LMS_FAQ_Dto;
import Project_LMS_Model.LMS_GovernTeam_Dao;
import Project_Utils.Common_dao;
import Project_Utils.Paging;

@WebServlet("/LMS/Govern/faq.html")
public class FAQController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		LMS_GovernTeam_Dao dao = new LMS_GovernTeam_Dao();
		Common_dao com=new Common_dao();
		//테이블의 로우개수 구하는곳
		int totalCount=0;	//로우갯수
		
		String tablename="faq";	//테이블이름
		
		try {
			totalCount=com.tableRowReturn(tablename);
		} catch (SQLException e) {
			System.out.println("행정팀 FAQ 화면처리-테이블갯수 에러");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		System.out.println("faq의 총 row갯수 : "+totalCount);
		
		
		//페이지
		int page=1;
		if(req.getParameter("page")!=null){
			page=Integer.parseInt(req.getParameter("page"));
		}
		Paging paging=new Paging();
		paging.setPage(page);
		paging.setTotalCount2(totalCount);
		System.out.println("현재 page : "+page);
	
		ArrayList<LMS_FAQ_Dto> list=new ArrayList<LMS_FAQ_Dto>();
		try {
			list=dao.FAQSelectAll(page);
			req.setAttribute("alist", list);
			req.setAttribute("paging", paging);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
			
			req.getRequestDispatcher("faq.jsp").forward(req, resp);
		}
}