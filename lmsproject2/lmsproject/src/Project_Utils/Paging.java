package Project_Utils;

//����������
public class Paging {

	//���� ������
	private int page=1;	
	//��ü �Խñۼ�
	private int totalCount;
	//��� ����
	private int beginPage;
	//��� ��
	private int endPage;
	//�� �������� row����
	private int displayRow=10;
	//���������� ���̴� �ƽ� ����������
	private int displayPage=10;
	//prev ��ư Ȱ��ȭ
	boolean prev;
	//next ��ư Ȱ��ȭ
	boolean next;
	
	private int displayRow2=5;
	
	public Paging() {
	}
	
	public void setTotalCount(int totalCount){
		
		this.totalCount=totalCount;
		paging();
	}
	
	public void setTotalCount2(int totalCount){
		
		this.totalCount=totalCount;
		paging2();
	}

	private void paging(){
		int totalPage=totalCount/displayRow;
		
		//�ƽ������� ���� ����
		System.out.println("���������� ���� : "+(totalCount%displayRow!=0));
		if(totalCount%displayRow!=0){
			totalPage+=1;
		}
		//prev,next,beginPage,endPage�� ���
		endPage = ((page+(displayPage-1))/displayPage)*displayPage;
		beginPage = endPage - (displayPage-1);
		
		if(totalPage<endPage){
			endPage=totalPage;
			next=false;
		}else{
			next=true;
		}
		if(beginPage==1){
			prev=false;
		}else{
			prev=true;
		}
		//prev=(beginPage==1)?false:true;
	}
	
	private void paging2(){
		int totalPage=totalCount/displayRow2;
		
		//�ƽ������� ���� ����
		System.out.println("���������� ���� : "+(totalCount%displayRow2!=0));
		if(totalCount%displayRow2!=0){
			totalPage+=1;
		}
		//prev,next,beginPage,endPage�� ���
		endPage = ((page+(displayPage-1))/displayPage)*displayPage;
		beginPage = endPage - (displayPage-1);
		
		if(totalPage<endPage){
			endPage=totalPage;
			next=false;
		}else{
			next=true;
		}
		if(beginPage==1){
			prev=false;
		}else{
			prev=true;
		}
		//prev=(beginPage==1)?false:true;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getDisplayRow() {
		return displayRow;
	}

	public void setDisplayRow(int displayRow) {
		this.displayRow = displayRow;
	}

	public int getDisplayPage() {
		return displayPage;
	}

	public void setDisplayPage(int displayPage) {
		this.displayPage = displayPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotalCount() {
		return totalCount;
	}
	
	
}
