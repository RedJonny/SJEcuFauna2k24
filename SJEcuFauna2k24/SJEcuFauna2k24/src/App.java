import SJUserInterface.SJForm.SJLogin;
import SJUserInterface.SJForm.SJSplashScreen;

public class App {
    public static void main(String[] args) throws Exception {
        System.out.println("Hello, World!");

        SJSplashScreen.show();
        SJLogin sjL = new SJLogin();
        sjL.setVisible(true);

        
    }
}
