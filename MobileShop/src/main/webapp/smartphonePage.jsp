<%-- 
    Document   : products
    Created on : May 9, 2019, 5:51:09 PM
    Author     : KiroHikaru
--%>

<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="model.Laptop"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="smartphonePage.css">
<<<<<<< HEAD
        <script src="laptopPage.js"></script>
=======
        <link rel="stylesheet" type="text/css" href="header.css">
        <link rel="stylesheet" type="text/css" href="nav.css">
        <link rel="stylesheet" type="text/css" href="footer.css">
>>>>>>> 7fa39392c895d9e499dcab6395593abb56a9ce05
        <title>HC Store - Smartphone</title>
    </head>
    <body>
        <header>
            
            <span style="padding-left: 20%;">
                <a href="HomePage.jsp">
                    HC Store
                </a>
            </span>

            <a href="Laptop" style="text-decoration: none;">
                <button id="category-button">
                    <img src="IMAGE/ICON/Laptop_25px.png">Laptop
                </button> 
            </a>

            <a href="Smartphone" style="text-decoration: none;">
                <button id="category-button" >
                    <img src="IMAGE/ICON/Touchscreen_25px.png">Smartphone
                </button> 
            </a>

            <form id="search-form" method="POST" action="Laptop">
                <input type="text" id="search-text" name="searchText" placeholder="Search..">
                <button type="submit" id="search-button" alt="Search">
                    <img src="IMAGE/ICON/Search_25px.png">
                </button>
            </form>   

            <button id="login-button">
                <img src="IMAGE/ICON/Login_25px.png">Login
            </button>
        </header>
        <nav align="center">
            <form method="POST" action="Laptop">  
                <b>Sort by &emsp;</b>
                <select name="sortOption"align="center" style="padding: 0.35% 1.5% 0.35% 1.5%; font-size: 105%;">
                    <option name="sortOption" value="0">(None)</option>
                    <option name="sortOption" value="1">Price (Ascending)</option>
                    <option name="sortOption" value="2">Price (Descending)</option>
                    <option name="sortOption" value="3">Brand (Ascending)</option>
                    <option name="sortOption" value="4">Brand (Descending)</option>
                </select>
                <input id="apply-button" type="submit" value="Apply">
            </form>
        </nav>

        <div class="row">
            <div class="column side">
                <a href="http://www.saigonco-op.com.vn/?utm_source=VnExpress&utm_medium=statis&utm_campaign=C187335" target="_blank">
                    <img src="IMAGE/AD/banner1.png">
                </a>   
            </div>

            <div class="column middle">
                <form>
                    <table align="center" cellpadding="20px" style="border: 1px; border-collapse: collapse;">
                        <%
                            List<Product> productList = (ArrayList<Product>) request.getAttribute("productList");
                            int productCount = Integer.parseInt(request.getAttribute("productCount").toString());
 
                            out.println("<tr>");
                            for (int i = 0; i < productCount; i++) {
                                out.println("<td>");
                                out.println("   <a href=\"#\">");
                                out.println("       <table align=\"center\" style=\"text-align: center;\">");
                                out.println("           <tr><td><img style=\"height: 300px;\"src=\"IMAGE/SMARTPHONE/" + productList.get(i).getImage() + "\"></td></tr>");
                                out.println("           <tr><th>" + productList.get(i).getName() + "</th></tr>");
                                out.println("           <tr><td>" + productList.get(i).getPrice() + "</td></tr>");
                                out.println("       </table>");
                                out.println("   </a>");
                                out.println("</td>");

                                if ((i + 1) % 4 == 0) {
                                    out.println("</tr>");
                                    out.println("<tr>");
                                }
                            }
                            out.println("</tr>");
                        %>
                    </table>  
                </form>
            </div>
            <div class="column side">
                <a href="https://www.sendo.vn/su-kien/sinh-nhat-sendo?utm_source=eclick&utm_medium=cpm-adnet&utm_campaign=tq_pc-bannersky_event-sinhnhat7tuoi-display_na_na_na_na_na&shortlink=82a4efd7&pid=Display_eclick_cpm-adnet_tq_pc-bannersky_2_event-sinhnhat7tuoi-display_na_na_na_na_na_300519&c=Display_eclick_cpm-adnet_tq_pc-bannersky_2_event-sinhnhat7tuoi-display_na_na_na_na_na_300519&is_retargeting=true" target="_blank">
                    <img src="IMAGE/AD/banner2.png">
                </a>
            </div>
        </div>

        <footer>
            © Copyright 2019 Anh Huy. All rights reserved. <br>
            https://github.com/HCMIU-CSE-DATABASE2019/Laptop-Store
        </footer>
    </body>
</html>
