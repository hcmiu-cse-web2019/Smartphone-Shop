import model.LaptopSortOption;
import java.io.File;
import java.io.IOException;
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
import org.springframework.util.ResourceUtils;

/**
 *
 * @author KiroHikaru
 */
@WebServlet(urlPatterns = {"/Laptop"})
public class LaptopServlet extends HttpServlet {

    private static final String QUERY_FILE = "Laptop List.sql";
    private static String searchString;
    private static String sortOption;

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
        
        sortOption = request.getParameter("sortOption");
        searchString = request.getParameter("searchText");

        if (searchString != null) {
            searchProduct(request, response, searchString);
        } else {
            showListProduct(request, response);
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("LaptopPage.jsp");
        rd.forward(request, response);
    }

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
    }
    
    public static void showListProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Get DEFAULT OPTION: " + QUERY_FILE);
        try {
            //Connect to database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/laptop", "root", "tomnisa123");
            Statement statement = con.createStatement();
      
            //Get text from file
            File file = ResourceUtils.getFile("classpath:SQL File/" + QUERY_FILE);
            String content = new String(Files.readAllBytes(file.toPath()));
            content += getSortOption(sortOption);
                      
            //Execute SQL
            System.out.println("Executing SQL...");
            ResultSet rs = statement.executeQuery(content);
            ResultSetMetaData rsmd = rs.getMetaData();

            List<Laptop> laptops = new ArrayList<>();
            List<String> columnNames = new ArrayList<>();
            int columnCount = rsmd.getColumnCount();

            for (int i = 1; i <= columnCount; i++) {
                columnNames.add(rsmd.getColumnName(i));
            }

            while (rs.next()) {
                Laptop laptop = new Laptop();

                laptop.setImage(rs.getString(1));
                laptop.setFullName(rs.getString(2));
                laptop.setCpuModel(rs.getString(3));
                laptop.setRam(rs.getString(4));
                laptop.setGpuModel(rs.getString(5));
                laptop.setHdd(rs.getString(6));
                laptop.setSsd(rs.getString(7));
                laptop.setDisplay(rs.getString(8));
                laptop.setBattery(rs.getString(9));
                laptop.setOs(rs.getString(10));
                laptop.setPrice(rs.getString(11));

                laptops.add(laptop);
            }

            request.setAttribute("columnNames", columnNames);
            request.setAttribute("laptops", laptops);

            con.close();
        } catch (IOException | ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
    }

    public static void searchProduct(HttpServletRequest request, HttpServletResponse response, String searchString) throws ServletException, IOException {
        System.out.println("Get input: " + request.getParameter("searchText"));
        System.out.println("Get Option: " + QUERY_FILE);
        try {
            //Connect to database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/laptop", "root", "tomnisa123");
            Statement statement = con.createStatement();

            //Get text from file
            File file = ResourceUtils.getFile("classpath:SQL File/" + QUERY_FILE);
            String content = new String(Files.readAllBytes(file.toPath()));

            //Search Laptop
            content +=  "AND CONCAT(laptopbrand.laptop_brand_name, ' ',"
                    +   "           brandseries.brand_series_name, ' ',"
                    +   "           laptop.laptop_model"
                    +   ") LIKE '%" + searchString + "%'";

            System.out.println("Get Sorting Option: " + sortOption);

            //Sort laptop if available
            content += getSortOption(sortOption);

            ResultSet rs = statement.executeQuery(content);

            ResultSetMetaData rsmd = rs.getMetaData();

            List<Laptop> laptops = new ArrayList<>();
            List<String> columnNames = new ArrayList<>();
            int columnCount = rsmd.getColumnCount();

            for (int i = 1; i <= columnCount; i++) {
                columnNames.add(rsmd.getColumnName(i));
            }

            while (rs.next()) {
                Laptop laptop = new Laptop();

                laptop.setImage(rs.getString(1));
                laptop.setFullName(rs.getString(2));
                laptop.setCpuModel(rs.getString(3));
                laptop.setRam(rs.getString(4));
                laptop.setGpuModel(rs.getString(5));
                laptop.setHdd(rs.getString(6));
                laptop.setSsd(rs.getString(7));
                laptop.setDisplay(rs.getString(8));
                laptop.setBattery(rs.getString(9));
                laptop.setOs(rs.getString(10));
                laptop.setPrice(rs.getString(11));

                laptops.add(laptop);
            }

            request.setAttribute("columnNames", columnNames);
            request.setAttribute("laptops", laptops);

            con.close();
        } catch (IOException | ClassNotFoundException | NumberFormatException | SQLException e) {
            System.out.println(e);
        }
    }

    public static String getSortOption(String sortOption) {
        if (sortOption != null) {
            switch (Integer.parseInt(sortOption)) {
                case 0: return "";
                case 1: return "" + LaptopSortOption.PRICE_ASC.toString();
                case 2: return "" + LaptopSortOption.PRICE_DESC.toString();
                case 3: return "" + LaptopSortOption.BRAND_ASC.toString();
                case 4: return "" + LaptopSortOption.BRAND_DESC.toString();
                default: return "";
            }
        } else return " ";
    }

    
}