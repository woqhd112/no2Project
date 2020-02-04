package Project_Utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Project_Home_Model.Home_AttendTime_Dto;
import Project_LMS_Model.LMS_AttendInfo_Dto;
import Project_LMS_Model.LMS_Class_Dto;
import Project_LMS_Model.LMS_Emp_Dto;
import Project_LMS_Model.LMS_Exam_Dto;

public class Common_dao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public Common_dao() {
	}
	
	
	//강좌개설에만 쓰는 로우갯수 구하는곳
	public int tableRowSubCreate(String tablename) throws SQLException{
		int result=0;
		String sql="select max(rownum) as rn from "+tablename+" where classname!='미배정'";
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				result=rs.getInt("rn");
			}
			System.out.println(result);
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return result;
	}
	

	//로우갯수만 구하는곳
	public int tableRowReturn(String tablename) throws SQLException{
		int result=0;
		String sql="select max(rownum) as rn from "+tablename+"";
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				result=rs.getInt("rn");
			}
			System.out.println(result);
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return result;
	}
	
	
	//검색기능 추가한 로우갯수 구하는곳
	public int RowSearchReturn(String tablename, String search, String keyword) throws SQLException{
		int result=0;
		String sql="select max(rownum) as rn from "+tablename+" where "+search+" like '%"+keyword+"%'";
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				result=rs.getInt("rn");
			}
			System.out.println(result);
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		
		return result;
	}
	
	
	//모집공고 제목선택시 날짜 리턴하는 부분		처리완
	public LMS_Class_Dto regnotClassname(String classname) throws SQLException{
		String sql="select classnum,startdate,enddate from class where classname=?";
		LMS_Class_Dto bean=new LMS_Class_Dto();
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, classname);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setClassnum(rs.getInt("classnum"));
				bean.setStartdate(rs.getString("startdate"));
				bean.setEnddate(rs.getString("enddate"));
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return bean;
	}
	
	
	
	//강사팀 성적관리 검색기능시 테이블갯수 리턴
	public int gradeAdminReturnSearch(String empname,String search) throws SQLException{
		String sql="select count(*) from (select stunum,teachername,stuname,checkpct,first,second,third from student inner join emp1 on student.teachername=emp1.empname inner join attendinfo on student.stunum=attendinfo.stunum inner join score on student.stunum=score.stunum where student.teachername=?) where "+search+" like ?";
		String teachername="%"+empname+"%";
		int result=0;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, empname);
			pstmt.setString(2, teachername);
			result=pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return result;
		
	}
	
	//강사팀 성적관리 검색기능없는 테이블갯수 리턴
	public int gradeAdminReturnNoSearch(String empname) throws SQLException{
		String sql="select count(*) from (select stunum,teachername,stuname,checkpct,first,second,third from student inner join emp1 on student.teachername=emp1.empname inner join attendinfo on student.stunum=attendinfo.stunum inner join score on student.stunum=score.stunum where student.teachername=?)";
		int result=0;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, empname);
			result=pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return result;
	}
	
	//강사이름 리턴
	public LMS_Class_Dto teachernameReturn(String empname) throws SQLException{
		String sql="select classname,startdate,enddate from class inner join emp1 on class.teachername=emp1.empname where empname=?";
		LMS_Class_Dto bean=new LMS_Class_Dto();
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, empname);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setClassname(rs.getString("classname"));
				bean.setStartdate(rs.getString("startdate"));
				bean.setEnddate(rs.getString("enddate"));
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return bean;
	}
	
	
	
	//학생의 출석정보를 리턴
	public ArrayList<Object[]> attendTimeSelectAll(String teachername) throws SQLException{
		ArrayList<Object[]> list=new ArrayList<Object[]>();
		Object[] obj=null;
		String sql="select stunum,arrtime,leavetime,attendstat,ontime,late,absent,checkpct,attendpct from student inner join emp1 on student.teachername=emp1.empname inner join attendtime on student.stunum=attendtime.stunum inner join attendinfo on student.stunum=attendinfo.stunum where student.teachername=?";
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, teachername);
			rs=pstmt.executeQuery();
			while(rs.next()){
				LMS_AttendInfo_Dto bean1=new LMS_AttendInfo_Dto();
				Home_AttendTime_Dto bean2=new Home_AttendTime_Dto();
				bean2.setStunum(rs.getInt("stunum"));
				bean2.setArrtime(rs.getString("arrtime"));
				bean2.setLeavetime(rs.getString("leavetime"));
				bean2.setAttendstat(rs.getInt("attendstat"));
				bean1.setOntime(rs.getInt("ontime"));
				bean1.setLate(rs.getInt("late"));
				bean1.setAbsent(rs.getInt("absent"));
				bean1.setCheckpct(rs.getInt("checkpct"));
				bean1.setAttendpct(rs.getInt("attendpct"));
				
				obj=new Object[]{bean1,bean2};
				list.add(obj);
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return list;
	}
	
	
	//출석마감시 모든 attendinfo정보 업데이트
	public int attendInfoUpdate(int stunum,int ontime,int late,int absent,int checkpct,int attendpct){
		String sql="update attendinfo set ontime=?,late=?,absent=?,checkpct=?,attendpct=? where stunum=?";
		int result=0;
		System.out.println("attendinfo 메소드 접근성공");
		try {
			conn=MyOracle.getConnection();
			conn.setAutoCommit(false);
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, ontime);
			pstmt.setInt(2, late);
			pstmt.setInt(3, absent);
			pstmt.setInt(4, checkpct);
			pstmt.setInt(5, attendpct);
			pstmt.setInt(6, stunum);
			result=pstmt.executeUpdate();
			System.out.println("attendinfo 작업 성공");
		} catch (SQLException e) {
			try {
				conn.rollback();
				return result;
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally{
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	
	//출석마감시 모든 attendtime정보 업데이트
	public int attendTimeUpdate(int stunum){
		String sql="update attendtime set arrtime='',leavetime='',attendstat=3 where stunum=?";
		int result=0;
		System.out.println("attendtime 메소드 접근성공");
		try {
			conn=MyOracle.getConnection();
			conn.setAutoCommit(false);
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, stunum);
			result=pstmt.executeUpdate();
			System.out.println("attendtime 작업 성공");
		} catch (SQLException e) {
			try {
				conn.rollback();
				return result;
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally{
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	
	//출석마감에 사용될 각 강사팀의 학생들의 로우갯수 리턴
	public int tableRowCheckReturn(String teachername) throws SQLException{
		String sql="select count(*) as cnt from student inner join emp1 on student.teachername=emp1.empname inner join attendtime on student.stunum=attendtime.stunum inner join attendinfo on student.stunum=attendinfo.stunum where student.teachername=?";
		int result=0;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, teachername);
			rs=pstmt.executeQuery();
			if(rs.next()){
				result=rs.getInt("cnt");
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return result;
	}
	
	
	//강사이름들 리턴
	public ArrayList<LMS_Emp_Dto> teacherNameReturn() throws SQLException{
		String sql="select empname from emp1 where dept='강사팀'";
		ArrayList<LMS_Emp_Dto> list=new ArrayList<LMS_Emp_Dto>();
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				LMS_Emp_Dto bean=new LMS_Emp_Dto();
				bean.setEmpname(rs.getString("empname"));
				
				list.add(bean);
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return list;
	}
	
	//모집공고 강좌명 출력해주는 곳
	public ArrayList<LMS_Class_Dto> classNameRegnot() throws SQLException{
		String sql="select classnum,classname,teachername,startdate,enddate from Class";
		ArrayList<LMS_Class_Dto> list=new ArrayList<LMS_Class_Dto>();
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				LMS_Class_Dto bean=new LMS_Class_Dto();
				bean.setClassnum(rs.getInt("classnum"));
				bean.setClassname(rs.getString("classname"));
				bean.setTeachername(rs.getString("teachername"));
				bean.setStartdate(rs.getString("startdate"));
				bean.setEnddate(rs.getString("enddate"));
				
				list.add(bean);
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return list;
	}
	
	
	//학생수강등록 강좌명 출력해주는곳
	public ArrayList<Object[]> classNameStudentSubUp() throws SQLException{
		String sql="select class.classnum,class.classname,class.teachername,startdate,enddate,examnum from exam inner join class on exam.classnum=class.classnum";
		ArrayList<Object[]> list=new ArrayList<Object[]>();
		Object[] obj=null;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				if(!rs.getString("classname").equals("미배정")){
					LMS_Class_Dto bean1=new LMS_Class_Dto();
					LMS_Exam_Dto bean2=new LMS_Exam_Dto();
					bean1.setClassnum(rs.getInt("classnum"));
					bean1.setClassname(rs.getString("classname"));
					bean1.setTeachername(rs.getString("teachername"));
					bean1.setStartdate(rs.getString("startdate"));
					bean1.setEnddate(rs.getString("enddate"));
					bean2.setExamnum(rs.getInt("examnum"));
					
					obj=new Object[]{bean1,bean2};
					list.add(obj);
				}
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return list;
	}
	
	
	
	//클래스번호 강사이름으로 섞어서 출력
	public int classnumReturn(String teachername) throws SQLException{
		String sql="select classnum from emp1 inner join class on emp1.empname=class.teachername where emp1.empname=?";
		int result=0;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, teachername);
			rs=pstmt.executeQuery();
			if(rs.next()){
				result=rs.getInt("classnum");
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return result;
		
	}
	
	
	//강좌개설 등록부분에 셀렉트박스에서 이미 강사가 강좌진행중을 처리해주는곳
	public String teachernameCheck(String teachername) throws SQLException{
		String sql="select teachername from emp1 inner join class on emp1.empname=class.teachername where empname=?";
		String empname=null;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, teachername);
			rs=pstmt.executeQuery();
			if(rs.next()){
				empname=rs.getString("teachername");
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return empname;
	}
	
}
