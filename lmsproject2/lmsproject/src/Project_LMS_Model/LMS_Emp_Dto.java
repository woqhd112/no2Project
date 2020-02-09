package Project_LMS_Model;

import java.sql.Date;

public class LMS_Emp_Dto {

	//rownum
	private int emprn;
	//직원번호
	private int empnum;
	//직원이름
	private String empname;
	//직원아이디
	private String empid;
	//직원비밀번호
	private String emppw;
	//직원이메일
	private String empemail;
	//직원전화번호
	private String empphone;
	//직원 부서명
	private String dept;
	//직원 입사일
	private Date empdate;
	//직원 주소
	private String empaddr;
	//로그인상태 1=true 2=false
	private int login;
	//직원 주민번호
	private String empidnum;
	
	public LMS_Emp_Dto() {
	}

	public int getEmpnum() {
		return empnum;
	}

	public void setEmpnum(int empnum) {
		this.empnum = empnum;
	}

	public String getEmpname() {
		return empname;
	}

	public void setEmpname(String empname) {
		this.empname = empname;
	}

	public String getEmpid() {
		return empid;
	}

	public void setEmpid(String empid) {
		this.empid = empid;
	}

	public String getEmppw() {
		return emppw;
	}

	public void setEmppw(String emppw) {
		this.emppw = emppw;
	}

	public String getEmpemail() {
		return empemail;
	}

	public void setEmpemail(String empemail) {
		this.empemail = empemail;
	}

	public String getEmpphone() {
		return empphone;
	}

	public void setEmpphone(String empphone) {
		this.empphone = empphone;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public Date getEmpdate() {
		return empdate;
	}

	public void setEmpdate(Date empdate) {
		this.empdate = empdate;
	}

	public int getLogin() {
		return login;
	}

	public void setLogin(int login) {
		this.login = login;
	}

	public String getEmpaddr() {
		return empaddr;
	}

	public void setEmpaddr(String empaddr) {
		this.empaddr = empaddr;
	}

	public String getEmpidnum() {
		return empidnum;
	}

	public void setEmpidnum(String empidnum) {
		this.empidnum = empidnum;
	}

	public int getEmprn() {
		return emprn;
	}

	public void setEmprn(int emprn) {
		this.emprn = emprn;
	}
	
	
	
	
	
}
