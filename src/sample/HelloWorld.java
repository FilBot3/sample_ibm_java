/**
 *
 *
*/

package sample;

class HelloWorld {
	public static void main(String[] args) {
		do{
			//System.out.println("Hello World from IBM Java");
			try {
			    Thread.sleep(2000);
			} catch(InterruptedException ex) {
			    Thread.currentThread().interrupt();
			}
		}while(true);
		
		//System.out.println("Fart.asdf");
	}
}
