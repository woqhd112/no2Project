package Project_LMS_Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_Home_Model.Home_Student_Dto;
import Project_LMS_Model.LMS_SalesTeam_Dao;
import Project_Utils.Common_dao;
import Project_Utils.Paging;

@WebServlet("/LMS/Sales/studentSubUp.html")
public class StudentSubUpController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		LMS_SalesTeam_Dao dao=new LMS_SalesTeam_Dao();
		
		Common_dao com=new Common_dao();
		
		//�˻�
		String search=req.getParameter("search");
		if(search==null)search="stuname";
		String keyword=req.getParameter("keyword");
		if(keyword==null)keyword="";
		String[] searching=new String[]{search,keyword};
		
		System.out.println("controller�� search,keyword : "+search+","+keyword);
		
		
		//���̺��� �ο찳�� ���ϴ°�
		int totalCount=0;	//�ο찹��
		
		String tablename="student";	//���̺��̸�
		
		try {
			if(keyword==""){
				totalCount=com.tableRowReturn(tablename);	//ù���ٽ� �ߵ�
			}else{
				totalCount=com.RowSearchReturn(tablename, search, keyword);		//�˻��������ٽ� �ߵ�
			}
		} catch (SQLException e1) {
			System.out.println("������ �л�������� ȭ�����-���̺��� ����");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		System.out.println("student�� �� row���� : "+totalCount);
		
		
		//������
		int page=1;
		if(req.getParameter("page")!=null){
			page=Integer.parseInt(req.getParameter("page"));
		}
		Paging paging=new Paging();
		paging.setPage(page);
		paging.setTotalCount2(totalCount);
		System.out.println("���� page : "+page);
		
		ArrayList<Home_Student_Dto> bean=null;
		try {
			bean=dao.studentSubUpSelectAll(search,keyword,page);
			req.setAttribute("bean", bean);
			req.setAttribute("paging", paging);
			req.setAttribute("searching", searching);
		} catch (SQLException e) {
			System.out.println("������ �л�������� ȭ����� ����");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		req.getRequestDispatcher("studentSubUp.jsp").forward(req, resp);
	}
}
