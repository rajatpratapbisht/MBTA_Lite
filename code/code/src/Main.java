import java.io.IOException;

import controller.Application;
import controller.DashboardController;
import view.MBTAView;

public class Main {

  public static void main(String[] args) throws IOException {
    // MBTAView view = new MBTAView();
    //DashboardController controller = new DashboardController(view);
    Application controller = new Application();
    try {
      controller.start();
    }
    catch (IOException e) {
      throw new RuntimeException(e);
    }
  }
}
