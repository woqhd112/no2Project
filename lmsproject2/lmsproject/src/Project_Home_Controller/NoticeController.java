package Project_Home_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_Home_Model.Home_Student_Dao;
import Project_LMS_Model.LMS_Notice_Dto;
import Project_Utils.Common_dao;
import Project_Utils.Paging;

@WebServlet("/Home/notice.html")
public class NoticeController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		Home_Student_Dao dao = new Home_Student_Dao();
		Common_dao com=new Common_dao();
		
		//검색
		String search=req.getParameter("search");
		if(search==null)search="sub";
		String keyword=req.getParameter("keyword");
		if(keyword==null)keyword="";
		String[] searching=new String[]{search,keyword};
		System.out.println("controller의 search,keyword : "+search+","+keyword);
		
		
		//테이블의 로우개수 구하는곳
		int totalCount=0;	//로우갯수
		String tablename="notice";	//테이블이름
		try {
			if(keyword==""){
				totalCount=com.tableRowReturn(tablename);	//첫접근시 발동
			}else{
				totalCount=com.RowSearchReturn(tablename, search, keyword);		//검색으로접근시 발동
			}
		} catch (SQLException e) {
			System.out.println("학생 공지사항 화면출력-테이블갯수 에러");
			resp.sendRedirect("../index.html");
			return;
		}
		System.out.println("notice의 총 row갯수 : "+totalCount);
		
		
		//페이지
		int page=1;
		if(req.getParameter("page")!=null){
			page=Integer.parseInt(req.getParameter("page"));
		}
		Paging paging=new Paging();
		paging.setPage(page);
		paging.setTotalCount(totalCount);
		System.out.println("현재 page : "+page);
		
		ArrayList<LMS_Notice_Dto> list=new ArrayList<LMS_Notice_Dto>();
		try {
			list=dao.noticeSelectAll(search,keyword,page);
			req.setAttribute("alist", list);
			req.setAttribute("paging", paging);
			req.setAttribute("searching", searching);
		} catch (SQLException e1) {
			System.out.println("학생 공지사항 화면출력 에러");
			resp.sendRedirect("../index.html");
			return;
		}
		
		req.getRequestDispatcher("notice.jsp").forward(req, resp);
	}
	
	
}
