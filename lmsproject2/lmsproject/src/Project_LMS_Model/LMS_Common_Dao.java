package Project_LMS_Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Project_Utils.MyOracle;

public class LMS_Common_Dao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public LMS_Common_Dao() {
	}
	
	
	//LMS 로그인 처리부분		처리완
	public LMS_Emp_Dto lmsLogin(String empid, String emppw) throws SQLException{
		String sql="select count(empnum) as \"login\", max(empid) as \"empid\", max(emppw) as \"emppw\",max(empname) as \"empname\",max(empphone) as \"empphone\",max(empemail) as \"empemail\",max(empaddr) as \"empaddr\",max(dept) as \"dept\",max(empdate) as \"empdate\",max(empnum) as \"empnum\" from Emp1 where empid=? and emppw=?";
		LMS_Emp_Dto bean=new LMS_Emp_Dto();
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, empid);
			pstmt.setString(2, emppw);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setLogin(rs.getInt("login"));
				bean.setEmpid(rs.getString("empid"));
				bean.setEmppw(rs.getString("emppw"));
				bean.setEmpname(rs.getString("empname"));
				bean.setEmpphone(rs.getString("empphone"));
				bean.setEmpemail(rs.getString("empemail"));
				bean.setEmpaddr(rs.getString("empaddr"));
				bean.setDept(rs.getString("dept"));
				bean.setEmpdate(rs.getDate("empdate"));
				bean.setEmpnum(rs.getInt("empnum"));
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return bean;
	}
	
	//LMS 아이디 찾기
	public String checkid(String empname, String empphone, String dept) throws SQLException{
		String sql="select empid from emp1 where empname=? and empphone=? and dept=?";
		String bean=null;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, empname);
			pstmt.setString(2, empphone);
			pstmt.setString(3, dept);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean=rs.getString("empid");
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return bean;
	}
	
	//LMS 비밀번호 찾기
	public String checkpw(String empid, String empphone, String dept) throws SQLException{
		String sql="select emppw from emp1 where empid=? and empphone=? and dept=?";
		String bean=null;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, empid);
			pstmt.setString(2, empphone);
			pstmt.setString(3, dept);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean=rs.getString("emppw");
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return bean;
	}
	
	//교직원정보 출력 처리부분		처리완
	public ArrayList<LMS_Emp_Dto> staffInfor(String search, String keyword, int page) throws SQLException{
		ArrayList<LMS_Emp_Dto> list=null;
		conn=MyOracle.getConnection();
		int startNum = (page-1)*5+1;
		int endNum = page*5;
		if(keyword=="") {
			try{
				list = new ArrayList<LMS_Emp_Dto>();
			//페이지 조합
				String sql="select * from (select rownum as emprn2, emprn, empname, empid,empemail,empphone,dept from (select rownum as emprn, empname, empid, empemail, empphone, dept from (select empname, empid, empemail, empphone, dept from emp1 order by empname desc) order by emprn desc) order by emprn2 desc) where emprn2>=? and emprn2<=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startNum);
				pstmt.setInt(2, endNum);
				rs=pstmt.executeQuery();
				while(rs.next()){
					LMS_Emp_Dto bean=new LMS_Emp_Dto();
					bean.setEmpname(rs.getString("empname"));
					bean.setEmpid(rs.getString("empid"));
					bean.setEmpemail(rs.getString("empemail"));
					bean.setEmpphone(rs.getString("empphone"));
					bean.setDept(rs.getString("dept"));
					
					list.add(bean);
				}
			}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
			}
	}else if(keyword!=""){
		list = new ArrayList<LMS_Emp_Dto>();
		System.out.println("dao의 search,keyword : "+search+","+keyword);
		try{
		String sql="select * from (select rownum as emprn2, emprn, empname, empid,empemail,empphone,dept from (select rownum as emprn, empname, empid, empemail, empphone, dept from (select empname, empid, empemail, empphone, dept from emp1 where "+search+" like ? order by empnum asc) order by emprn desc) order by emprn2 desc) where emprn2>=? and emprn2<=?";
		String keyword1 = "%"+keyword+"%";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, keyword1);
		pstmt.setInt(2, startNum);
		pstmt.setInt(3, endNum);
		rs=pstmt.executeQuery();
		while(rs.next()){
			LMS_Emp_Dto bean=new LMS_Emp_Dto();
			bean.setEmpname(rs.getString("empname"));
			bean.setEmpid(rs.getString("empid"));
			bean.setEmpemail(rs.getString("empemail"));
			bean.setEmpphone(rs.getString("empphone"));
			bean.setDept(rs.getString("dept"));
			
			list.add(bean);
		}
	}finally{
		if(rs!=null)rs.close();
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();
	}
}
return list;
}
	
	
	//정보수정 화면출력 처리부분		처리완
	public LMS_Emp_Dto inforSelectOne(int empnum) throws SQLException{
		String sql="select empnum,empid,empname,emppw,empemail,empphone,empaddr from Emp1 where empnum=?";
		LMS_Emp_Dto bean=new LMS_Emp_Dto();
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, empnum);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setEmpnum(rs.getInt("empnum"));
				bean.setEmpid(rs.getString("empid"));
				bean.setEmpname(rs.getString("empname"));
				bean.setEmppw(rs.getString("emppw"));
				bean.setEmpemail(rs.getString("empemail"));
				bean.setEmpphone(rs.getString("empphone"));
				bean.setEmpaddr(rs.getString("empaddr"));
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return bean;
	}
	
	
	
	//정보 수정 처리부분	처리완
	public int inforUpdate(int empnum, String emppw, String empemail, String empphone, String empaddr) throws SQLException{
		String sql="update Emp1 set emppw=?, empemail=?, empphone=?, empaddr=? where empnum=?";
		int result=0;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, emppw);
			pstmt.setString(2, empemail);
			pstmt.setString(3, empphone);
			pstmt.setString(4, empaddr);
			pstmt.setInt(5, empnum);
			result=pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return result;
	}
	
	
	
	
	
}
