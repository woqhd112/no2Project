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
		System.out.println("모집공고 번호 : "+regnum);
		System.out.println("모집 조회수 : "+cnt);
		
		int regcnt=cnt+1;
		
		try {
			Object[] obj=dao.regnotSelectOne(regnum,regcnt);
			req.setAttribute("bean", obj);
		} catch (SQLException e) {
			System.out.println("영업팀 모집공고 상세페이지 화면출력 에러");
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
		//파일 업로드
		String path=req.getRealPath("/upload");
		int maxSize=1024*1024*10;
		FileRenamePolicy frp=new DefaultFileRenamePolicy();
		MultipartRequest mr=new MultipartRequest(req,path,maxSize,"utf-8",frp);
		
		String regfile=null;
		String origin=null;
		
		//수정버튼 클릭시 등록된 파일이 없을시
		if(mr.getFilesystemName("newfile")==null){
			//기존 파일이 없을시
			if(mr.getFilesystemName("oldfile")==null){
				regfile="";
				origin="";
			//기존 파일이 존재시
			}else{
				regfile=mr.getFilesystemName("oldfile");
				origin=mr.getOriginalFileName("oldfile");
			}
		//등록된 파일이 존재시
		}else{
			regfile=mr.getFilesystemName("newfile");
			origin=mr.getOriginalFileName("newfile");
		}
		
		
		String regcontent=mr.getParameter("content");
		int regnum=Integer.parseInt(mr.getParameter("num"));
		int regcnt=Integer.parseInt(mr.getParameter("cnt"));
		System.out.println("모집공고 내용 : "+regcontent);
		System.out.println("모집공고상세 번호 : "+regnum);
		System.out.println("파일명 : "+regfile);
		System.out.println("파일명원본 : "+origin);
		
		try {
			if(regfile==null){
				
			}else{
				dao.regnotUpdate(regnum, regcontent,regfile,origin);
			}
		} catch (SQLException e) {
			System.out.println("영업팀 상세페이지 수정처리 에러");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		resp.sendRedirect("regnot_detail.html?num="+regnum+"&cnt="+regcnt);
	}
}
