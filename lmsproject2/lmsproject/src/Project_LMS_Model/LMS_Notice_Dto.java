package Project_LMS_Model;

import java.sql.Date;

public class LMS_Notice_Dto {

	//rownum
	private int notrn;
	//�������� ��ȣ
	private int notnum;
	//�������� ����
	private String nottitle;
	//���� ���� ����
	private String notcontent;
	//�ۼ���
	private String notauthor;
	//�Խ���
	private Date notdate;
	//��ȸ��
	private int cnt;
	
	public LMS_Notice_Dto() {
	}

	public int getNotnum() {
		return notnum;
	}

	public void setNotnum(int notnum) {
		this.notnum = notnum;
	}

	public String getNottitle() {
		return nottitle;
	}

	public void setNottitle(String nottitle) {
		this.nottitle = nottitle;
	}

	public String getNotcontent() {
		return notcontent;
	}

	public void setNotcontent(String notcontent) {
		this.notcontent = notcontent;
	}

	public String getNotauthor() {
		return notauthor;
	}

	public void setNotauthor(String notauthor) {
		this.notauthor = notauthor;
	}

	public Date getNotdate() {
		return notdate;
	}

	public void setNotdate(Date notdate) {
		this.notdate = notdate;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getNotrn() {
		return notrn;
	}

	public void setNotrn(int notrn) {
		this.notrn = notrn;
	}
	
	
}
