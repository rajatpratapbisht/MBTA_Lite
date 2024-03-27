package model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DatabaseStubImpl implements DatabaseStub {
  public Connection connection = null;

  public DatabaseStubImpl(Connection conn) {
    this.connection = conn;
  }

  /**
   * add a new station in the station table.
   *
   * @param st station
   */
  @Override
  public void addNewStation(Station st) {
    String sql = "call add_new_station(?, ?, ?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, st.getName());
      cs.setString(2, Double.toString(st.getGeoLocation().getLatitude()));
      cs.setString(3, Double.toString(st.getGeoLocation().getLongitude()));

      cs.execute();
    } catch (SQLException e) {
      if ("45000".equals(e.getSQLState())) {
        // Retrieve the error message using getMessage()
        String errorMessage = e.getMessage();
        System.out.println("Error message from stored procedure: " + errorMessage);
      }
    }
  }

  /**
   * get station information from the station table.
   *
   * @param name name of the station to fetch info of.
   * @return Station type object.
   */
  @Override
  public Station getStationInfo(String name) {
    Station station = null;
    String sql = "call get_station_info(?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, name);
      boolean hasResult = cs.execute();
      if (hasResult) {
        try (ResultSet rs = cs.getResultSet()) {

          while (rs.next()) {
            station = new Station(rs.getString("name"),
                    rs.getDouble("latitude"),
                    rs.getDouble("longitude"),
                    "");
          }

        } catch (SQLException e) {
          System.out.println("CALLABLE STATEMENT: failed to read Result set");
          if ("45000".equals(e.getSQLState())) {
            // Retrieve the error message using getMessage()
            String errorMessage = e.getMessage();
            System.out.println("Error message from stored procedure: " + errorMessage);
          }
        }
      }
    } catch (SQLException e) {
      System.out.println("ERROR:" + e.getMessage());
    }

    return station;
  }

  public Station getStationInfoComplete(String name) {
    Station station = null;
    String sql = "call get_station_info_complete(?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, name);
      boolean hasResult = cs.execute();
      if (hasResult) {
        try (ResultSet rs = cs.getResultSet()) {

          while (rs.next()) {
            station = new Station(rs.getString("name"),
                    rs.getDouble("latitude"),
                    rs.getDouble("longitude"),
                    rs.getString("line_connections"));

          }

        } catch (SQLException e) {
          System.out.println("CALLABLE STATEMENT: failed to read Result set");
          if ("45000".equals(e.getSQLState())) {
            // Retrieve the error message using getMessage()
            String errorMessage = e.getMessage();
            System.out.println("Error message from stored procedure: " + errorMessage);
          }
        }
      }
    } catch (SQLException e) {
      System.out.println("ERROR:" + e.getMessage());
    }

    return station;
  }

  /**
   * update station's name to a new unique name
   *
   * @param newName new unique name.
   * @param oldName old unique name.
   */
  @Override
  public void updateStationName(String newName, String oldName) {
    String sql = "call update_station_name(?, ?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, newName);
      cs.setString(2, oldName);
      cs.execute();
    } catch (SQLException e) {
      if ("45000".equals(e.getSQLState())) {
        // Retrieve the error message using getMessage()
        String errorMessage = e.getMessage();
        System.out.println("Error message from stored procedure: " + errorMessage);
      }
    }

  }

  /**
   * delete station from the station table.
   * also deletes form the line_station_mapping.
   * REQUIRES DEPENDENCY: delete entry from the connectivity table first.
   *
   * @param name name of the station to delete.
   */
  @Override
  public void deleteStation(String name) {
    String sql = "call delete_station(?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, name);
      cs.execute();
    } catch (SQLException e) {
      if ("45000".equals(e.getSQLState())) {
        // Retrieve the error message using getMessage()
        String errorMessage = e.getMessage();
        System.out.println("Error message from stored procedure: " + errorMessage);
      }
    }
  }
// ###############################################################################################

  /**
   * add a new type of line
   *
   * @param lineType name of a type
   * @param speed    speed limit for the new line type
   */
  @Override
  public void addLineType(String lineType, int speed) {
    String sql = "call add_line_type(?,?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, lineType);
      cs.setInt(2, speed);
      cs.execute();
    } catch (SQLException e) {
      if ("45000".equals(e.getSQLState())) {
        // Retrieve the error message using getMessage()
        String errorMessage = e.getMessage();
        System.out.println("Error message from stored procedure: " + errorMessage);
      }
    }
  }

  /**
   * get speed-limit of the line
   *
   * @param lineType line type
   * @return speed limit
   */
  @Override
  public int getSpeedLimit(String lineType) {
    int speed = 0;
    Station station = null;
    String sql = "call get_speed_limit(?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, lineType);
      boolean hasResult = cs.execute();
      if (hasResult) {
        try (ResultSet rs = cs.getResultSet()) {

          while (rs.next()) {
            speed = rs.getInt("speed_limit");
          }

        } catch (SQLException e) {
          System.out.println("CALLABLE STATEMENT: failed to read Result set");
          if ("45000".equals(e.getSQLState())) {
            // Retrieve the error message using getMessage()
            String errorMessage = e.getMessage();
            System.out.println("Error message from stored procedure: " + errorMessage);
          }
        }
      }
    } catch (SQLException e) {
      System.out.println("ERROR:" + e.getMessage());
    }

    return speed;

  }

  /**
   * change speed limit
   *
   * @param lineType line type
   * @param newSpeed new speed limit
   */
  @Override
  public void updateSpeed(String lineType, int newSpeed) {
    String sql = "call update_speed_limit(?,?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, lineType);
      cs.setInt(2, newSpeed);
      cs.execute();
    } catch (SQLException e) {
      if ("45000".equals(e.getSQLState())) {
        // Retrieve the error message using getMessage()
        String errorMessage = e.getMessage();
        System.out.println("Error message from stored procedure: " + errorMessage);
      }
    }
  }

  /**
   * delete this line type
   *
   * @param lineType line type
   */
  @Override
  public void deleteLineType(String lineType) {
    String sql = "call delete_line_type(?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, lineType);
      cs.execute();
    } catch (SQLException e) {
      if ("45000".equals(e.getSQLState())) {
        // Retrieve the error message using getMessage()
        String errorMessage = e.getMessage();
        System.out.println("Error message from stored procedure: " + errorMessage);
      }
    }
  }
  // ###############################################################################################

  /**
   * add a new line in the db
   *
   * @param line new line object
   */
  @Override
  public void addNewLine(TrainLines line) {
    String sql = "call add_new_line(?, ?, ?, ?, ?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, line.getName());
      cs.setString(2, line.getColor());
      cs.setString(3, line.getStart_station());
      cs.setString(4, line.getEnd_station());
      cs.setString(5, line.getLineType());
      cs.execute();
    } catch (SQLException e) {
      if ("45000".equals(e.getSQLState())) {
        // Retrieve the error message using getMessage()
        String errorMessage = e.getMessage();
        System.out.println("Error message from stored procedure: " + errorMessage);
      }
    }

  }

  /**
   * get information of a line
   *
   * @param name name of the line
   * @return train lines object
   */
  @Override
  public TrainLines getLineInfo(String name) {
    TrainLines line = null;

    String sql = "call get_line_info(?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, name);
      boolean hasResult = cs.execute();
      if (hasResult) {
        try (ResultSet rs = cs.getResultSet()) {

          while (rs.next()) {
            line = new TrainLines(rs.getString("name"),
                    rs.getString("color"),
                    rs.getString("start_Station"),
                    rs.getString("end_station"),
                    rs.getString("type"),
                    rs.getInt("speed_limit")
            );
          }

        } catch (SQLException e) {
          System.out.println("CALLABLE STATEMENT: failed to read Result set");
          if ("45000".equals(e.getSQLState())) {
            // Retrieve the error message using getMessage()
            String errorMessage = e.getMessage();
            System.out.println("Error message from stored procedure: " + errorMessage);
          }
        }
      }
    } catch (SQLException e) {
      System.out.println("ERROR:" + e.getMessage());
    }

    return line;

  }

  /**
   * change line's name
   *
   * @param name    current name
   * @param newName new name
   */
  @Override
  public void updateLineName(String name, String newName) {
    String sql = "call update_line_name(?, ?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, name);
      cs.setString(2, newName);

      cs.execute();
    } catch (SQLException e) {
      if ("45000".equals(e.getSQLState())) {
        // Retrieve the error message using getMessage()
        String errorMessage = e.getMessage();
        System.out.println("Error message from stored procedure: " + errorMessage);
      }
    }
  }

  /**
   * delete line
   *
   * @param name name of the line to delete.
   */
  @Override
  public void deleteLine(String name) {
    String sql = "call delete_line(?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, name);
      cs.execute();
    } catch (SQLException e) {
      if ("45000".equals(e.getSQLState())) {
        // Retrieve the error message using getMessage()
        String errorMessage = e.getMessage();
        System.out.println("Error message from stored procedure: " + errorMessage);
      }
    }

  }
// ###############################################################################################

  /**
   * add stations to a line
   *
   * @param lineName line name
   * @param stName   station name
   */
  @Override
  public void addStationToLines(String lineName, String stName) {
    String sql = "call add_station_to_lines(?, ?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, lineName);
      cs.setString(2, stName);
      cs.execute();
    } catch (SQLException e) {
      if ("45000".equals(e.getSQLState())) {
        // Retrieve the error message using getMessage()
        String errorMessage = e.getMessage();
        System.out.println("Error message from stored procedure: " + errorMessage);
      }
    }
  }
// ###############################################################################################

  /**
   * add connectivity between stations.
   *
   * @param thisStation this station(prev)
   * @param nextStation next station
   * @param lineName    line name.
   */
  @Override
  public void addConnectivity(String thisStation, String nextStation, String lineName) {
    String sql = "call add_connectivity(?, ?, ?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, thisStation);
      cs.setString(2, nextStation);
      cs.setString(3, lineName);

      cs.execute();
    } catch (SQLException e) {
      if ("45000".equals(e.getSQLState())) {
        // Retrieve the error message using getMessage()
        String errorMessage = e.getMessage();
        System.out.println("Error message from stored procedure: " + errorMessage);
      }
    }
  }

  /**
   * get a path from a start station to an end station on a line
   *
   * @param lineName name of the line
   * @return path as an array of station objects.
   */
  @Override
  public ArrayList<Station> getPathByLine(String lineName) {
    ArrayList<Station> stList = new ArrayList<Station>();
    Station station;

    String sql = "call get_path_by_line(?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, lineName);
      boolean hasResult = cs.execute();
      if (hasResult) {
        try (ResultSet rs = cs.getResultSet()) {

          while (rs.next()) {
            station = new Station(rs.getString("name"),
                    rs.getDouble("latitude"),
                    rs.getDouble("longitude"),
                    ""
            );

            stList.add(station);
          }

        } catch (SQLException e) {
          System.out.println("CALLABLE STATEMENT: failed to read Result set");
          if ("45000".equals(e.getSQLState())) {
            // Retrieve the error message using getMessage()
            String errorMessage = e.getMessage();
            System.out.println("Error message from stored procedure: " + errorMessage);
          }
        }
      }
    } catch (SQLException e) {
      System.out.println("ERROR:" + e.getMessage());
    }

    return stList;


  }

  /**
   * insert a new station between an already exsisting connection
   *
   * @param newStation  new inserted station.
   * @param prevStation prev station.
   * @param nextStation next station
   * @param lineName    line name.
   */
  @Override
  public void updateConnectivity(String newStation, String prevStation, String nextStation, String lineName) {
    String sql = "call update_connectivity(?, ?, ?, ?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, newStation);
      cs.setString(2, prevStation);
      cs.setString(3, newStation);
      cs.setString(4, lineName);

      cs.execute();
    } catch (SQLException e) {
      if ("45000".equals(e.getSQLState())) {
        // Retrieve the error message using getMessage()
        String errorMessage = e.getMessage();
        System.out.println("Error message from stored procedure: " + errorMessage);
      }
    }
  }

  /**
   * delete station and re-patch the connectivity
   *
   * @param stName   station to remove
   * @param lineName line name
   */
  @Override
  public void deleteStationConnectivity(String stName, String lineName) {
    String sql = "call delete_station_connectivity(?, ?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, stName);
      cs.setString(2, lineName);


      cs.execute();
    } catch (SQLException e) {
      if ("45000".equals(e.getSQLState())) {
        // Retrieve the error message using getMessage()
        String errorMessage = e.getMessage();
        System.out.println("Error message from stored procedure: " + errorMessage);
      }
    }
  }

  /**
   * get a path from start to end station on the same line
   *
   * @param startStation start station
   * @param endStation   end station
   * @return an array of stations.
   */
  @Override
  public ArrayList<Station> getPathSameLine(String startStation, String endStation) {
    ArrayList<Station> stList = new ArrayList<Station>();
    Station station;

    String sql = "call get_path_same_line(?, ?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, startStation);
      cs.setString(2, endStation);
      boolean hasResult = cs.execute();
      if (hasResult) {
        try (ResultSet rs = cs.getResultSet()) {

          while (rs.next()) {
            station = new Station(rs.getString("name"),
                    rs.getDouble("latitude"),
                    rs.getDouble("longitude"),
                    ""
            );

            stList.add(station);
          }

        } catch (SQLException e) {
          System.out.println("CALLABLE STATEMENT: failed to read Result set");
          if ("45000".equals(e.getSQLState())) {
            // Retrieve the error message using getMessage()
            String errorMessage = e.getMessage();
            System.out.println("Error message from stored procedure: " + errorMessage);
          }
        }
      }
    } catch (SQLException e) {
      System.out.println("ERROR:" + e.getMessage());
    }
    return stList;

  }
// ###############################################################################################

  /**
   * add new train
   *
   * @param numCars  number of cars in the train
   * @param lineName line name
   */
  @Override
  public void addNewTrain(int numCars, String lineName) {
    String sql = "call add_new_train(?, ?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setInt(1, numCars);
      cs.setString(2, lineName);

      cs.execute();
    } catch (SQLException e) {
      if ("45000".equals(e.getSQLState())) {
        // Retrieve the error message using getMessage()
        String errorMessage = e.getMessage();
        System.out.println("Error message from stored procedure: " + errorMessage);
      }
    }
  }

  /**
   * get all the trains on the given line
   *
   * @param lineName name of the line
   * @return array of trains running on the line.
   */
  @Override
  public ArrayList<Train> getTrainInfoByLine(String lineName) {
    ArrayList<Train> stList = new ArrayList<Train>();
    Train train;

    String sql = "call get_train_info_by_line(?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, lineName);

      boolean hasResult = cs.execute();
      if (hasResult) {
        try (ResultSet rs = cs.getResultSet()) {

          while (rs.next()) {
            train = new Train(rs.getInt("tid"),
                    rs.getInt("num_cars"),
                    rs.getString("last_service_date"),
                    rs.getString("name")
            );

            stList.add(train);
          }

        } catch (SQLException e) {
          System.out.println("CALLABLE STATEMENT: failed to read Result set");
          if ("45000".equals(e.getSQLState())) {
            // Retrieve the error message using getMessage()
            String errorMessage = e.getMessage();
            System.out.println("Error message from stored procedure: " + errorMessage);
          }
        }
      }
    } catch (SQLException e) {
      System.out.println("ERROR:" + e.getMessage());
    }
    return stList;
  }

  /**
   * get shortlisted trains that have not been serviced in the last 'n' months.
   *
   * @param lineName line name
   * @param months   number of months(n)
   * @return list of trains.
   */
  @Override
  public ArrayList<Train> getTrainByServiceMonths(String lineName, int months) {
    ArrayList<Train> stList = new ArrayList<Train>();
    Train train;

    String sql = "call get_trains_by_service_months(?, ?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, lineName);
      cs.setInt(2, months);

      boolean hasResult = cs.execute();
      if (hasResult) {
        try (ResultSet rs = cs.getResultSet()) {

          while (rs.next()) {
            train = new Train(rs.getInt("tid"),
                    rs.getInt("num_cars"),
                    rs.getString("last_service_date"),
                    lineName
            );

            stList.add(train);
          }

        } catch (SQLException e) {
          System.out.println("CALLABLE STATEMENT: failed to read Result set");
          if ("45000".equals(e.getSQLState())) {
            // Retrieve the error message using getMessage()
            String errorMessage = e.getMessage();
            System.out.println("Error message from stored procedure: " + errorMessage);
          }
        }
      }
    } catch (SQLException e) {
      System.out.println("ERROR:" + e.getMessage());
    }
    return stList;
  }

  /**
   * update service date by replacing it to today's date.
   *
   * @param tid train id
   */
  @Override
  public void updateServiceDate(int tid) {
    String sql = "call update_service_date(?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setInt(1, tid);

      cs.execute();
    } catch (SQLException e) {
      if ("45000".equals(e.getSQLState())) {
        // Retrieve the error message using getMessage()
        String errorMessage = e.getMessage();
        System.out.println("Error message from stored procedure: " + errorMessage);
      }
    }
  }

  /**
   * delete the train record.
   *
   * @param tid train id
   */
  @Override
  public void deleteTrain(int tid) {
    String sql = "call delete_train(?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setInt(1, tid);

      cs.execute();
    } catch (SQLException e) {
      if ("45000".equals(e.getSQLState())) {
        // Retrieve the error message using getMessage()
        String errorMessage = e.getMessage();
        System.out.println("Error message from stored procedure: " + errorMessage);
      }
    }
  }

  // ###############################################################################################

  /**
   * register a new user.
   *
   * @param username username(32 char long)
   * @param passwd   password(64 char long)
   */
  @Override
  public void register(String username, String passwd) {
    String sql = "call register(?, ?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, username);
      cs.setString(2, passwd);

      cs.execute();
    } catch (SQLException e) {
      if ("45000".equals(e.getSQLState())) {
        // Retrieve the error message using getMessage()
        String errorMessage = e.getMessage();
        System.out.println("Error message from stored procedure: " + errorMessage);
      }
    }
  }

  /**
   * get authentication
   *
   * @param username username
   * @param passwd   password
   * @return username if correct passowrd is entered
   */
  @Override
  public String getAuthentication(String username, String passwd) {
    String retString = null;

    String sql = "call get_authentication(?, ?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, username);
      cs.setString(2, passwd);

      boolean hasResult = cs.execute();
      if (hasResult) {
        try (ResultSet rs = cs.getResultSet()) {

          while (rs.next()) {
            retString = new String(rs.getString("un"));

          }

        } catch (SQLException e) {
          System.out.println("CALLABLE STATEMENT: failed to read Result set");
          if ("45000".equals(e.getSQLState())) {
            // Retrieve the error message using getMessage()
            String errorMessage = e.getMessage();
            retString = e.getMessage();
            System.out.println("Error message from stored procedure: " + errorMessage);
          }
        }
      }
    } catch (SQLException e) {
      System.out.println("ERROR:" + e.getMessage());
    }
    return retString;
  }

  /**
   * udpate password
   *
   * @param username  username
   * @param passwd    old password
   * @param newPasswd new password
   */
  @Override
  public void updatePasswd(String username, String passwd, String newPasswd) {
    String sql = "call update_password(?, ?, ?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, username);
      cs.setString(2, passwd);
      cs.setString(3, newPasswd);

      cs.execute();
    } catch (SQLException e) {
      if ("45000".equals(e.getSQLState())) {
        // Retrieve the error message using getMessage()
        String errorMessage = e.getMessage();
        System.out.println("Error message from stored procedure: " + errorMessage);
      }
    }
  }

  /**
   * unregister the user from the system. removes all the fields related connected by username.
   *
   * @param username username
   * @param passwd   password
   */
  @Override
  public void unregister(String username, String passwd) {
    String sql = "call unregister(?, ?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, username);
      cs.setString(2, passwd);

      cs.execute();
    } catch (SQLException e) {
      if ("45000".equals(e.getSQLState())) {
        // Retrieve the error message using getMessage()
        String errorMessage = e.getMessage();
        System.out.println("Error message from stored procedure: " + errorMessage);
      }
    }
  }

  // ###############################################################################################

  /**
   * add a new manager
   *
   * @param f_name          first name
   * @param l_name          last name
   * @param office_location office location
   * @param uname           username
   */
  @Override
  public void addManager(String f_name, String l_name, String office_location, String uname) {
    String sql = "call add_manager(?, ?, ?, ?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, f_name);
      cs.setString(2, l_name);
      cs.setString(3, office_location);
      cs.setString(4, uname);

      cs.execute();
    } catch (SQLException e) {
      if ("45000".equals(e.getSQLState())) {
        // Retrieve the error message using getMessage()
        String errorMessage = e.getMessage();
        System.out.println("Error message from stored procedure: " + errorMessage);
      }
    }
  }

  /**
   * set this manager to manage the given line
   *
   * @param username user name
   * @param lineName line name
   */
  @Override
  public void setManagerManagesLine(String username, String lineName) {
    String sql = "call reset_manager_manages_line(?, ?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, username);
      cs.setString(2, lineName);

      cs.execute();
    } catch (SQLException e) {
      if ("45000".equals(e.getSQLState())) {
        // Retrieve the error message using getMessage()
        String errorMessage = e.getMessage();
        System.out.println("Error message from stored procedure: " + errorMessage);
      }
    }
  }

  /**
   * reset manager of a line
   *
   * @param lineName name of line
   */
  @Override
  public void resetManagerManagesLine(String lineName) {
    String sql = "call reset_manager_manages_line(?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, lineName);

      cs.execute();
    } catch (SQLException e) {
      if ("45000".equals(e.getSQLState())) {
        // Retrieve the error message using getMessage()
        String errorMessage = e.getMessage();
        System.out.println("Error message from stored procedure: " + errorMessage);
      }
    }
  }

  /**
   * get manager's information
   *
   * @param uName username
   * @return manager object.
   */
  @Override
  public Manager getManagerInfo(String uName) {

    Manager manager = null;
    String sql = "call get_manager_info(?)";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      cs.setString(1, uName);
      boolean hasResult = cs.execute();
      if (hasResult) {
        try (ResultSet rs = cs.getResultSet()) {

          while (rs.next()) {
            manager = new Manager(
                    rs.getString("f_name"),
                    rs.getString("l_name"),
                    rs.getString("office_location"),
                    rs.getString("u_name")
            );

          }

        } catch (SQLException e) {
          System.out.println("CALLABLE STATEMENT: failed to read Result set");
          if ("45000".equals(e.getSQLState())) {
            // Retrieve the error message using getMessage()
            String errorMessage = e.getMessage();
            System.out.println("Error message from stored procedure: " + errorMessage);
          }
        }
      }
    } catch (SQLException e) {
      System.out.println("ERROR:" + e.getMessage());
    }
    return manager;
  }

  /**
   * @return
   */
  @Override
  public ArrayList<TrainLines> getAllLines() {
    ArrayList<TrainLines> tlList = new ArrayList<TrainLines>();
    TrainLines line;

    String sql = "call get_all_lines()";
    try (CallableStatement cs = connection.prepareCall(sql)) {

      boolean hasResult = cs.execute();
      if (hasResult) {
        try (ResultSet rs = cs.getResultSet()) {

          while (rs.next()) {
            line = new TrainLines(
                    rs.getString("name"),
                    rs.getString("color"),
                    rs.getString("terminal_A"),
                    rs.getString("terminal_B"),
                    rs.getString("type"),
                    rs.getInt("speed_limit")
            );

            tlList.add(line);
          }

        } catch (SQLException e) {
          System.out.println("CALLABLE STATEMENT: failed to read Result set");
          if ("45000".equals(e.getSQLState())) {
            // Retrieve the error message using getMessage()
            String errorMessage = e.getMessage();
            System.out.println("Error message from stored procedure: " + errorMessage);
          }
        }
      }
    } catch (SQLException e) {
      System.out.println("ERROR:" + e.getMessage());

    }
    return tlList;
  }


  // ###############################################################################################
}
