
import static DAO.AdminDAO.getConnection;
import java.sql.*;

public class testJDBC {

    private static String dbURL = "jdbc:mysql://localhost:3306/";
    private static String dbName = "toyshop";
    private static String dbUsername = "root";
    private static String dbPassword = "admin";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(dbURL + dbName, dbUsername, dbPassword);
        return con;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        System.out.println("running");
        // Open a connection
        String account = "admin";
        String password = "admin";
        Connection con = getConnection();
        String sql = "select * from admin where account = ? and password = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, account);
        ps.setString(2, password);

        System.out.println(sql);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            System.out.println("Found: " + rs.getString(2) + " " + rs.getString(3));
        }
        con.close();

    }
}
