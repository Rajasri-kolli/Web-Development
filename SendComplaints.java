package complaints;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.sql.*;

@WebServlet("/SendComplaints")
@MultipartConfig(maxFileSize = 16177215)
public class SendComplaints extends HttpServlet {

    private String dbURL = "jdbc:mysql://localhost:3306/location_based";
    private String dbUser = "root";
    private String dbPass = "root";

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
String id = request.getParameter("id");
String username = request.getParameter("username");
        String sellername = request.getParameter("sellername");
        String pname = request.getParameter("pname");
        
        String pprize = request.getParameter("pprize");
                String location = request.getParameter("location");
        
        InputStream inputStream = null;
        Part filePart = request.getPart("image");
        if (filePart != null) {

            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());


            inputStream = filePart.getInputStream();
        }

        Connection conn = null;
        String message = null;

        try {

           Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            String sql = "INSERT INTO complaints (id,username,sellername,pname, pprize,location, status,image) values (?, ?, ?, ?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, id);
            statement.setString(2, username);
            statement.setString(3, sellername);
            statement.setString(4, pname);
            statement.setString(5, pprize);
      statement.setString(6, location);
      statement.setString(7, "Waiting");
            
            

            if (inputStream != null) {
                statement.setBlob(8, inputStream);
            }

            int row = statement.executeUpdate();
            if (row > 0) {

                System.out.println("image upload sucess");
                response.sendRedirect("ConsumerHome.jsp?reg=success");
            } else {
                response.sendRedirect("ConsumerHome.jsp?regg=Failed");

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SendComplaints.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}