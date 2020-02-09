package Project_Home_Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import Project_LMS_Model.LMS_AttendInfo_Dto;
import Project_LMS_Model.LMS_Class_Dto;
import Project_LMS_Model.LMS_Exam_Dto;
import Project_LMS_Model.LMS_FAQ_Dto;
import Project_LMS_Model.LMS_HireInfo_Dto;
import Project_LMS_Model.LMS_Notice_Dto;
import Project_LMS_Model.LMS_Regnot_Dto;
import Project_LMS_Model.LMS_Score_Dto;
import Project_Utils.MyOracle;

public class Home_Student_Dao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public Home_Student_Dao() {
	}
	
	//�л��α��� ó���κ�		ó����
	public Object[] login(String stuid, String stupw) throws SQLException{
		String sql="select count(stunum) as \"login\",max(stuid) as \"stuid\",max(stupw) as \"stupw\",max(stuname) as \"stuname\",max(stunum) as \"stunum\",max(stuphone) as \"stuphone\",max(stuaddr) as \"stuaddr\",max(teachername) as \"teachername\",max(classname) as \"classname\" from Student where stuid=? and stupw=?";
		Home_Student_Dto bean1=new Home_Student_Dto();
		Home_AttendTime_Dto bean2=new Home_AttendTime_Dto();
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, stuid);
			pstmt.setString(2, stupw);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean1.setLogin(rs.getInt("login"));
				bean1.setStuid(rs.getString("stuid"));
				bean1.setStupw(rs.getString("stupw"));
				bean1.setStuname(rs.getString("stuname"));
				bean1.setStunum(rs.getInt("stunum"));
				bean1.setStuphone(rs.getString("stuphone"));
				bean1.setStuaddr(rs.getString("stuaddr"));
				bean1.setTeachername(rs.getString("teachername"));
				bean1.setClassname(rs.getString("classname"));
			}
			String sql1="select * from attendtime where stunum=?";
			pstmt=conn.prepareStatement(sql1);
			pstmt.setInt(1, bean1.getStunum());
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean2.setStunum(rs.getInt("stunum"));
				bean2.setArrtime(rs.getString("arrtime"));
				bean2.setLeavetime(rs.getString("leavetime"));
				bean2.setAttendstat(rs.getInt("attendstat"));
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		Object[] obj=new Object[]{bean1,bean2};
		return obj;
	}
	
	   //�л� ���̵� ã��
	   public String checkid(String stuname, String stuphone) throws SQLException{
	      String sql="select stuid from student where stuname=? and stuphone=?";
	      String bean=null;
	      try{
	         conn=MyOracle.getConnection();
	         pstmt=conn.prepareStatement(sql);
	         pstmt.setString(1, stuname);
	         pstmt.setString(2, stuphone);
	         rs=pstmt.executeQuery();
	         if(rs.next()){
	            bean=rs.getString("stuid");
	         }
	      }finally{
	         if(rs!=null)rs.close();
	         if(pstmt!=null)pstmt.close();
	         if(conn!=null)conn.close();
	      }
	      return bean;
	   }
	
	   
	 //�л� ��й�ȣ ã��
		public String checkpw(String stuid, String stuphone) throws SQLException{
			String sql="select stupw from student where stuid=? and stuphone=?";
			String bean=null;
			try{
				conn=MyOracle.getConnection();
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, stuid);
				pstmt.setString(2, stuphone);
				rs=pstmt.executeQuery();
				if(rs.next()){
					bean=rs.getString("stupw");
				}
			}finally{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}
			return bean;
		}
	//ȸ������ ���̵� �ߺ�üũ ó���κ�			ó����  result=1�̸� �ߺ� 0�̸� �ߺ�x
	public int memberDuplicate(String stuid) throws SQLException{
		String sql="select count(stunum) as \"duplicate\" from Student where stuid=?";
		int result=0;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, stuid);
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
	
	
	//ȸ������ ���� ��� ó���κ�	ó����
	public int memberInsert(String stuid, String stupw, String stuname, String stuphone, String stuaddr) throws SQLException{
		String sql="insert into Student values (student_seq.nextval, ?,?,?,?,?,'�̹���','�̹���',1,1)";
		String sql1="insert into AttendInfo values (student_seq.currval,0,0,0,0,0)";
		String sql2="insert into score values (1,student_seq.currval,0,0,0)";
		String sql3="insert into AttendTime values (student_seq.currval,'','',3)";
		int result=0;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, stuid);
			pstmt.setString(2, stuname);
			pstmt.setString(3, stupw);
			pstmt.setString(4, stuphone);
			pstmt.setString(5, stuaddr);
			result=pstmt.executeUpdate();
			pstmt=conn.prepareStatement(sql1);
			pstmt.executeUpdate();
			pstmt=conn.prepareStatement(sql2);
			pstmt.executeUpdate();
			pstmt=conn.prepareStatement(sql3);
			pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return result;
	}
	
	
	//�л����� ���� ��� ó���κ�	ó����
	public int inforUpdate(int stunum,String stupw, String stuphone, String stuaddr) throws SQLException{
		String sql="update Student set stupw=?, stuphone=?, stuaddr=? where stunum=?";
		int result=0;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, stupw);
			pstmt.setString(2, stuphone);
			pstmt.setString(3, stuaddr);
			pstmt.setInt(4, stunum);
			result=pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return result;
	}
	
	
	
	//�л����� ��� ó���κ�	ó����
		public Home_Student_Dto inforSelectOne(int stunum) throws SQLException{
			String sql="select stuid,stuname,stupw,stuphone,stuaddr from Student where stunum=?";
			Home_Student_Dto bean=new Home_Student_Dto();
			try{
				conn=MyOracle.getConnection();
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, stunum);
				rs=pstmt.executeQuery();
				if(rs.next()){
					bean.setStuid(rs.getString("stuid"));
					bean.setStuname(rs.getString("stuname"));
					bean.setStupw(rs.getString("stupw"));
					bean.setStuphone(rs.getString("stuphone"));
					bean.setStuaddr(rs.getString("stuaddr"));
				}
			}finally{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}
			
			return bean;
		}
		
		
		
		
	
	//�������� ����Ʈ ��� ó���κ�		ó����
	public ArrayList<Object[]> regnotSelectAll(int page) throws SQLException{
		String sql="select * from (select rownum rn2,rn,regnum,regauthor,regdate,regcnt,classname from (select rownum rn,regnum,regauthor,regdate,regcnt,classname from (select regnum,regauthor,regdate,regcnt,classname from Regnot inner join Class on Regnot.classnum=Class.classnum order by regnum asc) order by rn desc) order by rn2 desc) where rn2>=? and rn2<=?";
		ArrayList<Object[]> list=new ArrayList<Object[]>();
		
		int startNum=(page-1)*5+1;
		int endNum=page*5;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs=pstmt.executeQuery();
			while(rs.next()){
				if(!rs.getString("classname").equals("�̹���")){
					LMS_Class_Dto bean1=new LMS_Class_Dto();
					LMS_Regnot_Dto bean2=new LMS_Regnot_Dto();
					bean2.setRegrn(rs.getInt("rn"));
					bean2.setRegnum(rs.getInt("regnum"));
					bean2.setRegauthor(rs.getString("regauthor"));
					bean2.setRegdate(rs.getDate("regdate"));
					bean2.setRegcnt(rs.getInt("regcnt"));
					bean1.setClassname(rs.getString("classname"));
					
					Object[] obj={bean1,bean2};
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
	
	
	//�������� �������� ��� ó���κ�		ó����
	public Object[] regnotSelectOne(int regnum,int regcnt) throws SQLException{
		String sql="select regcontent,regauthor,regdate,regcnt,classname,startdate,enddate,regfile,origin from Regnot inner join Class on Regnot.classnum=Class.classnum where Regnot.regnum=?";
		String sql1="update Regnot set regcnt=? where regnum=?";
		Object[] obj=null;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql1);
			pstmt.setInt(1, regcnt);
			pstmt.setInt(2, regnum);
			pstmt.executeUpdate();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, regnum);
			rs=pstmt.executeQuery();
			if(rs.next()){
				LMS_Regnot_Dto bean1=new LMS_Regnot_Dto();
				LMS_Class_Dto bean2=new LMS_Class_Dto();
				bean1.setRegcontent(rs.getString("regcontent"));
				bean1.setRegauthor(rs.getString("regauthor"));
				bean1.setRegdate(rs.getDate("regdate"));
				bean1.setRegcnt(rs.getInt("regcnt"));
				bean2.setClassname(rs.getString("classname"));
				bean2.setStartdate(rs.getString("startdate"));
				bean2.setEnddate(rs.getString("enddate"));
				bean1.setRegfile(rs.getString("regfile"));
				bean1.setOrigin(rs.getString("origin"));

				obj=new Object[]{bean1,bean2};
			}
		}finally{
			
		}
	
		return obj;
	}
	
	
	//�л� �⼮���� ���
	public Home_AttendTime_Dto checkSelectOne(int stunum) throws SQLException{
		String sql="select * from AttendTime where stunum=?";
		Home_AttendTime_Dto bean=new Home_AttendTime_Dto();

		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, stunum);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setStunum(rs.getInt("stunum"));
				bean.setArrtime(rs.getString("arrtime"));
				bean.setLeavetime(rs.getString("leavetime"));
				bean.setAttendstat(rs.getInt("attendstat"));
			}
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return bean;
	}
	
	
	
	//�������ʿ��� insert�۾��� �ؾ��� �Ϸ�Ǹ� ����κ��� update�� ����
	//�л� �⼮üũ �Խ� ó���κ�		ó����  �ѹ��� ����  attendstat�� controller �κп��� date��ü�� �ð��̾Ƽ� substr���� ©�� ���ǹ�����ó���ؼ� �� �޼ҵ忡 ���ڰ� �ֱ�
	public Home_AttendTime_Dto checkInsertArrive(int stunum,String date,int attendstat) throws SQLException{
		String sql="update AttendTime set arrtime=?,attendstat=? where stunum=?";
		String sql1="select * from AttendTime where stunum=?";
		Home_AttendTime_Dto bean=new Home_AttendTime_Dto();
		System.out.println("�Խǽð� : "+date);
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setInt(2, attendstat);
			pstmt.setInt(3, stunum);
			pstmt.executeUpdate();
			
			pstmt=conn.prepareStatement(sql1);
			pstmt.setInt(1, stunum);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setStunum(rs.getInt("stunum"));
				bean.setArrtime(rs.getString("arrtime"));
				bean.setLeavetime(rs.getString("leavetime"));
				bean.setAttendstat(rs.getInt("attendstat"));
			}
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return bean;
	}
	
	//�л� �⼮üũ ��� ó���κ�		ó����  controller �κп��� time���� dataformat �������� �޾ƿ�
	public Home_AttendTime_Dto checkInsertLeave(int stunum, String date) throws SQLException{
		String sql="update AttendTime set leavetime=? where stunum=?";
		String sql1="select * from AttendTime where stunum=?";
		Home_AttendTime_Dto bean=new Home_AttendTime_Dto();
		System.out.println("��ǽð� : "+date);
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setInt(2, stunum);
			pstmt.executeUpdate();
			
			pstmt=conn.prepareStatement(sql1);
			pstmt.setInt(1, stunum);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setStunum(rs.getInt("stunum"));
				bean.setArrtime(rs.getString("arrtime"));
				bean.setLeavetime(rs.getString("leavetime"));
				bean.setAttendstat(rs.getInt("attendstat"));
			}
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return bean;
	}
	
	//�������� ��� ó���κ�		ó����
	public Object[] subInforSelectOne(int stunum) throws SQLException{
		String sql="select classname,ontime,late,absent,attendpct,checkpct from Student inner join AttendInfo on student.stunum=AttendInfo.stunum where Student.stunum=?";
		Object[] obj=null;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, stunum);
			rs=pstmt.executeQuery();
			if(rs.next()){
				Home_Student_Dto bean1=new Home_Student_Dto();
				LMS_AttendInfo_Dto bean2=new LMS_AttendInfo_Dto();
				bean1.setClassname(rs.getString("classname"));
				bean2.setOntime(rs.getInt("ontime"));
				bean2.setLate(rs.getInt("late"));
				bean2.setAbsent(rs.getInt("absent"));
				bean2.setAttendpct(rs.getInt("attendpct"));
				bean2.setCheckpct(rs.getInt("checkpct"));
				obj=new Object[]{bean1,bean2};
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return obj;
	}
	
	//������ȸ ��� ó���κ�	ó����
	public Object[] examViewSelectOne(int stunum,String teachername) throws SQLException{
		String sql="select * from (select stunum,classname,examname,Student.teachername,examdate,examexp,examcontent,examfile,origin from Exam inner join Student on Student.teachername=Exam.teachername where Student.teachername=?) where stunum=?";
		LMS_Exam_Dto bean1=new LMS_Exam_Dto();
		Home_Student_Dto bean2=new Home_Student_Dto();
		Object[] obj=null;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, teachername);
			pstmt.setInt(2, stunum);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean2.setStunum(rs.getInt("stunum"));
				bean2.setClassname(rs.getString("classname"));
				bean1.setExamname(rs.getString("examname"));
				bean2.setTeachername(rs.getString("teachername"));
				bean1.setExpdate(rs.getDate("examdate"));
				bean1.setExamexp(rs.getString("examexp"));
				bean1.setExamcontent(rs.getString("examcontent"));
				bean1.setExamfile(rs.getString("examfile"));
				bean1.setOrigin(rs.getString("origin"));
				
				obj=new Object[]{bean1,bean2};
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return obj;
	}
	
	
	
	//�������� ��� ó���κ�		ó����
	public Object[] gradeOpenSelectOne(int stunum) throws SQLException{
		String sql="select classname,teachername,first,second,third from Student inner join Score on Student.stunum=Score.stunum where Student.stunum=?";
		Object[] obj=null;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, stunum);
			rs=pstmt.executeQuery();
			if(rs.next()){
				LMS_Score_Dto bean1=new LMS_Score_Dto();
				Home_Student_Dto bean2=new Home_Student_Dto();
				bean2.setClassname(rs.getString("classname"));
				bean2.setTeachername(rs.getString("teachername"));
				bean1.setFirst(rs.getInt("first"));
				bean1.setSecond(rs.getInt("second"));
				bean1.setThird(rs.getInt("third"));
				
				obj=new Object[]{bean1,bean2};
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return obj;
	}
	
	
	//ä������ ����Ʈ ��� ó���κ�		ó����
	public ArrayList<LMS_HireInfo_Dto> employSelectAll(int page) throws SQLException{
		String sql="select * from (select rownum as rn2,rn,infonum,infotitle,cmpexp,infocnt from (select rownum as rn,infonum,infotitle,cmpexp,infocnt from (select infonum,infotitle,cmpexp,infocnt from HireInfo order by infonum asc) order by rn desc) order by rn2 desc) where rn2>=? and rn2<=?";
		ArrayList<LMS_HireInfo_Dto> list=new ArrayList<LMS_HireInfo_Dto>();
		int startNum=(page-1)*10+1;
		int endNum=page*10;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs=pstmt.executeQuery();
			while(rs.next()){
				LMS_HireInfo_Dto bean=new LMS_HireInfo_Dto();
				bean.setInforn(rs.getInt("rn"));
				bean.setInfonum(rs.getInt("infonum"));
				bean.setInfotitle(rs.getString("infotitle"));
				bean.setCmpexp(rs.getString("cmpexp"));
				bean.setInfocnt(rs.getInt("infocnt"));
				
				list.add(bean);
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return list;
	}
	
	
	
	//ä������ �������� ��� ó���κ�		ó����
	public LMS_HireInfo_Dto employSelectOne(int infonum,int infocnt) throws SQLException{
		String sql="select infotitle,infoauthor,infodate,infocnt,cmpname,cmpexp,cmplink from HireInfo where infonum=?";
		String sql1="update hireinfo set infocnt=? where infonum=?";
		LMS_HireInfo_Dto bean=new LMS_HireInfo_Dto();
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql1);
			pstmt.setInt(1, infocnt);
			pstmt.setInt(2, infonum);
			pstmt.executeUpdate();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, infonum);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setInfotitle(rs.getString("infotitle"));
				bean.setInfoauthor(rs.getString("infoauthor"));
				bean.setInfodate(rs.getDate("infodate"));
				bean.setInfocnt(rs.getInt("infocnt"));
				bean.setCmpname(rs.getString("cmpname"));
				bean.setCmpexp(rs.getString("cmpexp"));
				bean.setCmplink(rs.getString("cmplink"));
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return bean;
	}
	
	
	//�������� ����Ʈ ��� ó���κ�		ó����
	public ArrayList<LMS_Notice_Dto> noticeSelectAll(String search,String keyword,int page) throws SQLException{
		ArrayList<LMS_Notice_Dto> list=null;
		conn=MyOracle.getConnection();
		int startNum=(page-1)*10+1;
		int endNum=page*10;
		if(keyword==""){
			try{
				list=new ArrayList<LMS_Notice_Dto>();
				//������ ���� ������
				String sql="select * from (select rownum as rn2,rn,notnum,nottitle,notauthor,notdate,cnt from (select rownum as rn,notnum,nottitle,notauthor,notdate,cnt from (select notnum,nottitle,notauthor,notdate,cnt from notice order by notnum asc) order by rn desc) order by rn2 desc) where rn2>=? and rn2<=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startNum);
				pstmt.setInt(2, endNum);
				rs=pstmt.executeQuery();
				while(rs.next()){
					LMS_Notice_Dto bean=new LMS_Notice_Dto();
					bean.setNotrn(rs.getInt("rn"));
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
		}else if(keyword!=""){
			list=new ArrayList<LMS_Notice_Dto>();
			System.out.println("dao�� search,keyword : "+search+","+keyword);
			try{
				String sql="select * from (select rownum as rn2,rn,notnum,nottitle,notauthor,notdate,cnt from (select rownum as rn,notnum,nottitle,notauthor,notdate,cnt from (select notnum,nottitle,notauthor,notdate,cnt from notice where "+search+" like ? order by notnum asc) order by rn desc) order by rn2 desc) where rn2>=? and rn2<=?";
				String keyword1="%"+keyword+"%";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, keyword1);
				pstmt.setInt(2, startNum);
				pstmt.setInt(3, endNum);
				rs=pstmt.executeQuery();
				while(rs.next()){
					LMS_Notice_Dto bean=new LMS_Notice_Dto();
					bean.setNotrn(rs.getInt("rn"));
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
		}
		return list;
	}
	
	
	
	//�������� �������� ��� ó���κ�		ó����
	public LMS_Notice_Dto noticeSelectOne(int notnum, int notcnt) throws SQLException{
		String sql="select nottitle,notauthor,notdate,cnt,notcontent from Notice where notnum=?";
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
	
	
	
	//FAQ ����Ʈ��� ó���κ�		ó����
	public ArrayList<LMS_FAQ_Dto> FAQSelectAll(int page) throws SQLException{
		String sql="select * from (select rownum rn2,rn,faqtitle,faqauthor,faqdate,faqcontent from (select rownum rn,faqtitle,faqauthor,faqdate,faqcontent from (select faqtitle,faqauthor,faqdate,faqcontent from FAQ order by faqnum asc) order by rn desc) order by rn2 desc) where rn2>=? and rn2<=?";
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
				bean.setFaqtitle(rs.getString("faqtitle"));
				bean.setFaqauthor(rs.getString("faqauthor"));
				bean.setFaqdate(rs.getDate("faqdate"));
				bean.setFaqcontent(rs.getString("faqcontent"));
				
				list.add(bean);
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return list;
	}
	
	
	
	
}
