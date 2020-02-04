package Project_LMS_Model;

public class LMS_Score_Dto {

	//시험번호
	private int examnum;
	//학번
	private int stunum;
	//1차점수
	private int first;
	//2차점수
	private int second;
	//3차점수
	private int third;

	public LMS_Score_Dto() {
	}

	public int getExamnum() {
		return examnum;
	}

	public void setExamnum(int examnum) {
		this.examnum = examnum;
	}

	public int getStunum() {
		return stunum;
	}

	public void setStunum(int stunum) {
		this.stunum = stunum;
	}

	public int getFirst() {
		return first;
	}

	public void setFirst(int first) {
		this.first = first;
	}

	public int getSecond() {
		return second;
	}

	public void setSecond(int second) {
		this.second = second;
	}

	public int getThird() {
		return third;
	}

	public void setThird(int third) {
		this.third = third;
	}

	
	
}
