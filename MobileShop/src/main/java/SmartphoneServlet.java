

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Laptop;
import model.Product;
import org.springframework.util.ResourceUtils;

/**
 *
 * @author KiroHikaru
 */
@WebServlet(urlPatterns = {"/Smartphone"})
public class SmartphoneServlet extends HttpServlet {

    static String queryFile = "Smartphone List.sql";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        showListProduct(request, response);

        RequestDispatcher rd = request.getRequestDispatcher("smartphonePage.jsp");
        rd.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public static void showListProduct(HttpServletRequest request, HttpServletResponse response) {
        try {
            //Connect to database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartphone", "root", "tomnisa123");
            Statement statement = con.createStatement();

            //Get text from file
            File file = ResourceUtils.getFile("classpath:SQL File/" + queryFile);
            String content = new String(Files.readAllBytes(file.toPath()));
            ResultSet rs = statement.executeQuery(content);

            ResultSetMetaData rsmd = rs.getMetaData();

//            List<Laptop> laptops = new ArrayList<>();
//            List<String> columnNames = new ArrayList<>();
//            int columnCount = rsmd.getColumnCount();
//
//            for (int i = 1; i <= columnCount; i++) {
//                columnNames.add(rsmd.getColumnName(i));
//            }

            int productCount = 0;
            List<Product> productList = new ArrayList<>();
            
            while (rs.next()) {
                Product product = new Product();
                productCount++;
                
                product.setImage(rs.getString(1));
                product.setName(rs.getString(2));
                product.setPrice(rs.getString(3));
                
                productList.add(product);
            }
            System.out.println("SMARTPHONE COUNT: " + productCount);
            request.setAttribute("productCount", productCount);
            request.setAttribute("productList", productList);


            con.close();
        } catch (IOException | ClassNotFoundException | NumberFormatException | SQLException e) {
            System.out.println(e);
        }
    }
}
