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
import model.SmartphoneList;
import model.Smartphone;
import model.SmartphoneColor;
import model.SmartphoneModifier;
import org.springframework.util.ResourceUtils;

/**
 *
 * @author KiroHikaru
 */
@WebServlet(urlPatterns = {"/SmartphoneDetail"})
public class SmartphoneDetail extends HttpServlet {

    private static final String QUERY_FILE_1 = "Smartphone Modifier List.sql";
    private static final String QUERY_FILE_2 = "Smartphone Color List.sql";
    private static final String QUERY_FILE_3 = "Smartphone Specification Full.sql";

    private static String modelId = "";
    private static String modifierId = "";
    private static String color = "";

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

        modelId = request.getParameter("modelId");
        modifierId = request.getParameter("modifierId");
        color = request.getParameter("color");

        System.out.println(color);

        showListModifier(request, response, modelId);
        showListColor(request, response, modifierId);
        showProductFullDetail(request, response, modifierId, modelId, color);

        RequestDispatcher rd = request.getRequestDispatcher("SmartphoneDetail.jsp");
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

    public static void showListModifier(HttpServletRequest request, HttpServletResponse response, String modelId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartphone", "root", "tomnisa123");
            Statement statement = con.createStatement();

            File file = ResourceUtils.getFile("classpath:SQL File/" + QUERY_FILE_1);
            String content = new String(Files.readAllBytes(file.toPath()));

            content += "WHERE smartphone_modifier.smartphone_model_id ='" + modelId + "'"
                    + "GROUP BY smartphone_modifier.smartphone_modifier_id";

            ResultSet rs = statement.executeQuery(content);

            ResultSetMetaData rsmd = rs.getMetaData();

            List<SmartphoneModifier> smartphoneModifiers = new ArrayList<>();

            while (rs.next()) {
                SmartphoneModifier smartphoneModifier = new SmartphoneModifier();

                smartphoneModifier.setName(rs.getString(1));
                smartphoneModifier.setPrice(rs.getString(2));
                smartphoneModifier.setRam(rs.getString(3));
                smartphoneModifier.setRom(rs.getString(4));
                smartphoneModifier.setModelId(rs.getString(5));
                smartphoneModifier.setModifierId(rs.getString(6));
                smartphoneModifier.setColor(rs.getString(7));

                smartphoneModifiers.add(smartphoneModifier);
            }

            request.setAttribute("smartphoneModifiers", smartphoneModifiers);
            con.close();

        } catch (IOException | ClassNotFoundException | NumberFormatException | SQLException e) {
            System.out.println(e);
        }
    }

    public static void showListColor(HttpServletRequest request, HttpServletResponse response, String modifierId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartphone", "root", "tomnisa123");
            Statement statement = con.createStatement();

            File file = ResourceUtils.getFile("classpath:SQL File/" + QUERY_FILE_2);
            String content = new String(Files.readAllBytes(file.toPath()));

            content += "WHERE smartphone_modifier.smartphone_modifier_id = '" + modifierId + "'";

            ResultSet rs = statement.executeQuery(content);
            ResultSetMetaData rsmd = rs.getMetaData();

            List<SmartphoneColor> smartphoneColors = new ArrayList<>();

            while (rs.next()) {
                SmartphoneColor smartphoneColor = new SmartphoneColor();

                smartphoneColor.setImageFile(rs.getString(1));
                smartphoneColor.setColor(rs.getString(2));

                smartphoneColors.add(smartphoneColor);
            }

            request.setAttribute("smartphoneColors", smartphoneColors);

            con.close();

        } catch (IOException | ClassNotFoundException | NumberFormatException | SQLException e) {
            System.out.println(e);
        }
    }

    public static void showProductFullDetail(HttpServletRequest request, HttpServletResponse response, String modifierId, String modelId, String color)
            throws ServletException, IOException {
        try {
            //Connect to database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartphone", "root", "tomnisa123");
            Statement statement = con.createStatement();

            //Get text from file
            File file = ResourceUtils.getFile("classpath:SQL File/" + QUERY_FILE_3);
            String content = new String(Files.readAllBytes(file.toPath()));

            content += "WHERE smartphone_modifier.smartphone_modifier_id = '" + modifierId + "' AND smartphone.color ='" + color + "'\n"
                    + "GROUP BY sim.smartphone_model_id, unlock_security.smartphone_model_id";

            ResultSet rs = statement.executeQuery(content);

            ResultSetMetaData rsmd = rs.getMetaData();

            setSmartphoneSpecification(request, rs);

            con.close();
        } catch (IOException | ClassNotFoundException | NumberFormatException | SQLException e) {
            System.out.println(e);
        }
    }

    public static void setSmartphoneSpecification(HttpServletRequest request, ResultSet rs) throws SQLException {
        List<Smartphone> smartphoneDetails = new ArrayList<>();
        while (rs.next()) {
            Smartphone smartphone = new Smartphone();

            smartphone.setDisplayType(rs.getString(1));
            smartphone.setDisplaySize(rs.getString(2));
            smartphone.setDisplayRatio(rs.getString(3));
            smartphone.setResolution(rs.getString(4));
            smartphone.setPixelDensity(rs.getString(5));
            smartphone.setDisplayFeature(rs.getString(6));

            smartphone.setFrontCamera(rs.getString(7));
            smartphone.setBackCamera(rs.getString(8));
            smartphone.setCameraFeature(rs.getString(9));
            smartphone.setVideoFeature(rs.getString(10));

            smartphone.setOs(rs.getString(11));

            smartphone.setCpu(rs.getString(12));
            smartphone.setFrequency(rs.getString(13));
            smartphone.setGpu(rs.getString(14));

            smartphone.setRam(rs.getString(15));
            smartphone.setRom(rs.getString(16));

            smartphone.setMemoryCard(rs.getString(17));
            smartphone.setSimType(rs.getString(18));

            smartphone.setMobileNetwork(rs.getString(19));
            smartphone.setWlan(rs.getString(20));
            smartphone.setBluetooth(rs.getString(21));
            smartphone.setHeadphoneJack(rs.getString(22));

            smartphone.setUnlockSecurity(rs.getString(23));

            smartphone.setBodyProtection(rs.getString(24));
            smartphone.setFrameProtection(rs.getString(25));
            smartphone.setScreenProtection(rs.getString(26));
            smartphone.setSize(rs.getString(27));
            smartphone.setWeight(rs.getString(28));
            smartphone.setDesignFeature(rs.getString(29));

            smartphone.setBatteryCapacity(rs.getString(30));
            smartphone.setBatteryType(rs.getString(31));
            smartphone.setQuickCharge(rs.getString(32));
            smartphone.setChargingPort(rs.getString(33));
            smartphone.setBatteryFeature(rs.getString(34));

            smartphone.setPrice(rs.getString(35));
            smartphone.setImageFile(rs.getString(36));
            smartphone.setColor(rs.getString(37));

            smartphoneDetails.add(smartphone);
        }

        request.setAttribute("smartphoneDetails", smartphoneDetails);
    }
}
