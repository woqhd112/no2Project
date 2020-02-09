package Project_LMS_Controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import Project_LMS_Model.LMS_GovernTeam_Dao;
import Project_LMS_Model.LMS_SalesTeam_Dao;
import Project_Utils.Common_dao;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

@WebServlet("/LMS/Sales/regnot_insert.html")
public class RegnotController_insert extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		
		//select option ���¸� ������ִºκ�
		Common_dao dao=new Common_dao();
		try {
			ArrayList<LMS_Class_Dto> list=dao.classNameRegnot();
			req.setAttribute("alist", list);
		} catch (SQLException e) {
			System.out.println("������ �������� ��� ȭ����� ����");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		req.getRequestDispatcher("regnot_insert.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		HttpSession session=req.getSession();
		
		//�����ý� ��¥ �̴°�
		if(req.getParameter("name")!=null){
			System.out.println("����");
			Common_dao dao=new Common_dao();
			String classname=req.getParameter("name");
			System.out.println("������? "+classname);
			LMS_Class_Dto bean=null;
			try {
				bean=dao.regnotClassname(classname);
				session.setAttribute("bean", bean);
			} catch (SQLException e) {
				System.out.println("������ �������� ���ó��-�����ý� ��¥��� ����");
				resp.sendRedirect("../lmsLogin.html");
				req.getSession().setAttribute("lmslogin", null);
				return;
			}
			PrintWriter out=resp.getWriter();
			out.print(bean.getStartdate()+"-");
			out.print(bean.getEnddate());
			out.flush();
			out.close();
			return;
		}
		
		//���Ͼ��ε�
		String path=req.getRealPath("/upload");
		int maxSize=1024*1024*10;
		FileRenamePolicy frp=new DefaultFileRenamePolicy();
		MultipartRequest mr=new MultipartRequest(req,path,maxSize,"utf-8",frp);
		
		String regfile=mr.getFilesystemName("ex_file");
		String origin=mr.getOriginalFileName("ex_file");
		System.out.println(path);
		System.out.println(regfile);
		System.out.println(origin);
		
		LMS_Class_Dto bean=(LMS_Class_Dto)session.getAttribute("bean");
		LMS_Emp_Dto login=(LMS_Emp_Dto)session.getAttribute("lmslogin");
		String regauthor=login.getDept();
		String regcontent=mr.getParameter("content");
		
		System.out.println("�ۼ��ڴ� : "+regauthor);
		System.out.println("������ : "+regcontent);
		int classnum=bean.getClassnum();
		System.out.println("���¹�ȣ�� : "+classnum);
		LMS_SalesTeam_Dao dao=new LMS_SalesTeam_Dao();
		int result=0;
		try {
			result=dao.regnotInsert(classnum, regauthor, regcontent,regfile,origin);
			session.setAttribute("bean", null);
		} catch (SQLException e) {
			System.out.println("������ �������� ���ó�� ����");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		if(result>0){
			resp.sendRedirect("regnot.html");
		}else{
			resp.sendRedirect("regnot_insert.html");
			
		}
		
		
	}
}
