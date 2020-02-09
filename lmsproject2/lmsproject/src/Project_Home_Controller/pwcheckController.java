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
import Project_LMS_Model.LMS_Emp_Dto;

@WebServlet("/Home/pwcheck.html")
public class pwcheckController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.getRequestDispatcher("pwcheck.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		Home_Student_Dao dao=new Home_Student_Dao();
		PrintWriter out=resp.getWriter();

		String stuid=req.getParameter("id");
		String stuphone=req.getParameter("num");
		System.out.println("학생아이디="+stuid+", 핸드폰번호="+stuphone);
		try {
			String bean=dao.checkpw(stuid, stuphone);
			System.out.println(bean);
			String fuck="wow";
			if(bean!=null){
				out.print(bean);
				out.flush();
				out.close();
			}else{
				out.print(fuck);
				out.flush();
				out.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
