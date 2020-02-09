package Project_LMS_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import Project_LMS_Model.LMS_SalesTeam_Dao;

@WebServlet("/LMS/Sales/regnot_detail.html")
public class RegnotController_detail extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		LMS_SalesTeam_Dao dao=new LMS_SalesTeam_Dao();
		
		int regnum=Integer.parseInt(req.getParameter("num"));
		int cnt=Integer.parseInt(req.getParameter("cnt"));
		System.out.println("�������� ��ȣ : "+regnum);
		System.out.println("���� ��ȸ�� : "+cnt);
		
		int regcnt=cnt+1;
		
		try {
			Object[] obj=dao.regnotSelectOne(regnum,regcnt);
			req.setAttribute("bean", obj);
		} catch (SQLException e) {
			System.out.println("������ �������� �������� ȭ����� ����");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		
		req.getRequestDispatcher("regnot_detail.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		LMS_SalesTeam_Dao dao=new LMS_SalesTeam_Dao();
		//���� ���ε�
		String path=req.getRealPath("/upload");
		int maxSize=1024*1024*10;
		FileRenamePolicy frp=new DefaultFileRenamePolicy();
		MultipartRequest mr=new MultipartRequest(req,path,maxSize,"utf-8",frp);
		
		String regfile=null;
		String origin=null;
		
		//������ư Ŭ���� ��ϵ� ������ ������
		if(mr.getFilesystemName("newfile")==null){
			//���� ������ ������
			if(mr.getFilesystemName("oldfile")==null){
				regfile="";
				origin="";
			//���� ������ �����
			}else{
				regfile=mr.getFilesystemName("oldfile");
				origin=mr.getOriginalFileName("oldfile");
			}
		//��ϵ� ������ �����
		}else{
			regfile=mr.getFilesystemName("newfile");
			origin=mr.getOriginalFileName("newfile");
		}
		
		
		String regcontent=mr.getParameter("content");
		int regnum=Integer.parseInt(mr.getParameter("num"));
		int regcnt=Integer.parseInt(mr.getParameter("cnt"));
		System.out.println("�������� ���� : "+regcontent);
		System.out.println("��������� ��ȣ : "+regnum);
		System.out.println("���ϸ� : "+regfile);
		System.out.println("���ϸ���� : "+origin);
		
		try {
			if(regfile==null){
				
			}else{
				dao.regnotUpdate(regnum, regcontent,regfile,origin);
			}
		} catch (SQLException e) {
			System.out.println("������ �������� ����ó�� ����");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		resp.sendRedirect("regnot_detail.html?num="+regnum+"&cnt="+regcnt);
	}
}
