package Project_LMS_Model;

import java.sql.Date;

public class LMS_Emp_Dto {

	//rownum
	private int emprn;
	//������ȣ
	private int empnum;
	//�����̸�
	private String empname;
	//�������̵�
	private String empid;
	//������й�ȣ
	private String emppw;
	//�����̸���
	private String empemail;
	//������ȭ��ȣ
	private String empphone;
	//���� �μ���
	private String dept;
	//���� �Ի���
	private Date empdate;
	//���� �ּ�
	private String empaddr;
	//�α��λ��� 1=true 2=false
	private int login;
	//���� �ֹι�ȣ
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
