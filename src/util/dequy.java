package util;

public class dequy {

	public static void main(String[] args) {
		int n = 6;
		for (int i = 1; i <= n; i++) {
			System.out.print(fuction(i) + " ");			
		}
				
	}
	
	public static int fuction(int i) {
		
		if (i == 0) return 0;
		else if (i == 1) return 1; 
		return fuction(i - 1) + fuction(i - 2);		
				
	}
}
