package model;

public class Station {
  String name;
  GeoCoordinates geoLocation;
  String connectingLines;

  public Station(String name, double latitude, double longitude, String connectingLines) {
    this.name = name;
    this.geoLocation = new GeoCoordinates(latitude, longitude);
    this.connectingLines = connectingLines;
  }


  public java.lang.String getName() {
    return name;
  }

  public GeoCoordinates getGeoLocation() {
    return geoLocation;
  }

  public String getConnectingLines() {
    return connectingLines;
  }

  public void printStationInformation() {
    System.out.println("Station Name: " + name);
    System.out.println("latitude : " + geoLocation.getLatitude());
    System.out.println("longitude : " + geoLocation.getLongitude());
    if (connectingLines != null || !(connectingLines.isEmpty())) {
      System.out.println("Connecting lines : " + connectingLines);
    }
  }


}
