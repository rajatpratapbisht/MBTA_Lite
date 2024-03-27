package model;

/**
 * This class is written to incorporate the Geo location data.
 * This can be used for plotting the maps and storing information.
 */

public class GeoCoordinates {
  double latitude;
  double longitude;

  /**
   * create a geo-coordinate type object.
   * @param latitude latitude of a geolocation.
   * @param longitude longitude of a geolocation.
   */
  public GeoCoordinates(double latitude, double longitude) {
    this.latitude = latitude;
    this.longitude = longitude;
  }

  /**
   * getter function for latitude.
   * @return latitude
   */
  public double getLatitude() {
    return latitude;
  }

  /**
   * getter function for longitude.
   * @return longitude
   */
  public double getLongitude() {
    return longitude;
  }
}
