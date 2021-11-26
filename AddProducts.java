package addproducts;

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

@WebServlet("/AddProducts")
@MultipartConfig(maxFileSize = 16177215)
public class AddProducts extends HttpServlet {

    private String dbURL = "jdbc:mysql://localhost:3306/location_based";
    private String dbUser = "root";
    private String dbPass = "root";

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
String sellername = request.getParameter("sellername");
        String pname = request.getParameter("pname");
        
        String pprize = request.getParameter("pprize");
        
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

            String sql = "INSERT INTO products (sellername,pname, pprize, image,id) values (?, ?, ?, ?,null)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, sellername);
            statement.setString(2, pname);
            statement.setString(3, pprize); 
      
            
            

            if (inputStream != null) {
                statement.setBlob(4, inputStream);
            }

            int row = statement.executeUpdate();
            if (row > 0) {

                System.out.println("image upload sucess");
                response.sendRedirect("SellerHome.jsp?reg=success");
            } else {
                response.sendRedirect("SellerHome.jsp?regg=Failed");

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}