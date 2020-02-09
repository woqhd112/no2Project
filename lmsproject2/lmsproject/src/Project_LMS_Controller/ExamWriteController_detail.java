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

import Project_LMS_Model.LMS_Class_Dto;
import Project_LMS_Model.LMS_Exam_Dto;
import Project_LMS_Model.LMS_TeacherTeam_Dao;
import Project_Utils.Common_dao;

@WebServlet("/LMS/Teacher/examWrite_detail.html")
public class ExamWriteController_detail extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int examnum=Integer.parseInt(req.getParameter("num"));
		String empname=req.getParameter("name");
		System.out.println("�����ȣ : "+examnum);
		
		LMS_TeacherTeam_Dao dao=new LMS_TeacherTeam_Dao();
		Common_dao com=new Common_dao();
		
		try {
			LMS_Exam_Dto bean=dao.examUpSelectOne(examnum);
			LMS_Class_Dto bean1=com.teachernameReturn(empname);
			req.setAttribute("bean4", bean1);
			req.setAttribute("bean", bean);
		} catch (SQLException e) {
			System.out.println("������ ������ �������� ��� ����");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		
		req.getRequestDispatcher("examWrite_detail.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		//���� ���ε�
		String path=req.getRealPath("/upload");
		int maxSize=1024*1024*10;
		FileRenamePolicy frp=new DefaultFileRenamePolicy();
		MultipartRequest mr=new MultipartRequest(req,path,maxSize,"utf-8",frp);
		
		String examfile=null;
		String origin=null;
		
		//������ư Ŭ���� ��ϵ� ������ ������
		if(mr.getFilesystemName("newfile")==null){
			//���� ������ ������
			if(mr.getFilesystemName("oldfile")==null){
				examfile="";
				origin="";
			//���� ������ �����
			}else{
				examfile=mr.getFilesystemName("oldfile");
				origin=mr.getOriginalFileName("oldfile");
			}
		//��ϵ� ������ �����
		}else{
			examfile=mr.getFilesystemName("newfile");
			origin=mr.getOriginalFileName("newfile");
		}
		
		
		int examnum=Integer.parseInt(mr.getParameter("num"));
		String empname=mr.getParameter("name");
		String examname=mr.getParameter("sub").trim();
		String examcontent=mr.getParameter("content");
		
		System.out.println("�Ѿ�� �Ķ���� : "+examnum+","+examname+","+examcontent+","+empname);
		int result=0;
		LMS_TeacherTeam_Dao dao=new LMS_TeacherTeam_Dao();
		try {
			result=dao.examUpUpdate(examnum, examname, examcontent,examfile,origin);
		} catch (SQLException e) {
			System.out.println("������ ������ �������� ���� ����");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		if(result>0){
			resp.sendRedirect("examWrite_detail.html?num="+examnum+"&name="+examname);
		}else{
			
		}
		
	}
}
