package Project_Home_Model;

import java.sql.Date;

public class Home_AttendTime_Dto {
	
	//학번
	private int stunum;
	//입실시간
	private String arrtime;
	//퇴실시간
	private String leavetime;
	//출석처리 번호로 1=출석 2=지각 3=결석
	private int attendstat;
	
	public Home_AttendTime_Dto() {
	}
	public int getStunum() {
		return stunum;
	}
	public void setStunum(int stunum) {
		this.stunum = stunum;
	}
	public String getArrtime() {
		return arrtime;
	}
	public void setArrtime(String arrtime) {
		this.arrtime = arrtime;
	}
	public String getLeavetime() {
		return leavetime;
	}
	public void setLeavetime(String leavetime) {
		this.leavetime = leavetime;
	}
	public int getAttendstat() {
		return attendstat;
	}
	public void setAttendstat(int attendstat) {
		this.attendstat = attendstat;
	}
	
	
	
	
}
