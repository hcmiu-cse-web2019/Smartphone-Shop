
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
import model.SmartphoneList;
import model.SmartphoneSortOption;
import org.springframework.util.ResourceUtils;

/**
 *
 * @author KiroHikaru
 */
@WebServlet(urlPatterns = {"/Smartphone"})
public class SmartphoneServlet extends HttpServlet {

    static String queryFile = "Smartphone List.sql";
    static String searchString;
    static String sortOption;

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
        System.out.println(sortOption);
        searchString = request.getParameter("searchText");

        System.out.println("Hello");

        if (searchString != null) {
            System.out.println("SEARCH...");
            searchProduct(request, response, searchString);
        } else {
            showListProduct(request, response);
        }

        RequestDispatcher rd = request.getRequestDispatcher("SmartphonePage.jsp");
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
        System.out.println("Get DEFAULT OPTION: " + queryFile);
        try {
            //Connect to database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartphone", "root", "tomnisa123");
            Statement statement = con.createStatement();

            //Get text from file
            File file = ResourceUtils.getFile("classpath:SQL File/" + queryFile);
            String content = new String(Files.readAllBytes(file.toPath()));

            content += "GROUP BY smartphone_modifier.smartphone_model_id\n";

            if (sortOption == null) {
                content += "ORDER BY smartphone_model.date_released DESC";
            } else {
                content += getSortOption(sortOption);
            }

            //Execute SQL
            System.out.println("Executing SQL...");
            ResultSet rs = statement.executeQuery(content);
            System.out.println("COMPLETED");

            ResultSetMetaData rsmd = rs.getMetaData();

            int productCount = 0;
            List<SmartphoneList> smartphones = new ArrayList<>();

            while (rs.next()) {
                SmartphoneList smartphone = new SmartphoneList();
                productCount++;

                smartphone.setImage(rs.getString(1));
                smartphone.setName(rs.getString(2));
                smartphone.setPrice(rs.getString(3));
                smartphone.setModelId(rs.getString(4));
                smartphone.setModifierId(rs.getString(5));
                smartphone.setColor(rs.getString(6));

                smartphones.add(smartphone);
            }

            request.setAttribute("productCount", productCount);
            request.setAttribute("productList", smartphones);

            con.close();
        } catch (IOException | ClassNotFoundException | NumberFormatException | SQLException e) {
            System.out.println(e);
        }
    }

    public static void searchProduct(HttpServletRequest request, HttpServletResponse response, String searchString) throws ServletException, IOException {
        System.out.println("SEARCH SMARTPHONE");
        System.out.println("Get inputASDASD: " + searchString);
        System.out.println("Get Option: " + queryFile);
        try {
            //Connect to database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartphone", "root", "tomnisa123");
            Statement statement = con.createStatement();

            //Get text from file
            File file = ResourceUtils.getFile("classpath:SQL File/" + queryFile);
            String content = new String(Files.readAllBytes(file.toPath()));

            //Search Laptop
            content += "WHERE CONCAT(smartphone_brand.name, ' ', \n"
                    + "           IF (smartphone_brand_series.series_name IS NOT NULL, \n"
                    + "		smartphone_brand_series.series_name, \n"
                    + "               ''\n"
                    + "           ), ' ',\n"
                    + "           smartphone_model.name\n"
                    + ") LIKE '%" + searchString + "%'";

            content += "\nGROUP BY smartphone_modifier.smartphone_model_id\n"
                    + "ORDER BY smartphone_model.date_released DESC";

            System.out.println(content);

            ResultSet rs = statement.executeQuery(content);

            ResultSetMetaData rsmd = rs.getMetaData();

            int productCount = 0;
            List<SmartphoneList> smartphones = new ArrayList<>();

            while (rs.next()) {
                SmartphoneList smartphone = new SmartphoneList();
                productCount++;

                smartphone.setImage(rs.getString(1));
                smartphone.setName(rs.getString(2));
                smartphone.setPrice(rs.getString(3));
                smartphone.setModelId(rs.getString(4));
                smartphone.setModifierId(rs.getString(5));
                smartphone.setColor(rs.getString(6));

                smartphones.add(smartphone);

                System.out.println(smartphone.getName());
            }

            request.setAttribute("productCount", productCount);
            request.setAttribute("productList", smartphones);

            con.close();
        } catch (IOException | ClassNotFoundException | NumberFormatException | SQLException e) {
            System.out.println(e);
        }
    }

    public static String getSortOption(String sortOption) {
        if (sortOption != null) {
            switch (Integer.parseInt(sortOption)) {
                case 0:
                    return "";
                case 1:
                    return "" + SmartphoneSortOption.PRICE_ASC.toString();
                case 2:
                    return "" + SmartphoneSortOption.PRICE_DESC.toString();
                case 3:
                    return "" + SmartphoneSortOption.PERFORMANCE_ASC.toString();
                case 4:
                    return "" + SmartphoneSortOption.PERFORMANCE_DESC.toString();
                case 5:
                    return "" + SmartphoneSortOption.DATE_RELEASED_LATEST.toString();
                default:
                    return "";
            }
        } else {
            return " ";
        }
    }
}
