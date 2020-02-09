package Project_LMS_Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_LMS_Model.LMS_EmployTeam_Dao;
import Project_LMS_Model.LMS_Score_Dto;
import Project_Utils.Common_dao;
import Project_Utils.Paging;

@WebServlet("/LMS/Employ/gradeOpen.html")
public class GradeOpenController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			LMS_EmployTeam_Dao dao = new LMS_EmployTeam_Dao();
			Common_dao com=new Common_dao();
			
			//�˻�
			String search = req.getParameter("search");
			if(search==null) search = "sub";
			String keyword = req.getParameter("keyword");
			if(keyword==null) keyword = "";
			String[] searching = new String[]{search, keyword};
			System.out.println("controller�� search, keyword: "+search+","+keyword);
			
			//���̺��� �ο찳�� ���ϴ°�
			int totalCount=0;	//�ο찹��
			
			String tablename="student";	//���̺��̸�
			
			try {
				if(keyword==""){
					totalCount = com.tableRowReturn(tablename);
				} else {
					totalCount = com.RowSearchReturn(tablename, search, keyword);
				}
			} catch (SQLException e) {
				System.out.println("����� ������ȸ �������� ȭ�����-���̺��� ����");
				resp.sendRedirect("../lmsLogin.html");
				req.getSession().setAttribute("lmslogin", null);
				return;
			}
			System.out.println("score�� �� row���� : "+totalCount);
			
			
			//������
			int page=1;
			if(req.getParameter("page")!=null){
				page=Integer.parseInt(req.getParameter("page"));
			}
			Paging paging=new Paging();
			paging.setPage(page);
			paging.setTotalCount2(totalCount);
			System.out.println("���� page : "+page);
		
			ArrayList<Object[]> list=new ArrayList<Object[]>();
			try {
				list=dao.gradeOpenSelectAll(search,keyword,page);
				req.setAttribute("alist", list);
				req.setAttribute("paging", paging);
				req.setAttribute("searching", searching);
			} catch (SQLException e1) {
				System.out.println("����� ������ȸ �������� ȭ����� ����");
				resp.sendRedirect("../lmsLogin.html");
				req.getSession().setAttribute("lmslogin", null);
				return;
			}
				
				req.getRequestDispatcher("gradeOpen.jsp").forward(req, resp);
			}
	}