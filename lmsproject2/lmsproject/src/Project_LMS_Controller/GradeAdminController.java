package Project_LMS_Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Project_LMS_Model.LMS_Class_Dto;
import Project_LMS_Model.LMS_Emp_Dto;
import Project_LMS_Model.LMS_TeacherTeam_Dao;
import Project_Utils.Common_dao;
import Project_Utils.Paging;

@WebServlet("/LMS/Teacher/gradeAdmin.html")
public class GradeAdminController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session=req.getSession();
		LMS_Emp_Dto login=(LMS_Emp_Dto)session.getAttribute("lmslogin");
		LMS_TeacherTeam_Dao dao=new LMS_TeacherTeam_Dao();
		Common_dao com=new Common_dao();
		
		String empname=login.getEmpname();
		
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
				totalCount=com.gradeAdminReturnNoSearch(empname);	//ù���ٽ� �ߵ�
			}else{
				totalCount=com.gradeAdminReturnSearch(empname, search);	//�˻��������ٽ� �ߵ�
			}
		} catch (SQLException e) {
			System.out.println("������ �������� ȭ�����-���̺��� ����");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
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
		paging.setTotalCount2(totalCount);
		System.out.println("���� page : "+page);
		
		
		//���¸� �̴°�
		try {
			LMS_Class_Dto bean=com.teachernameReturn(empname);
			req.setAttribute("bean", bean);
		} catch (SQLException e1) {
			System.out.println("������ �������� ȭ�����-���¸� ����");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		
		try {
			ArrayList<Object[]> list=dao.gradeAdminSelectAll(empname,search,keyword,page);
			req.setAttribute("alist", list);
			req.setAttribute("paging", paging);
			req.setAttribute("searching", searching);
		} catch (SQLException e) {
			System.out.println("������ �������� ȭ����� ����");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		
		req.getRequestDispatcher("gradeAdmin.jsp").forward(req, resp);
	}
}
