package Project_LMS_Model;

import java.sql.Date;

public class LMS_Exam_Dto {

	//rownum
	private int examrn;
	//�����ȣ
	private int examnum;
	//�����̸�
	private String examname;
	//�����
	private String teachername;
	//���� ���� 1��,2��,3��
	private String examorder;
	//�Խ���
	private Date examdate;
	//������
	private String examexp;
	//����
	private String examcontent;
	//����
	private String examfile;
	//���Ͽ�����
	private String origin;
	//���¹�ȣ
	private int classnum;
	
	
	public LMS_Exam_Dto() {
	}


	public int getExamnum() {
		return examnum;
	}


	public void setExamnum(int examnum) {
		this.examnum = examnum;
	}


	public String getExamname() {
		return examname;
	}


	public void setExamname(String examname) {
		this.examname = examname;
	}


	public String getTeachername() {
		return teachername;
	}


	public void setTeachername(String teachername) {
		this.teachername = teachername;
	}


	public String getExamorder() {
		return examorder;
	}


	public void setExamorder(String examorder) {
		this.examorder = examorder;
	}


	public Date getExpdate() {
		return examdate;
	}


	public void setExpdate(Date examdate) {
		this.examdate = examdate;
	}


	public String getExamexp() {
		return examexp;
	}


	public void setExamexp(String examexp) {
		this.examexp = examexp;
	}


	public String getExamcontent() {
		return examcontent;
	}


	public void setExamcontent(String examcontent) {
		this.examcontent = examcontent;
	}


	public int getExamrn() {
		return examrn;
	}


	public void setExamrn(int examrn) {
		this.examrn = examrn;
	}


	public Date getExamdate() {
		return examdate;
	}


	public void setExamdate(Date examdate) {
		this.examdate = examdate;
	}


	public String getExamfile() {
		return examfile;
	}


	public void setExamfile(String examfile) {
		this.examfile = examfile;
	}


	public String getOrigin() {
		return origin;
	}


	public void setOrigin(String origin) {
		this.origin = origin;
	}


	public int getClassnum() {
		return classnum;
	}


	public void setClassnum(int classnum) {
		this.classnum = classnum;
	}
	
	
}
