package Project_Home_Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_Home_Model.Home_Student_Dao;
import Project_LMS_Model.LMS_FAQ_Dto;
import Project_Utils.Common_dao;
import Project_Utils.Paging;

@WebServlet("/Home/faq.html")
public class FAQController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		Home_Student_Dao dao = new Home_Student_Dao();
		ArrayList<LMS_FAQ_Dto> list = new ArrayList<LMS_FAQ_Dto>();
		
		Common_dao com=new Common_dao();
		
		int totalCount=0;	//로우갯수
		String tablename="regnot";	//테이블이름
		try {
			totalCount=com.tableRowReturn(tablename);
		} catch (SQLException e) {
			System.out.println("FAQ 화면출력-테이블갯수 구하기 에러");
			resp.sendRedirect("../index.html");
			return;
		}
		
		//페이지
		int page=1;
		if(req.getParameter("page")!=null){
			page=Integer.parseInt(req.getParameter("page"));
		}
		Paging paging=new Paging();
		paging.setPage(page);
		paging.setTotalCount2(totalCount);
		System.out.println("현재 page : "+page);
		
		try {
			list=dao.FAQSelectAll(page);
			req.setAttribute("alist", list);
			req.setAttribute("paging", paging);
		} catch (SQLException e) {
			System.out.println("FAQ 화면출력 에러");
			resp.sendRedirect("../index.html");
			return;
		}
		
		req.getRequestDispatcher("faq.jsp").forward(req, resp);
	}
}