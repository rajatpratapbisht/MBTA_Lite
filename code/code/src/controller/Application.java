package controller;

import java.awt.event.ActionEvent;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import java.util.Scanner;

import javax.sound.sampled.Line;

import model.DatabaseStub;
import model.DatabaseStubImpl;
import model.Manager;
import model.Station;
import model.TrainLines;
import model.*;
import view.MBTAView;

public class Application {


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


  private ArrayList<TrainLines> allTrainLines = new ArrayList<>();
  private ArrayList<Station> pathRequested = new ArrayList<>();

  private TrainLines trainLine;

  private Manager manager;

  private Train train;

  private Station station;

  private ArrayList<Station> route;


  public Application() {

    this.scanner = new Scanner(System.in);

  }

  public void start() throws IOException {
    getDBLogin();
    //getAutoDBLogin();
    model = new DatabaseStubImpl(connection);
    displayWelcomePage();
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


  private void displayWelcomePage() {
    int choice;
    manager = new Manager("", "", "", "");

    System.out.println("###################");
    System.out.println("MBTA APPLICATION");
    System.out.println("WELCOME");
    System.out.println("###################");

    System.out.println("1. Guest Mode");
    System.out.println("2. Login");
    System.out.println("3. Register");
    System.out.println("4. Exit");

    choice = scanner.nextInt();
    scanner.nextLine();
    switch (choice) {
      case 1:
        displayGuestPage();

        break;
      case 2:
        displayLoginPage(true);
        break;
      case 3:
        displayRegisterPage();
        break;
      case 4:
        System.exit(0);
        return;

      default:
        displayWelcomePage();
    }

  }

  private void displayGuestPage() {
    int choice;
    System.out.println("###################");
    System.out.println("Guest Mode:\n");
    System.out.println("###################");

    System.out.println("1. Show Lines");
    System.out.println("2. Get Path On a line");
    System.out.println("3. get path between two stations on same line");
    System.out.println("4. Back");
    choice = scanner.nextInt();
    scanner.nextLine();

    switch (choice) {
      case 1: {
        allTrainLines = model.getAllLines();
        for (TrainLines tl : allTrainLines) {
          System.out.println("----------------------------------------");
          tl.printLineInfo();
          System.out.println("----------------------------------------\n");
        }
      }

      break;
      case 2: {
        System.out.println("Enter name of the line");
        String l_name = scanner.nextLine();

        pathRequested = model.getPathByLine(l_name);
        System.out.println("----------------------------------------");
        for (Station st : pathRequested) {

          st.printStationInformation();
          System.out.println("-----------------|--------------------");
          System.out.println("-----------------V---------------------");

        }
      }
      break;
      case 3: {
        System.out.println("Enter name of Start Station");
        String st_a = scanner.nextLine();
        System.out.println("Enter name of End Station");
        String st_b = scanner.nextLine();

        pathRequested = model.getPathSameLine(st_a, st_b);
        for (Station st : pathRequested) {

          st.printStationInformation();
          System.out.println("-----------------|--------------------");
          System.out.println("-----------------V---------------------");

        }

      }
      break;
      case 4:
        displayWelcomePage();
        break;
      default:
        displayGuestPage();
    }

    displayGuestPage();

  }

  private void displayLoginPage(boolean b) {
    int choice;

    if (b) {
      System.out.println("###################");
      System.out.println("LOGIN:");
      System.out.println("###################");
      System.out.println("USERNAME:");
      String u_name = scanner.nextLine();
      System.out.println("Password:");
      String passwd = scanner.nextLine();
      String ret = model.getAuthentication(u_name, passwd);
      if (!ret.equals(u_name)) {
        System.out.println("Invalid Username and Password");
        System.out.println("-----------------------------\n");
        displayWelcomePage();
      }
      manager = model.getManagerInfo(u_name);
    }


    System.out.println("###################");
    System.out.println("STAFF PORTAL:");
    System.out.println("###################");

    System.out.println("1. LookUp Information");
    System.out.println("2. WorkDesk");
    System.out.println("3. Logout");
    choice = scanner.nextInt();
    scanner.nextLine();

    switch (choice) {
      case 1:
        lookUpInformation();
        break;
      case 2:
        workDesk();
        break;
      case 3:
        displayWelcomePage();
      default:
        displayWelcomePage();
    }
    displayLoginPage(false);
  }

  private void lookUpInformation() {
    System.out.println("###################");
    System.out.println("STAFF PORTAL: Look UP PAGE");
    System.out.println("###################");

    System.out.println("404: still working on it");
    scanner.nextLine();
    displayLoginPage(false);
  }

  private void workDesk() {
    int choice;
    String u_name = manager.getUserName();
    System.out.println("###################");
    System.out.println("WORKDESK:");
    System.out.println("###################");

    System.out.println("1. Line");
    System.out.println("2. Station");
    System.out.println("3. Train");
    System.out.println("4. Back");
    choice = scanner.nextInt();
    scanner.nextLine();
    switch (choice) {
      case 1:
        linesPage();
        break;
      case 2:
        stationsPage();
        break;
      case 3:
        trainPage();
        break;
      case 4:
        displayLoginPage(false);
      default:
        workDesk();
    }

  }

  private void linesPage() {
    int choice;
    System.out.println("###################");
    System.out.println("WORKDESK: Lines Page");
    System.out.println("###################");


    System.out.println("1. Add new Line");
    System.out.println("2. Get Line Information");
    System.out.println("3. Update Line Name");
    System.out.println("4. Delete Line");
    System.out.println("5. Back");
    choice = scanner.nextInt();
    scanner.nextLine();
    switch (choice) {
      case 1: {
        System.out.println("name: ");
        String name = scanner.nextLine();
        System.out.println("color: ");
        String color = scanner.nextLine();
        System.out.println("Start station: ");
        String s_stn = scanner.nextLine();
        System.out.println("End Station: ");
        String e_stn = scanner.nextLine();
        System.out.println("Line type: ");
        String l_type = scanner.nextLine();


        trainLine = new TrainLines(name, color, s_stn, e_stn, l_type, 0);
        model.addNewLine(trainLine);
      }
      break;
      case 2: {
        System.out.println("Enter line name: ");
        String name = scanner.nextLine();
        trainLine = model.getLineInfo(name);
        trainLine.printLineInfo();
      }
      break;
      case 3: {
        System.out.println("Enter line name: ");
        String name = scanner.nextLine();
        System.out.println("Enter new name: ");
        String newName = scanner.nextLine();
        model.updateLineName(name, newName);

        System.out.println("Updated information: ");
        model.getLineInfo(newName).printLineInfo();
      }
      break;
      case 4: {
        System.out.println("Enter line name to delete: ");
        String name = scanner.nextLine();
        model.deleteLine(name);
      }
      break;
      case 5:
        workDesk();
        break;
      default:
        linesPage();

    }
    linesPage();

  }

  private void stationsPage() {

    int choice;
    System.out.println("###################");
    System.out.println("WORKDESK: Stations Page");
    System.out.println("###################");


    System.out.println("1. Add new Station");
    System.out.println("2. Get Station Information");
    System.out.println("3. get All Stations on line");
    System.out.println("4. Update Station Name");
    System.out.println("5. Update Station connectivity");
    System.out.println("6. Delete Station");
    System.out.println("7. Back");
    choice = scanner.nextInt();
    scanner.nextLine();
    switch (choice) {
      case 1: {
        System.out.println("name: ");
        String name = scanner.nextLine();
        System.out.println("latitude: ");
        double lat = scanner.nextDouble();
        scanner.nextLine();
        System.out.println("longitude: ");
        double log = scanner.nextDouble();
        scanner.nextLine();


        station = new Station(name, lat, log, "");

        model.addNewStation(station);

        System.out.println("Enter line name of this station : ");
        String l_name = scanner.nextLine();

        model.addStationToLines(l_name, name);

      }
      break;
      case 2: {
        System.out.println("Enter station name: ");
        String name = scanner.nextLine();
        station = model.getStationInfo(name);
        station.printStationInformation();
      }
      break;
      case 3: {
        System.out.println("Enter line name: ");
        String name = scanner.nextLine();
        pathRequested = model.getPathByLine(name);
        for (Station st : pathRequested) {
          st.printStationInformation();
          System.out.println();
        }

      }
      break;
      case 4: {
        System.out.println("Enter station name : ");
        String name = scanner.nextLine();
        System.out.println("Enter new name: ");
        String newName = scanner.nextLine();

        model.updateStationName(newName, name);
      }
      break;
      case 5: {
        System.out.println("Enter new station name : ");
        String Name = scanner.nextLine();
        System.out.println("Enter new station name : ");
        String pName = scanner.nextLine();
        System.out.println("Enter new station name : ");
        String nName = scanner.nextLine();
        System.out.println("Enter line  name : ");
        String l_name = scanner.nextLine();
        model.updateConnectivity(Name, pName, nName, l_name);
      }
      break;
      case 6: {
        System.out.println("Enter station name  to delete: ");
        String nName = scanner.nextLine();
        model.deleteStation(nName);
      }
      break;
      case 7:
        workDesk();
        break;

      default:
        stationsPage();

    }
    stationsPage();

  }

  private void trainPage() {

    int choice;
    System.out.println("###################");
    System.out.println("WORKDESK: Train Page");
    System.out.println("###################");


    System.out.println("1. Add new Train");
    System.out.println("2. get train Info by line");
    System.out.println("3. Sort trains by line and last service date");
    System.out.println("4. update train service");
    System.out.println("5. delete train ");
    System.out.println("7. Back");
    choice = scanner.nextInt();
    scanner.nextLine();
    switch (choice) {
      case 1: {
        System.out.println("number of cars: ");
        int num_cars = scanner.nextInt();
        scanner.nextLine();
        System.out.println("line name: ");
        String l_name = scanner.nextLine();
        model.addNewTrain(num_cars, l_name);

      }
      break;
      case 2: {
        System.out.println("Enter line name: ");
        String l_name = scanner.nextLine();
        ArrayList<Train> tlist = model.getTrainInfoByLine(l_name);
        for (Train t : tlist) {
          System.out.println("id: " + t.getId());
          System.out.println("num cars: " + t.getNumCars());
          System.out.println("last update: " + t.getLastUpdate());
          System.out.println("------------------------------------");
        }


      }
      break;
      case 3: {
        System.out.println("Enter line name: ");
        String l_name = scanner.nextLine();
        System.out.println("last serviced month difference: ");
        int months = scanner.nextInt();
        scanner.nextLine();
        ArrayList<Train> tlist = model.getTrainByServiceMonths(l_name, months);
        for (Train t : tlist) {
          System.out.println("id: " + t.getId());
          System.out.println("num cars: " + t.getNumCars());
          System.out.println("last update: " + t.getLastUpdate());
          System.out.println("------------------------------------");
        }

      }
      break;
      case 4: {
        System.out.println("Enter train id : ");
        int tid = scanner.nextInt();
        scanner.nextLine();
        model.updateServiceDate(tid);
      }
      break;
      case 5: {
        System.out.println("Enter train id to delete : ");
        int tid = scanner.nextInt();
        scanner.nextLine();
        model.deleteTrain(tid);
      }
      break;
      case 7:
        workDesk();
        break;

      default:
        trainPage();

    }
    trainPage();

  }

  private void displayRegisterPage() {
    System.out.println("###################");
    System.out.println("STAFF PORTAL: Look UP PAGE");
    System.out.println("###################");

    System.out.println("404: still working on it");
    scanner.nextLine();
    displayWelcomePage();
  }


}

