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

@WebServlet("/Home/memberduplicate.html")
public class MemberController_duplicate extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String stuid=req.getParameter("id");
		int check=0;
		Home_Student_Dao dao=new Home_Student_Dao();
		PrintWriter out=resp.getWriter();
		try {
			check=dao.memberDuplicate(stuid);
		} catch (SQLException e) {
			System.out.println("아이디 중복체크 처리 에러");
			out.print("fail");
			out.flush();
			out.close();
		}
		//req.setAttribute("check", check);
		System.out.println(check);
		out.print(check);
		out.flush();
		out.close();
	}
}
