package Project_Home_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_Home_Model.Home_Student_Dao;

@WebServlet("/Home/member.html")
public class MemberController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.getRequestDispatcher("member.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String stuid=req.getParameter("id");
		String stuname=req.getParameter("name");
		String stupw=req.getParameter("pw");
		String stuphone=req.getParameter("contact");
		String stuaddr=req.getParameter("address");
		System.out.println(stuid+","+stuname+","+stupw+","+stuphone+","+stuaddr);
		Home_Student_Dao dao=new Home_Student_Dao();
		PrintWriter out=resp.getWriter();
		int result=0;
		try {
			result=dao.memberInsert(stuid, stupw, stuname, stuphone, stuaddr);
		} catch (SQLException e) {
			System.out.println("회원가입 처리 에러");
			out.print("fail");
			out.flush();
			out.close();
		}
		if(result>0){
			out.print(result);
			out.flush();
			out.close();
		}
	}
}
