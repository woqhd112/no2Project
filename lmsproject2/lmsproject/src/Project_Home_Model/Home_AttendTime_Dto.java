package Project_Home_Model;

import java.sql.Date;

public class Home_AttendTime_Dto {
	
	//�й�
	private int stunum;
	//�Խǽð�
	private String arrtime;
	//��ǽð�
	private String leavetime;
	//�⼮ó�� ��ȣ�� 1=�⼮ 2=���� 3=�Ἦ
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
