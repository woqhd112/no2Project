package Project_LMS_Model;

import java.sql.Date;

public class LMS_Regnot_Dto {

	//rownum
	private int regrn;
	//�������� ��ȣ
	private int regnum;
	//�ۼ���
	private String regauthor;
	//�Խ���
	private Date regdate;
	//��ȸ��
	private int regcnt;
	//���¹�ȣ
	private int classnum;
	//�������� ����
	private String regcontent;
	//����
	private String regfile;
	//���ϸ����
	private String origin;
	
	public LMS_Regnot_Dto() {
	}

	public int getRegnum() {
		return regnum;
	}

	public void setRegnum(int regnum) {
		this.regnum = regnum;
	}

	public String getRegauthor() {
		return regauthor;
	}

	public void setRegauthor(String regauthor) {
		this.regauthor = regauthor;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getRegcnt() {
		return regcnt;
	}

	public void setRegcnt(int regcnt) {
		this.regcnt = regcnt;
	}

	public int getClassnum() {
		return classnum;
	}

	public void setClassnum(int classnum) {
		this.classnum = classnum;
	}

	public String getRegcontent() {
		return regcontent;
	}

	public void setRegcontent(String regcontent) {
		this.regcontent = regcontent;
	}

	public int getRegrn() {
		return regrn;
	}

	public void setRegrn(int regrn) {
		this.regrn = regrn;
	}

	public String getRegfile() {
		return regfile;
	}

	public void setRegfile(String regfile) {
		this.regfile = regfile;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}
	
	
	
}
