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

@WebServlet("/Home/idcheck.html")
public class IdCheckController extends HttpServlet{
	
	  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		         throws ServletException, IOException {
		  
		      req.getRequestDispatcher("idcheck.jsp").forward(req, resp);
	  }
	  
	  @Override
	  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {
	     req.setCharacterEncoding("utf-8");

	     Home_Student_Dao dao=new Home_Student_Dao();
	     PrintWriter out=resp.getWriter();

	     String stuname=req.getParameter("name");
	     String stuphone=req.getParameter("num");
	     System.out.println("학생이름="+stuname+", 핸드폰번호="+stuphone);
	     String bean=null;
	     try {
	        bean=dao.checkid(stuname, stuphone);
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
	        System.out.println("아이디찾기 sql문 에러");
	        out.print("fail");
	        out.flush();
	        out.close();
	     }
	  }

}
