package Project_LMS_Controller;

import java.io.IOException;
import java.sql.SQLException;

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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

@WebServlet("/LMS/Teacher/examWrite_insert.html")
public class ExamWriteController_insert extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Common_dao com=new Common_dao();
		String teachername=req.getParameter("name");
		int result=0;
		try {
			result=com.classnumReturn(teachername);
			LMS_Class_Dto bean=com.teachernameReturn(teachername);
			req.setAttribute("classnum", result);
			req.setAttribute("bean4", bean);
		} catch (SQLException e) {
			System.out.println("강사팀 시험등록 화면출력 에러");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		
		req.getRequestDispatcher("examWrite_insert.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		
		HttpSession session=req.getSession();
		
		//파일 업로드
		String path=req.getRealPath("/upload");
		int maxSize=1024*1024*10;
		FileRenamePolicy frp=new DefaultFileRenamePolicy();
		MultipartRequest mr=new MultipartRequest(req,path,maxSize,"utf-8",frp);
		
		String examfile=mr.getFilesystemName("ex_file");
		String origin=mr.getOriginalFileName("ex_file");
		
		String examname=mr.getParameter("sub");
		String start=mr.getParameter("start");
		String end=mr.getParameter("end");
		String examorder=mr.getParameter("order");
		String examcontent=mr.getParameter("content");
		int classnum=Integer.parseInt(mr.getParameter("classnum"));
		
		System.out.println("넘어온 파라미터값 : "+examname+","+start+","+end+","+examorder+","+examcontent+","+classnum);
		
		String examexp=start+"부터"+end+"까지";
		
		LMS_TeacherTeam_Dao dao=new LMS_TeacherTeam_Dao();
		LMS_Emp_Dto login=(LMS_Emp_Dto)session.getAttribute("lmslogin");
		String teachername=login.getEmpname();
		
		int result=0;
		
		try {
			result=dao.examUpInsert(examname, teachername, examorder, examexp, examcontent, examfile, origin,classnum);
		} catch (SQLException e) {
			System.out.println("강사팀 시험등록 등록처리 에러");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		if(result>0){
			resp.sendRedirect("examWrite.html");
		}else{
			resp.sendRedirect("examWrite_insert.html");
		}
		
	}
}
