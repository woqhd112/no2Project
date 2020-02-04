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
		
		//�˻�
		String search=req.getParameter("search");
		if(search==null)search="sub";
		String keyword=req.getParameter("keyword");
		if(keyword==null)keyword="";
		String[] searching=new String[]{search,keyword};
		System.out.println("controller�� search,keyword : "+search+","+keyword);
		
		
		//���̺��� �ο찳�� ���ϴ°�
		int totalCount=0;	//�ο찹��
		String tablename="notice";	//���̺��̸�
		try {
			if(keyword==""){
				totalCount=com.tableRowReturn(tablename);	//ù���ٽ� �ߵ�
			}else{
				totalCount=com.RowSearchReturn(tablename, search, keyword);		//�˻��������ٽ� �ߵ�
			}
		} catch (SQLException e) {
			System.out.println("�л� �������� ȭ�����-���̺��� ����");
			resp.sendRedirect("../index.html");
			return;
		}
		System.out.println("notice�� �� row���� : "+totalCount);
		
		
		//������
		int page=1;
		if(req.getParameter("page")!=null){
			page=Integer.parseInt(req.getParameter("page"));
		}
		Paging paging=new Paging();
		paging.setPage(page);
		paging.setTotalCount(totalCount);
		System.out.println("���� page : "+page);
		
		ArrayList<LMS_Notice_Dto> list=new ArrayList<LMS_Notice_Dto>();
		try {
			list=dao.noticeSelectAll(search,keyword,page);
			req.setAttribute("alist", list);
			req.setAttribute("paging", paging);
			req.setAttribute("searching", searching);
		} catch (SQLException e1) {
			System.out.println("�л� �������� ȭ����� ����");
			resp.sendRedirect("../index.html");
			return;
		}
		
		req.getRequestDispatcher("notice.jsp").forward(req, resp);
	}
	
	
}
