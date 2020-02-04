package Project_LMS_Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Project_Home_Model.Home_AttendTime_Dto;
import Project_Home_Model.Home_Student_Dto;
import Project_Utils.MyOracle;

public class LMS_GovernTeam_Dao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public LMS_GovernTeam_Dao() {
	}
	
	//회원가입 아이디 중복체크 처리부분			처리완  result=1이면 중복 0이면 중복x
	public int empDuplicate(String empid) throws SQLException{
		String sql="select count(empnum) as \"duplicate\" from emp1 where empid=?";
		int result=0;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, empid);
			rs=pstmt.executeQuery();
			if(rs.next()){
				result=rs.getInt("duplicate");
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return result;
	}
	
	
	
	//교직원관리 리스트출력 처리부분		처리완
	public ArrayList<LMS_Emp_Dto> staffAdminSelectAll() throws SQLException{
		String sql="select empname,empid,empemail,empphone,dept from Emp";
		ArrayList<LMS_Emp_Dto> list=new ArrayList<LMS_Emp_Dto>();
		LMS_Emp_Dto bean=new LMS_Emp_Dto();
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
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
		
		return list;
	}
	
	
	
	
	//교직원관리 상세페이지 처리부분	처리완
	public LMS_Emp_Dto staffAdminSelectOne(String empid) throws SQLException{
		String sql="select empid,empname,empphone,dept,empemail,empdate, empaddr from emp1 where empid=?";
		LMS_Emp_Dto bean=new LMS_Emp_Dto();
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, empid);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setEmpid(rs.getString("empid"));
				bean.setEmpname(rs.getString("empname"));
				bean.setEmpphone(rs.getString("empphone"));
				bean.setDept(rs.getString("dept"));
				bean.setEmpemail(rs.getString("empemail"));
				bean.setEmpdate(rs.getDate("empdate"));
				bean.setEmpaddr(rs.getString("empaddr"));
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return bean;
	}
	
	
	
	
	//교직원관리 등록 처리부분		처리완
	public int staffAdminInsert(String empid, String emppw, String empname, String empphone, String empemail, String dept, String empaddr) throws SQLException{
		String sql="insert into emp1 values (emp1_seq.nextval, ?, ?, ?, ?, ?, ?, ?, sysdate)";
		int result=0;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, empname);
			pstmt.setString(2, empid);
			pstmt.setString(3, emppw);
			pstmt.setString(4, empemail);
			pstmt.setString(5, empphone);
			pstmt.setString(6, dept);
			pstmt.setString(7, empaddr);
			result=pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return result;
	}
	
	
	
	//교직원관리 수정 처리부분		처리완
	public int staffAdminUpdate(String empid, String empphone, String dept, String empemail) throws SQLException{
		String sql="update emp1 set empphone=?, dept=?, empemail=? where empid=?";
		int result=0;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, empphone);
			pstmt.setString(2, dept);
			pstmt.setString(3, empemail);
			pstmt.setString(4, empid);
			result=pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return result;
	}
	
	
	
	
	//교직원관리 삭제 처리부분		처리완
	public int staffAdminDelete(String empid) throws SQLException{
		String sql="delete from emp1 where empid=?";
		int result=0;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, empid);
			result=pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return result;
		
	}
	
	
	//강좌개설 리스트출력 처리부분		처리완
	public ArrayList<LMS_Class_Dto> subCreateSelectAll(int page) throws SQLException{
		String sql="select * from (select rownum rn2,rn,classnum,classname,teachername,startdate,enddate from (select rownum rn,classnum,classname,teachername,startdate,enddate from (select classnum,classname,teachername,startdate,enddate from Class order by classnum asc) order by rn desc) order by rn2 desc) where rn2>=? and rn2<=?";
		ArrayList<LMS_Class_Dto> list=new ArrayList<LMS_Class_Dto>();
		int startNum=(page-1)*5+1;
		int endNum=page*5;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs=pstmt.executeQuery();
			while(rs.next()){
				LMS_Class_Dto bean=new LMS_Class_Dto();
				if(!rs.getString("classname").equals("미배정")){
					bean.setClassnum(rs.getInt("classnum"));
					bean.setClassname(rs.getString("classname"));
					bean.setTeachername(rs.getString("teachername"));
					bean.setStartdate(rs.getString("startdate"));
					bean.setEnddate(rs.getString("enddate"));
					
					list.add(bean);
				}
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return list;
	}
	
	
	
	
	//강좌개설 상세페이지 처리부분		처리완
	public LMS_Class_Dto subCreateSelectOne(int classnum) throws SQLException{
		String sql="select classnum,classname,teachername,startdate,enddate from Class where classnum=?";
		LMS_Class_Dto bean=new LMS_Class_Dto();
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, classnum);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setClassnum(rs.getInt("classnum"));
				bean.setClassname(rs.getString("classname"));
				bean.setTeachername(rs.getString("teachername"));
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
	
	
	//강좌개설 등록 처리부분		처리완
	public int subCreateInsert(String classname, String teachername, String startdate, String enddate) throws SQLException{
		String sql="insert into Class values (Class_seq.nextval,?,?,?,?)";
		String sql1="insert into exam values (exam_seq.nextval,'',?,1,sysdate,'','','','',class_seq.currval)";
		int result=0;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, classname);
			pstmt.setString(2, teachername);
			pstmt.setString(3, startdate);
			pstmt.setString(4, enddate);
			pstmt.executeUpdate();
			pstmt=conn.prepareStatement(sql1);
			pstmt.setString(1, teachername);
			result=pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return result;
	}
	
	
	//업데이트되야할 테이블 class,exam,student
	//강좌개설 수정 처리부분		처리완	00시 이후에 자동적으로 total값이 nextval 되게 처리해야함
	public int subCreateUpdate(int classnum, String classname, String teachername, String startdate, String enddate) throws SQLException{
		String sql="update Class set classname=?, teachername=?, startdate=?, enddate=? where classnum=?";
		String sql1="update exam set teachername=? where classnum=?";
		String sql2="update student set teachername=?,classname=? where classnum=?";
		int result=0;
		try{
			conn=MyOracle.getConnection();
			conn.setAutoCommit(false);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, classname);
			pstmt.setString(2, teachername);
			pstmt.setString(3, startdate);
			pstmt.setString(4, enddate);
			pstmt.setInt(5, classnum);
			pstmt.executeUpdate();
			pstmt=conn.prepareStatement(sql1);
			pstmt.setString(1, teachername);
			pstmt.setInt(2, classnum);
			pstmt.executeUpdate();
			pstmt=conn.prepareStatement(sql2);
			pstmt.setString(1, teachername);
			pstmt.setString(2, classname);
			pstmt.setInt(3, classnum);
			result=pstmt.executeUpdate();
		}catch(SQLException e){
			conn.rollback();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return result;
	}
	
	
	
	//강좌개설 삭제 처리부분		처리완
	public int subCreateDelete(int classnum) throws SQLException{
		//학생 강좌정보 리셋
		String sql="update student set examnum=1,classnum=1,classname='미배정',teachername='미배정' where classnum=?";
		//해당 강좌삭제
		String sql1="delete from Class where classnum=?";
		//해당 강좌와 엮인 시험테이블 삭제
		String sql2="delete from exam where classnum=?";
		//시험테이블 번호를 뽑기위한 처리
		String sql3="select examnum from exam where classnum=?";
		//해당 강좌와 엮긴 시험테이블에 엮여있는 점수테이블 리셋
		String sql4="update score set examnum=1,first=0,second=0,third=0 where examnum=?";
		//출석정보 리셋을위한 학생번호 처리
		String sql5="select stunum from student where classnum=?";
		//해당학생의 출석정보 리셋
		String sql6="update attendinfo set attendpct=0,checkpct=0,ontime=0,late=0,absent=0 where stunum=?";
		//해당 강좌와 엮인 모집공고 리셋
		String sql7="update regnot set classnum=1 where classnum=?";
		
		int result=0;
		int examnum=0;
		ArrayList<Integer> list=new ArrayList<Integer>();
		try{
			System.out.println("1");
			conn=MyOracle.getConnection();
			conn.setAutoCommit(false);
			
			//시험테이블 번호를 뽑기위한 처리
			pstmt=conn.prepareStatement(sql3);
			pstmt.setInt(1, classnum);
			rs=pstmt.executeQuery();
			System.out.println("2");
			if(rs.next()){
				System.out.println("3");
				examnum=rs.getInt("examnum");
			}
			
			//출석정보 리셋을위한 학생번호 처리
			pstmt=conn.prepareStatement(sql5);
			pstmt.setInt(1, classnum);
			rs=pstmt.executeQuery();
			while(rs.next()){
				System.out.println("4");
				list.add(rs.getInt("stunum"));
			}
			
			System.out.println("5");
			for(int j=0;j<list.size();j++){
				System.out.println("6");
				//해당학생의 출석정보 리셋
				pstmt=conn.prepareStatement(sql6);
				pstmt.setInt(1, list.get(j));
				pstmt.executeUpdate();
				System.out.println("7");
				try {
					Thread.sleep(100);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
			
			//학생 강좌정보 리셋
			pstmt=conn.prepareStatement(sql);
			System.out.println("8");
			pstmt.setInt(1, classnum);
			pstmt.executeUpdate();
			
			//해당 강좌와 엮긴 시험테이블에 엮여있는 점수테이블 리셋
			pstmt=conn.prepareStatement(sql4);
			System.out.println("9");
			pstmt.setInt(1, examnum);
			pstmt.executeUpdate();
			
			//해당 강좌와 엮인 시험테이블 삭제
			pstmt=conn.prepareStatement(sql2);
			System.out.println("10");
			pstmt.setInt(1, classnum);
			pstmt.executeUpdate();
			
			//해당 강좌와 엮인 모집공고 리셋
			pstmt=conn.prepareStatement(sql7);
			System.out.println("11");
			pstmt.setInt(1, classnum);
			pstmt.executeUpdate();
			
			//해당 강좌삭제
			pstmt=conn.prepareStatement(sql1);
			pstmt.setInt(1, classnum);
			result=pstmt.executeUpdate();
			System.out.println("12");
		}catch(SQLException e){
			conn.rollback();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return result;
	}
	
	
	
	//수강생관리 리스트출력 처리부분		처리완
	public ArrayList<Object[]> studentAdminSelectAll(int page,String search,String keyword) throws SQLException{
		ArrayList<Object[]> list=null;
		Object[] obj=null;
		
		int startNum=(page-1)*5+1;
		int endNum=page*5;
		
		if(keyword!=""){
			list=new ArrayList<Object[]>();
			String sql="select * from (select rownum rn2,rn,stunum,stuname,classname,arrtime,checkpct from (select rownum rn,stunum,stuname,classname,arrtime,checkpct from (select student.stunum,stuname,classname,arrtime,checkpct from Student inner join AttendTime on Student.stunum=AttendTime.stunum inner join AttendInfo on Student.stunum=AttendInfo.stunum where "+search+" like ? order by stuname desc) order by rn desc) order by rn2 desc) where rn2>=? and rn2<=?";
			String keyword1="%"+keyword+"%";
			try{
				conn=MyOracle.getConnection();
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, keyword1);
				pstmt.setInt(2, startNum);
				pstmt.setInt(3, endNum);
				rs=pstmt.executeQuery();
				while(rs.next()){
					Home_Student_Dto bean1=new Home_Student_Dto();
					Home_AttendTime_Dto bean2=new Home_AttendTime_Dto();
					LMS_AttendInfo_Dto bean3=new LMS_AttendInfo_Dto();
					bean1.setStunum(rs.getInt("stunum"));
					bean1.setStuname(rs.getString("stuname"));
					bean1.setClassname(rs.getString("classname"));
					bean2.setArrtime(rs.getString("arrtime"));
					bean3.setCheckpct(rs.getInt("checkpct"));
					
					obj=new Object[]{bean1,bean2,bean3};
					list.add(obj);
				}
			}finally{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}
		}else if(keyword==""){
			list=new ArrayList<Object[]>();
			String sql="select * from (select rownum rn2,rn,stunum,stuname,classname,arrtime,checkpct from (select rownum rn,stunum,stuname,classname,arrtime,checkpct from (select student.stunum,stuname,classname,arrtime,checkpct from Student inner join AttendTime on Student.stunum=AttendTime.stunum inner join AttendInfo on Student.stunum=AttendInfo.stunum order by stuname desc) order by rn desc) order by rn2 desc) where rn2>=? and rn2<=?";
			try{
				conn=MyOracle.getConnection();
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startNum);
				pstmt.setInt(2, endNum);
				rs=pstmt.executeQuery();
				while(rs.next()){
					Home_Student_Dto bean1=new Home_Student_Dto();
					Home_AttendTime_Dto bean2=new Home_AttendTime_Dto();
					LMS_AttendInfo_Dto bean3=new LMS_AttendInfo_Dto();
					bean1.setStunum(rs.getInt("stunum"));
					bean1.setStuname(rs.getString("stuname"));
					bean1.setClassname(rs.getString("classname"));
					bean2.setArrtime(rs.getString("arrtime"));
					bean3.setCheckpct(rs.getInt("checkpct"));
					
					obj=new Object[]{bean1,bean2,bean3};
					list.add(obj);
				}
			}finally{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}
		}
		return list;
	}
	
	
	
	
	//수강생관리 상세페이지 처리부분		처리완
	public Object[] studentAdminSelectOne(int stunum) throws SQLException{
		String sql="select stunum,stuname,stuphone,classname,ontime,late,absent,arrtime,leavetime,checkpct from Student inner join AttendInfo on Student.stunum=AttendInfo.stunum inner join AttendTime on Student.stunum=AttendTime.stunum where Student.stunum=?";
		Object[] obj=null;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, stunum);
			rs=pstmt.executeQuery();
			if(rs.next()){
				Home_Student_Dto bean1=new Home_Student_Dto();
				Home_AttendTime_Dto bean2=new Home_AttendTime_Dto();
				LMS_AttendInfo_Dto bean3=new LMS_AttendInfo_Dto();
				bean1.setStunum(rs.getInt("stunum"));
				bean1.setStuname(rs.getString("stuname"));
				bean1.setStuphone(rs.getString("stuphone"));
				bean1.setClassname(rs.getString("classname"));
				bean3.setOntime(rs.getInt("ontime"));
				bean3.setLate(rs.getInt("late"));
				bean3.setAbsent(rs.getInt("absent"));
				bean2.setArrtime(rs.getString("arrtime"));
				bean2.setLeavetime(rs.getString("leavetime"));
				bean3.setCheckpct(rs.getInt("checkpct"));
				
				obj=new Object[]{bean1,bean2,bean3};
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return obj;
	}
	
	
	
	
	//수강생관리 삭제 처리부분
	//학생을 지우면 관련 데이터도 삭제해야함
	//student -score,attendtime,attendinfo			처리완
	public int studentAdminDelete(int stunum) throws SQLException{
		String delScore="delete from Score where stunum=?";
		String delAtttime="delete from AttendTime where stunum=?";
		String delAttinfo="delete from AttendInfo where stunum=?";
		String delstu="delete from Student where stunum=?";
		int result=0;
		try{
			conn=MyOracle.getConnection();
			conn.setAutoCommit(false);
			pstmt=conn.prepareStatement(delScore);
			pstmt.setInt(1, stunum);
			pstmt.executeUpdate();
			pstmt=conn.prepareStatement(delAtttime);
			pstmt.setInt(1, stunum);
			pstmt.executeUpdate();
			pstmt=conn.prepareStatement(delAttinfo);
			pstmt.setInt(1, stunum);
			pstmt.executeUpdate();
			pstmt=conn.prepareStatement(delstu);
			pstmt.setInt(1, stunum);
			result=pstmt.executeUpdate();
		}catch(SQLException e){
			conn.rollback();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return result;
	}
	
	
	
	//공지사항 리스트출력 처리부분		처리완
		public ArrayList<LMS_Notice_Dto> noticeSelectAll(int page) throws SQLException{
			String sql="select * from (select rownum as rn2, rn, notnum, nottitle, notauthor, notdate, cnt from (select rownum as rn, notnum, nottitle, notauthor, notdate, cnt from (select notnum, nottitle, notauthor, notdate, cnt from notice order by notnum asc) order by rn desc) order by rn2 desc) where rn2>=? and rn2<=?";
			ArrayList<LMS_Notice_Dto> list=new ArrayList<LMS_Notice_Dto>();
			int startNum=(page-1)*5+1;
			int endNum=page*5;
			try{
				conn=MyOracle.getConnection();
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startNum);
				pstmt.setInt(2, endNum);
				rs=pstmt.executeQuery();
				while(rs.next()){
					LMS_Notice_Dto bean=new LMS_Notice_Dto();
					bean.setNotnum(rs.getInt("notnum"));
					bean.setNottitle(rs.getString("nottitle"));
					bean.setNotauthor(rs.getString("notauthor"));
					bean.setNotdate(rs.getDate("notdate"));
					bean.setCnt(rs.getInt("cnt"));
					
					list.add(bean);
				}
			}finally{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}
			
			return list;
		}
		
		
		
		//공지사항 상세페이지 처리부분		처리완
		public LMS_Notice_Dto noticeSelectOne(int notnum, int notcnt) throws SQLException{
			String sql="select notnum, nottitle,notauthor,notdate,cnt,notcontent from Notice where notnum=?";
			String sql1="update notice set cnt=? where notnum=?";
			LMS_Notice_Dto bean=new LMS_Notice_Dto();
			try{
				conn=MyOracle.getConnection();
				pstmt=conn.prepareStatement(sql1);
				pstmt.setInt(1, notcnt);
				pstmt.setInt(2, notnum);
				pstmt.executeUpdate();
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, notnum);
				rs=pstmt.executeQuery();
				if(rs.next()){
					bean.setNotnum(rs.getInt("notnum"));
					bean.setNottitle(rs.getString("nottitle"));
					bean.setNotauthor(rs.getString("notauthor"));
					bean.setNotdate(rs.getDate("notdate"));
					bean.setCnt(rs.getInt("cnt"));
					bean.setNotcontent(rs.getString("notcontent"));
				}
				
			}finally{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}
			
			return bean;
		}
		
		
		
		
		//공지사항 등록 처리부분		처리완
		public void noticeInsert(String nottitle, String notcontent, String notauthor) throws SQLException{
			String sql="insert into Notice values (Notice_seq.nextval,?,?,?,sysdate,0)";
			try{
				conn=MyOracle.getConnection();
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, nottitle);
				pstmt.setString(2, notcontent);
				pstmt.setString(3, notauthor);
				pstmt.executeUpdate();
			}finally{
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}
		}
		
		
		
		//공지사항 수정 처리부분		처리완
		public int noticeUpdate(int notnum, String nottitle, String notcontent) throws SQLException{
			String sql="update Notice set nottitle=?, notcontent=? where notnum=?";
			int result=0;
			try{
				conn=MyOracle.getConnection();
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, nottitle);
				pstmt.setString(2, notcontent);
				pstmt.setInt(3, notnum);
				result=pstmt.executeUpdate();
			}finally{
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}
			return result;
		}
		
		
		
		//공지사항 삭제 처리부분		처리완
		public int noticeDelete(int notnum) throws SQLException{
			String sql="delete from Notice where notnum=?";
			try{
				conn=MyOracle.getConnection();
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, notnum);
				pstmt.executeUpdate();
			}finally{
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}
			return notnum;
		}
		
	
	
	
		//FAQ 리스트출력 처리부분		처리완
		public ArrayList<LMS_FAQ_Dto> FAQSelectAll(int page) throws SQLException{
			String sql="select * from (select rownum as rn2, rn, faqnum,faqtitle,faqauthor,faqdate from (select rownum as rn, faqnum,faqtitle,faqauthor,faqdate from (select faqnum,faqtitle,faqauthor,faqdate from faq order by faqnum asc) order by rn desc) order by rn2 desc) where rn2>=? and rn2<=?";	
			ArrayList<LMS_FAQ_Dto> list=new ArrayList<LMS_FAQ_Dto>();
			int startNum=(page-1)*5+1;
			int endNum=page*5;
			try{
				conn=MyOracle.getConnection();
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startNum);
				pstmt.setInt(2, endNum);
				rs=pstmt.executeQuery();
				while(rs.next()){
					LMS_FAQ_Dto bean=new LMS_FAQ_Dto();
					bean.setFaqnum(rs.getInt("faqnum"));
					bean.setFaqtitle(rs.getString("faqtitle"));
					bean.setFaqauthor(rs.getString("faqauthor"));
					bean.setFaqdate(rs.getDate("faqdate"));
					
					list.add(bean);
				}
			}finally{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}
			
			return list;
		}
		
		
		
			
		//FAQ 상세페이지 처리부분		처리완
		public LMS_FAQ_Dto FAQSelectOne(int faqnum) throws SQLException{
			String sql="select faqnum,faqtitle,faqauthor,faqdate,faqcontent from FAQ where faqnum=?";
			LMS_FAQ_Dto bean=new LMS_FAQ_Dto();
			try{
				conn=MyOracle.getConnection();
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, faqnum);
				rs=pstmt.executeQuery();
				if(rs.next()){
					bean.setFaqnum(rs.getInt("faqnum"));
					bean.setFaqtitle(rs.getString("faqtitle"));
					bean.setFaqauthor(rs.getString("faqauthor"));
					bean.setFaqdate(rs.getDate("faqdate"));
					bean.setFaqcontent(rs.getString("faqcontent"));
				}
			}finally{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}
			
			return bean;
		}
		
		
		
		//FAQ 등록 처리부분		처리완
		public void FAQInsert(String faqtitle, String faqcontent, String faqauthor) throws SQLException{
			String sql="insert into FAQ values (FAQ_seq.nextval,?,?,?,sysdate)";
			try{
				conn=MyOracle.getConnection();
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, faqtitle);
				pstmt.setString(2, faqcontent);
				pstmt.setString(3, faqauthor);
				pstmt.executeUpdate();
			}finally{
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}
		}
		
		
		
		//FAQ 수정 처리부분			처리완
		public int FAQUpdate(int faqnum, String faqtitle, String faqcontent) throws SQLException{
			String sql="update FAQ set faqtitle=?, faqcontent=? where faqnum=?";
			int result = 0;
			try{
				conn=MyOracle.getConnection();
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, faqtitle);
				pstmt.setString(2, faqcontent);
				pstmt.setInt(3, faqnum);
				result=pstmt.executeUpdate();
			}finally{
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}
			return result;
		}
		
		
		
		//FAQ 삭제 처리부분			처리완
		public int FAQDelete(int faqnum) throws SQLException{
			String sql="delete from FAQ where faqnum=?";
			try{
				conn=MyOracle.getConnection();
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, faqnum);
				pstmt.executeUpdate();
			}finally{
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}
			return faqnum;
		}
		
		
	
	
	
	
	
}
