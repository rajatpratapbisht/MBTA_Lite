package model;

public class Manager {
  private String uName, f_name, l_name, office_location;

  public Manager( String f_name, String l_name, String office_location, String uName) {
    this.f_name = f_name;
    this.l_name = l_name;
    this.office_location = office_location;
    this.uName = uName;
  }

  public String getF_name() {
    return f_name;
  }

  public String getL_name() {
    return l_name;
  }

  public String getOffice_location() {
    return office_location;
  }

  public String getUserName() {
    return uName;
  }
}
