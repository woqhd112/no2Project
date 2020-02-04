package Project_Utils;


public class Test {
	
	public static void main(String[] args) {

		int attendpct=0;
		int checkpct=0;
		
		int ontime=10;
		int late=20;
		int absent=22;
		
		
		
//		attendpct=(ontime+late+absent)*100/90;
//		checkpct=(ontime+late)*100/(ontime+late+absent);
		
		attendpct=(int) Math.round((((double)(ontime+late+absent)/90)*100));
		checkpct=(int) Math.round((((double)(ontime+late)/(ontime+late+absent))*100));
		
		
		System.out.println("°­ÀÇ ÁøÇà·ü : "+attendpct);
		System.out.println("Ãâ¼®·ü : "+checkpct);
	}
}
