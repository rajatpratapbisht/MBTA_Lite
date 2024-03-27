package view;

import java.awt.*;

import javax.swing.*;

import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;

public class MBTAView extends JFrame {
  private JButton loginButton;
  private JButton registerButton;

  private JButton guestModeButton;

  private JPanel cardPanel;
  private CardLayout cardLayout;

  private JButton selectLine;
  private JButton back;
  private JButton logout;
  private JButton showPathButton;
  private JButton showPathBetweenButton;

//  private JButton showPathButton;
//  private JButton showPathButton;


  public MBTAView() {
    setTitle("M.B.T.A. lite");
    setSize(800, 600);
    setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

    setupButtons();
    // Create a panel to hold components

    cardLayout = new CardLayout();
    cardPanel = new JPanel(cardLayout);

    // Create and add "Login Page" panel
    JPanel loginPanel = createLoginPanel();
    cardPanel.add(loginPanel, "Login Page");

    // Create and add "Staff Mode" panel
    JPanel staffPanel = createStaffPanel();
    cardPanel.add(staffPanel, "Staff Mode");

    // Create and add "Guest Mode" panel
    JPanel guestPanel = createGuestPanel();
    cardPanel.add(guestPanel, "Guest Mode");


    setLayout(new BorderLayout());
    add(cardPanel, BorderLayout.CENTER);

    // Center the frame on the screen
    setLocationRelativeTo(null);

    // Make the frame visible
    run(true);

  }

  private JPanel createLoginPanel() {
    JPanel mainPanel = new JPanel(new BorderLayout());
    mainPanel.add(new JLabel("Login Page Content"), BorderLayout.NORTH);


    ImageIcon logoIcon = new ImageIcon("images/brand.png"); // Replace with the path to your logo file
    JLabel logoLabel = new JLabel(logoIcon);
    mainPanel.add(logoLabel, BorderLayout.CENTER);

    // Create a panel for buttons
    JPanel buttonPanel = new JPanel(new FlowLayout());

    // Add login button
    buttonPanel.add(loginButton);

    // Add guest mode button
    buttonPanel.add(guestModeButton);

    // Add the button panel to the main panel
    mainPanel.add(buttonPanel, BorderLayout.SOUTH);

    // Add the main panel to the frame
    add(mainPanel);

    return mainPanel;
  }

  private JPanel createStaffPanel() {
    JPanel panel = new JPanel();
    panel.add(new JLabel("Staff Mode Content"));
    return panel;


  }

  private JPanel createGuestPanel() {
    JPanel customPanel = new JPanel(new BorderLayout());


    JPanel panel = new JPanel();
    panel.add(new JLabel("Guest Mode Content"));


    BufferedImage image = createDefaultImage();


    //private JPanel createCustomPanel(BufferedImage image) {


    // 1. South of the panel with buttons in a column
    JPanel buttonPanel = new JPanel(new FlowLayout());


    buttonPanel.add(back);
    buttonPanel.add(selectLine);
    buttonPanel.add(showPathButton);
    buttonPanel.add(showPathBetweenButton);

    // 2. Center of the panel to display an image
    JLabel imageLabel = new JLabel(new ImageIcon(image));
    customPanel.add(panel, BorderLayout.NORTH);
    customPanel.add(imageLabel, BorderLayout.CENTER);
    customPanel.add(buttonPanel, BorderLayout.SOUTH);

    // Add action listeners to your buttons if needed

    //return customPanel;

    return customPanel;
  }

  private void setupButtons() {

    loginButton = new JButton("Login");
    loginButton.setActionCommand("login");

    guestModeButton = new JButton("Guest Mode");
    guestModeButton.setActionCommand("guest");

    selectLine = new JButton("Select Line");
    selectLine.setActionCommand("select_line");

    back = new JButton("<- Back");
    back.setActionCommand("go_back");

    logout = new JButton("logout");
    logout.setActionCommand("logout");

    registerButton = new JButton("register new employee");
    registerButton.setActionCommand("register");

    showPathButton = new JButton("Show Path");
    showPathButton.setActionCommand("show_path");

    showPathBetweenButton = new JButton("show Path Between");
    showPathBetweenButton.setActionCommand("path_between");

  }

  public void setListener(ActionListener listener) {
    loginButton.addActionListener(listener);
    guestModeButton.addActionListener(listener);
    selectLine.addActionListener(listener);
    back.addActionListener(listener);
    logout.addActionListener(listener);
    registerButton.addActionListener(listener);
    showPathButton.addActionListener(listener);
    showPathBetweenButton.addActionListener(listener);
//    saveButton.addActionListener(listener);

  }

  private BufferedImage createDefaultImage() {
    BufferedImage image = new BufferedImage(600, 400, BufferedImage.TYPE_INT_RGB);
    Graphics g = image.getGraphics();
    g.setColor(Color.LIGHT_GRAY);
    g.fillRect(0, 0, 600, 400);
    g.dispose();
    return image;
  }

  public void showGuestDashboard() {
    cardLayout.show(cardPanel, "Guest Mode");
    repaint();
  }

  public void showStaffDashBoard() {
    cardLayout.show(cardPanel, "Staff Mode");
    repaint();
  }

  public void showLoginDashboard() {
    cardLayout.show(cardPanel, "Login Page");
    repaint();
  }

  public void displayErrorPopup(String title, String msg) {
    JOptionPane.showMessageDialog(null,
            msg,
            title, JOptionPane.ERROR_MESSAGE);
  }

  public String getLineInfo() {
    String ret = new String();
    JTextField input = new JTextField();
    JPanel message = new JPanel(new GridLayout(0, 1));

    JLabel msg = new JLabel("lines available:\n ");
    JLabel msg2 = new JLabel("* Blue Line");
    JLabel msg3 = new JLabel("* Orange Line");
    JLabel msg4 = new JLabel("* Mattapam Line");

    msg.setHorizontalAlignment(JLabel.CENTER);

    message.add(msg);
    message.add(msg2);
    message.add(msg3);
    message.add(msg4);
    message.add(input);

    int result = JOptionPane.showConfirmDialog(this, message,
            "Login Page"
            , JOptionPane.OK_CANCEL_OPTION);

    if (result == JOptionPane.OK_OPTION) {

      ret = input.getText();

    }
    return ret;
  }

  public String[] showLoginDialog() {
    String[] array = new String[2];
    JTextField username = new JTextField();
    JTextField password = new JTextField();


    JPanel login = new JPanel(new GridLayout(0, 2));
    JLabel unLabel = new JLabel("Username");
    JLabel passLabel = new JLabel("Password");

    login.add(unLabel);
    login.add(username);
    login.add(passLabel);
    login.add(password);

    int result = JOptionPane.showConfirmDialog(this, login,
            "Login Page"
            , JOptionPane.OK_CANCEL_OPTION);

    if (result == JOptionPane.OK_OPTION) {

      array[0] = username.getText();
      array[1] = password.getText();

    }

    return array;
  }

  public void run(boolean b) {
    this.setVisible(b);
  }


}
