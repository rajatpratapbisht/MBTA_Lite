package model;

public class TrainLines {
    private String lineType;
    private String name;
    private int speed;
    private String color;

    private String start_station;
    private String end_station;

    public TrainLines(String name, String color, String start_station,
                      String end_station, String lineType, int speed) {
        this.name = name;
        this.color = color;
        this.start_station = start_station;
        this.end_station = end_station;
        this.lineType = lineType;
        this.speed = speed;
    }

    public void printLineInfo() {
        System.out.println("name: " + name);
        System.out.println("color: " + color);
        System.out.println("start_station: " + start_station);
        System.out.println("end_station: " + end_station);
        System.out.println("lineType: " + lineType);
        System.out.println("speed: " + speed + " mph");
    }

    public String getName() {
        return name;
    }

    public String getColor() {
        return color;
    }

    public String getStart_station() {
        return start_station;
    }

    public String getEnd_station() {
        return end_station;
    }

    public String getLineType() {
        return lineType;
    }

    public int getSpeed() {
        return speed;
    }


}
