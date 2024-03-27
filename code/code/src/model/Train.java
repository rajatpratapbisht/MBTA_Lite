package model;

public class Train {
  private int id;
  private int numCars;
  String lastUpdate;
  String lName;

  public Train(int id, int numCars, String lastUpdate, String lName) {
    this.id = id;
    this.numCars = numCars;
    this.lastUpdate = lastUpdate;
    this.lName = lName;
  }

  public int getId() {
    return id;
  }

  public int getNumCars() {
    return numCars;
  }

  public String getLastUpdate() {
    return lastUpdate;
  }

  public String getLineName() {
    return lName;
  }
}
