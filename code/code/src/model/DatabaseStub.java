package model;

import java.sql.SQLException;
import java.util.ArrayList;

public interface DatabaseStub {



  // #####################################
  // STATIONS
  // #####################################
  /**
   * add a new station in the station table.
   * @param  st station
   */
  void addNewStation(Station st);

  /**
   * get station information from the station table.
   * @param name name of the station to fetch info of.
   * @return Station type object.
   */
  Station getStationInfo(String name);

  /**
   * update station's name to a new unique name
   * @param newName new unique name.
   * @param oldName old unique name.
   */
  void updateStationName(String newName, String oldName);

  /**
   * delete station from the station table.
   * also deletes form the line_station_mapping.
   * REQUIRES DEPENDENCY: delete entry from the connectivity table first.
   * @param name name of the station to delete.
   */
  void deleteStation(String name);


  // #####################################
  // LINE TYPES
  // #####################################

  /**
   * add a new type of line
   * @param lineType name of a type
   * @param speed speed limit for the new line type
   */
  void addLineType(String lineType, int speed);

  /**
   * get speed-limit of the line
   * @param lineType line type
   * @return speed limit
   */
  int getSpeedLimit(String lineType);

  /**
   * change speed limit
   * @param lineType line type
   * @param newSpeed new speed limit
   */
  void updateSpeed(String lineType, int newSpeed);

  /**
   * delete this line type
   * @param lineType line type
   */
  void deleteLineType(String lineType);


  // #####################################
  // LINES
  // #####################################

  /**
   * add a new line in the db
   * @param line new line object
   */
  void addNewLine(TrainLines line);

  /**
   * get information of a line
   * @param name name of the line
   * @return train lines object
   */
  TrainLines getLineInfo(String name);

  /**
   * change line's name
   * @param name current name
   * @param newName new name
   */
  void updateLineName(String name, String newName);

  /**
   * delete line
   * @param name name of the line to delete.
   */
  void deleteLine(String name);

  // #####################################
  // LINE STATION MAPPING
  // #####################################

  /**
   * add stations to a line
   * @param lineName line name
   * @param stName  station name
   */
  void addStationToLines(String lineName, String stName);

  // #####################################
  // CONNECTIVITY
  // #####################################

  /**
   * add connectivity between stations.
   * @param thisStation this station(prev)
   * @param nextStation next station
   * @param lineName line name.
   */
  void addConnectivity(String thisStation, String nextStation, String lineName);

  /**
   * get a path from a start station to an end station on a line
   * @param lineName name of the line
   * @return path as an array of station objects.
   */
  ArrayList<Station> getPathByLine(String lineName);

  /**
   * insert a new station between an already exsisting connection
   * @param newStation new inserted station.
   * @param prevStation prev station.
   * @param nextStation next station
   * @param lineName line name.
   */
  void updateConnectivity(String newStation, String prevStation, String nextStation,
                          String lineName);

  /**
   *  delete station and re-patch the connectivity
   * @param stName station to remove
   * @param lineName line name
   */
  void deleteStationConnectivity(String stName, String lineName);

  /**
   * get a path from start to end station on the same line
   * @param startStation start station
   * @param endStation end station
   * @return an array of stations.
   */
  ArrayList<Station> getPathSameLine(String startStation, String endStation);

  // #####################################
  // TRAINS
  // #####################################

  /**
   * add new train
   * @param numCars number of cars in the train
   * @param lineName line name
   */
  void addNewTrain(int numCars, String lineName);

  /**
   * get all the trains on the given line
   * @param lineName name of the line
   * @return array of trains running on the line.
   */
  ArrayList<Train> getTrainInfoByLine(String lineName);

  /**
   * get shortlisted trains that have not been serviced in the last 'n' months.
   * @param lineName line name
   * @param months number of months(n)
   * @return list of trains.
   */
  ArrayList<Train> getTrainByServiceMonths(String lineName, int months);

  /**
   * update service date by replacing it to today's date.
   * @param tid train id
   */
  void updateServiceDate(int tid);

  /**
   * delete the train record.
   * @param tid train id
   */
  void deleteTrain(int tid);

  // #####################################
  // LOGIN
  // #####################################

  /**
   * register a new user.
   * @param username username(32 char long)
   * @param passwd  password(64 char long)
   */
  void register(String username, String passwd);

  /**
   * get authentication
   * @param username username
   * @param passwd password
   * @return username if correct passowrd is entered
   */
  String getAuthentication(String username, String passwd);

  /**
   * udpate password
   * @param username username
   * @param passwd old password
   * @param newPasswd new password
   */
  void updatePasswd(String username, String passwd, String newPasswd);

  /**
   * unregister the user from the system. removes all the fields related connected by username.
   * @param username username
   * @param passwd password
   */
  void unregister(String username, String passwd);


  // #####################################
  // MANAGER
  // #####################################

  /**
   * add a new manager
   * @param f_name first name
   * @param l_name last name
   * @param office_location office location
   * @param uname username
   */
  void addManager(String f_name, String l_name, String office_location, String uname);

  /**
   * set this manager to manage the given line
   * @param username user name
   * @param lineName line name
   */
  void setManagerManagesLine(String username, String lineName);

  /**
   * reset manager of a line
   * @param lineName name of line
   */
  void resetManagerManagesLine(String lineName);

  /**
   * get manager's information
   * @param uName username
   * @return manager object.
   */
  Manager getManagerInfo(String uName);

  ArrayList<TrainLines> getAllLines();



}
