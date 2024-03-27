package controller;

import model.DatabaseStub;
import model.DatabaseStubImpl;
import model.Station;
import view.MBTAView;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import java.util.Scanner;

import javax.sound.sampled.Line;

public class DashboardController implements ActionListener {
  private MBTAView view;

  private String userName;// = "root";
  private String passwd;// = "toor";

  // database details
  private String dbServer = "localhost";
  private int portNumber = 3306;
  private String dbName = "mbta_lite";

  // Standard Input
  public Scanner scanner = null;

  // DBMS Connector handler
  public Connection connection = null;

  private boolean dbLoginSucess = false;

  private DatabaseStub model;


  private Line line;
  private Station station;

  private ArrayList<Station> route;


  public DashboardController(MBTAView view) {
    if (view == null) {
      throw new IllegalArgumentException("mainGUI cannot be null");
    }
    this.view = view;


    this.scanner = new Scanner(System.in);

  }

  public void start() throws IOException {
    //getDBLogin();
    getAutoDBLogin();
    model = new DatabaseStubImpl(connection);
    view.run(true);
    view.setListener(this);

  }


  @Override
  public void actionPerformed(ActionEvent e) {
    switchCaseHelper(e.getActionCommand());
  }


  private void switchCaseHelper(String s)  {
    switch (s) {
      case "login": {
        //throw a pop up messgae that requests login and password from user.
        String[] input = view.showLoginDialog();
        ;

        while (input[0].isBlank() || input[1].isBlank()) {
          input = view.showLoginDialog();

        }

        System.out.println("1:" + input[0]);
        System.out.println("2:" + input[1]);

        String ret = model.getAuthentication(input[0], input[1]);

        if (input[0].equals(ret)) {
          System.out.println("authenticated");
          view.showStaffDashBoard();
        } else {
          System.out.println("auth failed");
          view.displayErrorPopup("Authentication Failed",
                  "Incorrect username or password");
          break;
        }
      }
        break;
      case "guest": {
        view.showGuestDashboard();
      }
        break;
      case "select_line": {
        String ret = view.getLineInfo();
        System.out.println(ret);
      }
        break;

    }

  }

  /**
   * Get Login details from the user and store them in local variables.
   */
  private void getDBLogin() {
    System.out.println("Please enter your MY SQL user name: ");
    userName = scanner.nextLine();
    System.out.println("Password: ");
    passwd = scanner.nextLine();
    while (!dbLoginSucess) {
      dbConnect();
    }
  }

  private void getAutoDBLogin() {
    userName = "root";
    passwd = "Rajat&24748";
    while (!dbLoginSucess) {
      dbConnect();
    }
  }

  private void dbConnect() {
    try {
      this.connection = getConnection();
      System.out.println("CONNECTION SUCCESS: connected to database: " + dbName);
      dbLoginSucess = true;
    } catch (SQLException e) {
      System.out.println("CONNECTION FAILED: please check USERNAME and PASSWORD\n");
      getDBLogin();
    }

  }


  /**
   * Connect to the MySQL server using JDBC connector.
   *
   * @return connection object for the connection.
   * @throws SQLException if the connection cannot be made with MySQL server using the provided
   *                      credentials
   */
  private Connection getConnection() throws SQLException {
    //

    Connection con;
    Properties conProps = new Properties();

    conProps.put("user", userName);
    conProps.put("password", passwd);

    return DriverManager.getConnection("jdbc:mysql://"
            + this.dbServer + ":" + this.portNumber
            + "/" + this.dbName
            + "?characterEncoding=UTF-8&useSSL=false", conProps);

  }

  private void dbDisconnection() {
    try {
      if (connection != null && !connection.isClosed()) {
        connection.close();
        System.out.println("CONNECTION CLOSED SUCCESSFULLY.");

      }
    } catch (SQLException e) {
      System.out.println("CONNECTION CLOSE FAILURE: connection could not be closed");
    }
  }


}
