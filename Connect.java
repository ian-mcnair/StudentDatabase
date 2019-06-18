import java.sql.*;

public class Connect {
    public Connection getConnection() throws SQLException {
    Connection conn = null;
    String url = "jdbc:mysql://localhost:3306/school_db?autoReconnect=true&useSSL=false";
    String user = "student";
    String password = "student";
    conn = DriverManager.getConnection(url, user, password);
    return conn;
}

    public boolean checkLogin(String username, String password) {
        boolean loginCheck = false;
        String sql = "SELECT * FROM users WHERE username = ? AND pword = SHA(?)";
        try {
            Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet result = stmt.executeQuery();
            if (result.first()) {
                loginCheck = true;
            }
            result.close();
            stmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return loginCheck;
    }

    public void insertNewPerson(String id, String username, String password, String fname, String lname, String gender, String address, String city, String status){
        String sql = "INSERT INTO users VALUES (?, ?, SHA(?), ?, ?, ?, ?, ?, ?)";
        try {
            Connection conn = getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, id);
            statement.setString(2, username);
            statement.setString(3, password);
            statement.setString(4, fname);
            statement.setString(5, lname);
            statement.setString(6, gender);
            statement.setString(7, address);
            statement.setString(8, city);
            statement.setString(9, status);

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("A new user was inserted successfully!");
            }
        }catch(SQLException e) {
            e.printStackTrace();
        }
    }

    /*public void insertEnrollment(String id, String courseid, int period,String grade){
        String sql = "INSERT INTO enrollment VALUES (?, ?, ?) WHERE id = '" + id + "';";
        try {
            Connection conn = getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, courseid);
            statement.setInt(2, period);
            statement.setString(3, grade);
            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Enrollment inserted");
            }
        }catch(SQLException e) {
            e.printStackTrace();
        }
    }*/

    public void removeUser(String id){
        String sql = "DELETE FROM users WHERE id = ?";
        try {
            Connection conn = getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, id);
            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("A user was removed successfully!");
            }
        }catch(SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateUsers(String attribute, String tuple, String id){
        String sql = "UPDATE users SET " + attribute + " = ? WHERE id = ?;\n";
        try {
            Connection conn = getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, tuple);
            statement.setString(2, id);

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Update was successful!");
            }
        }catch(SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateStaff(String attribute, String tuple, String id){
        String sql = "UPDATE staff SET " + attribute + " = ? WHERE staffid = ?;\n";
        try {
            Connection conn = getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, tuple);
            statement.setString(2, id);

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Update was successful!");
            }
        }catch(SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateStudent(String attribute, String tuple, String id){
        String sql = "UPDATE student SET " + attribute + " = ? WHERE studentid = ?;\n";
        try {
            Connection conn = getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, tuple);
            statement.setString(2, id);

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Update was successful!");
            }
        }catch(SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateEnrollment(String attribute, String tuple, String id){
        String sql = "UPDATE enrollment SET " + attribute + " = ? WHERE id = ?;\n";
        try {
            Connection conn = getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, tuple);
            statement.setString(2, id);

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Update was successful!");
            }
        }catch(SQLException e) {
            e.printStackTrace();
        }
    }

    public void viewBasicInfo(String id){
        String sql = "SELECT id, fname, lname, gender, address, city, stat FROM users where id = '" + id + "'";
        try {
            Connection conn = getConnection();
            Statement statement = conn.createStatement();
            ResultSet result = statement.executeQuery(sql);
            while(result.next()){
                String idno = result.getString(1);
                String fname= result.getString(2);
                String lname = result.getString(3);
                String gender = result.getString(4);
                String address = result.getString(5);
                String city = result.getString(6);
                String status = result.getString(7);
                System.out.println("*****************************");
                System.out.println(
                        "Name: " + fname + " " + lname +
                                "\nID: " + idno +
                        "\nGender: " + gender +
                        "\nAddress: " + address +
                        "\nCity: " + city +
                        "\nStatus: " + status);
            }
            System.out.println("*****************************");

        }catch(SQLException e) {
            e.printStackTrace();
        }
    }

    public void viewSchedule(String id){
        String sql = "SELECT fname, lname, stat, courseid, period FROM users, enrollment WHERE enrollment.id = '" + id + "' AND users.id = '" + id + "' ORDER BY period";
        try {
            Connection conn = getConnection();
            Statement statement = conn.createStatement();
            ResultSet result = statement.executeQuery(sql);
            int row = 0;
            System.out.println("*****************************");
            while(result.next()){
                String fname = result.getString("fname");
                String lname = result.getString("lname");
                String stats = result.getString("stat");
                String courseid = result.getString("courseid");
                String period = result.getString("period");
                row++;
                if(row == 1){
                    System.out.println(fname + " " + lname + " - " + stats);
                    System.out.println("Row-Course-Period");
                    System.out.println(row + ": " + courseid + " - " + period);
                }else System.out.println(row + ": " + courseid + " - " + period);
            }
            System.out.println("*****************************");

        }catch(SQLException e) {
            e.printStackTrace();
        }
    }

    public double calculateGPA(String[] grades){
        double gpa;
        double[] noGrades = new double[6];
        for(int i = 0; i < noGrades.length; i++){
            if(grades[i].equals("A")) noGrades[i] =  4.00;
            else if(grades[i].equals("B")) noGrades[i] = 3.00;
            else if(grades[i].equals("C")) noGrades[i] = 2.00;
            else if(grades[i].equals("D")) noGrades[i] = 1.00;
            else noGrades[i] = 0.0;
        }
        double sum = 0.00;
        for(int i = 0; i < noGrades.length; i++){
            sum += noGrades[i];
        }
        gpa = sum/5;

        return Math.round(gpa*100.00)/100.00;
    }

    public void viewGradeReport(String id){
        String sql = "SELECT fname, lname, courseid, period, grade FROM users, enrollment WHERE enrollment.id = '" + id + "' AND users.id = '" + id + "' ORDER BY period";
        try {
            Connection conn = getConnection();
            Statement statement = conn.createStatement();
            ResultSet result = statement.executeQuery(sql);
            int row = 0;
            String[] grade = new String[6];
            System.out.println("*****************************");
            while(result.next()){
                String fname = result.getString("fname");
                String lname = result.getString("lname");
                grade[row] = result.getString("grade");
                String courseid = result.getString("courseid");
                String period = result.getString("period");
                row++;
                if(row == 1){
                    System.out.println(fname + " " + lname);
                    System.out.println("Row: Course-Period-Grade");
                    System.out.println(row + ": " + courseid + " - " + period + " - " + grade[row-1] );
                }else System.out.println(row + ": " + courseid + " - " + period + " - " + grade[row-1]);
            }
            System.out.println("GPA : " + calculateGPA(grade));
            System.out.println("*****************************");

        }catch(SQLException e) {
            e.printStackTrace();
        }

    }

    public void viewStudentList(){
        String sql = "SELECT lname, fname, id FROM users WHERE stat = 'student' ORDER BY lname";
        try {
            Connection conn = getConnection();
            Statement statement = conn.createStatement();
            ResultSet result = statement.executeQuery(sql);
            int row = 0;
            System.out.println("*****************************");
            System.out.println("Row: Last Name, First Name - ID");
            while(result.next()){
                String lname = result.getString("lname");
                String fname= result.getString("fname");
                String id = result.getString("id");
                row++;
                System.out.println(row + ": " + lname + ", " + fname + " - " + id);
            }
            System.out.println("*****************************");

        }catch(SQLException e) {
            e.printStackTrace();
        }
    }

    public void viewTeacherList(){
        String sql = "SELECT lname, fname, id FROM users WHERE stat != 'student' ORDER BY lname";
        try {
            Connection conn = getConnection();
            Statement statement = conn.createStatement();
            ResultSet result = statement.executeQuery(sql);
            int row = 0;
            System.out.println("*****************************");
            System.out.println("Row: Last Name, First Name - ID");
            while(result.next()){
                String lname = result.getString("lname");
                String fname= result.getString("fname");
                String id = result.getString("id");
                row++;
                System.out.println(row + ": " + lname + ", " + fname + " - " + id);
            }
            System.out.println("*****************************");

        }catch(SQLException e) {
            e.printStackTrace();
        }
    }


}
