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
		//���̺��� �ο찳�� ���ϴ°�
		int totalCount=0;	//�ο찹��
		
		String tablename="faq";	//���̺��̸�
		
		try {
			totalCount=com.tableRowReturn(tablename);
		} catch (SQLException e) {
			System.out.println("������ FAQ ȭ��ó��-���̺��� ����");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		System.out.println("faq�� �� row���� : "+totalCount);
		
		
		//������
		int page=1;
		if(req.getParameter("page")!=null){
			page=Integer.parseInt(req.getParameter("page"));
		}
		Paging paging=new Paging();
		paging.setPage(page);
		paging.setTotalCount2(totalCount);
		System.out.println("���� page : "+page);
	
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