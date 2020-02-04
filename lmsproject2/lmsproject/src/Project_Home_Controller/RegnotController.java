package Project_Home_Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_Home_Model.Home_Student_Dao;
import Project_Utils.Common_dao;
import Project_Utils.Paging;

@WebServlet("/Home/regnot.html")
public class RegnotController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		Home_Student_Dao dao = new Home_Student_Dao();
		Common_dao com=new Common_dao();
		
		int totalCount=0;	//로우갯수
		String tablename="regnot";	//테이블이름
		try {
			totalCount=com.tableRowReturn(tablename);
		} catch (SQLException e) {
			System.out.print("모집공고 화면처리-테이블갯수 에러");
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
		
		ArrayList<Object[]> list=new ArrayList<Object[]>();
		
		try {
			list=dao.regnotSelectAll(page);
			req.setAttribute("alist", list);
			req.setAttribute("paging", paging);
		} catch (SQLException e1) {
			System.out.println("모집공고 화면처리 에러");
			resp.sendRedirect("../index.html");
			return;
		}
		
		req.getRequestDispatcher("regnot.jsp").forward(req, resp);
	}
}
