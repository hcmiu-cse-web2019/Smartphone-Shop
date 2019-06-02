<%-- 
    Document   : SmartphoneDetail
    Created on : May 30, 2019, 8:59:17 PM
    Author     : KiroHikaru
--%>

<%@page import="model.SmartphoneColor"%>
<%@page import="model.SmartphoneModifier"%>
<%@page import="java.util.List"%>
<%@page import="model.Smartphone"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="smartphoneDetail2.css">
        <!--<link rel="stylesheet" type="text/css" href="header.css">-->
        <title>HC Store - Smartphone</title>
    </head>
    <body>
        <%
            List<SmartphoneModifier> smartphoneModifiers = (ArrayList<SmartphoneModifier>) request.getAttribute("smartphoneModifiers");
            List<SmartphoneColor> smartphoneColors = (ArrayList<SmartphoneColor>) request.getAttribute("smartphoneColors");
            List<Smartphone> smartphoneDetails = (ArrayList<Smartphone>) request.getAttribute("smartphoneDetails");
        %>
        <div class="container">
            <div class="header-unused-1"></div>
            <div class="title-name">
                <span>
                    <a href="HomePage.jsp">
                        HC Store
                    </a>
                </span>
            </div>
            <div class="search">
                <form id="search-form" method="POST" action="Laptop">
                    <input type="text" id="search-text" name="searchText" placeholder="Search.." align="center">
                    <button type="submit" id="search-button" alt="Search">
                        <img src="IMAGE/ICON/Search_25px.png">
                    </button>
                </form>   
            </div>
            <div class="category" align="center">
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
            </div>
            <div class="login" align="center">
                <a href="" style="text-decoration: none;">
                    <button id="login-button">
                        <img src="IMAGE/ICON/Login_25px.png">Login
                    </button>
                </a>
            </div>
            <div class="header-unused-2"></div>
            <div class="nav" align="center">
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
            </div>
            <div class="side-1" align="center">
                <a href="http://www.saigonco-op.com.vn/?utm_source=VnExpress&utm_medium=statis&utm_campaign=C187335" target="_blank">
                    <img src="IMAGE/AD/banner1.png">
                </a>  
            </div>
            <div class="side-2" align="center">
                <a href="https://www.sendo.vn/su-kien/sinh-nhat-sendo?utm_source=eclick&utm_medium=cpm-adnet&utm_campaign=tq_pc-bannersky_event-sinhnhat7tuoi-display_na_na_na_na_na&shortlink=82a4efd7&pid=Display_eclick_cpm-adnet_tq_pc-bannersky_2_event-sinhnhat7tuoi-display_na_na_na_na_na_300519&c=Display_eclick_cpm-adnet_tq_pc-bannersky_2_event-sinhnhat7tuoi-display_na_na_na_na_na_300519&is_retargeting=true" target="_blank">
                    <img src="IMAGE/AD/banner2.png">
                </a>
            </div>
            <div class="left" align="center">
                <div style="font-size: 200%"><%= smartphoneModifiers.get(0).getName()%> (<%= smartphoneDetails.get(0).getColor() %>)</div>

                <img style="width: 55%"src="IMAGE/SMARTPHONE/<%= smartphoneDetails.get(0).getImageFile() %>">

                <table cellspacing="0">
                    <tr>
                        <%
                            for (SmartphoneColor smartphoneColor : smartphoneColors) {
                        %>
                        <td>
                            <table>
                                <tr align="center"><td><img style="width: 5vw;" src="IMAGE/SMARTPHONE/<%= smartphoneColor.getImageFile()%>"></td></tr>
                                <tr align="center"><td><%= smartphoneColor.getColor()%></td></tr>
                            </table>            
                        </td>
                        <%
                            }
                        %>
                    </tr>
                </table>

            </div>
            <div class="right" align="center">
                <table>
                    <tr>
                        <%
                            for (SmartphoneModifier smartphoneModifier : smartphoneModifiers) {
                        %>        
                        <td>
                            <a href="SmartphoneDetail?modelId=<%= smartphoneModifier.getModelId()%>&modifierId=<%= smartphoneModifier.getModifierId()%>">
                                <table cellspacing="7.5" id="modifierOptionButton">
                                    <tr><td align="center"><%= smartphoneModifier.getRam()%> / <%= smartphoneModifier.getRom()%> </td></tr>
                                    <tr><th style="color: #e22424;"><%= smartphoneModifier.getPrice()%></th></tr>
                                </table>
                            </a>
                        </td>
                        <% }%>
                    </tr>
                </table>
                <div style="color: #e22424; font-size: 250%; margin-top: 15vh;">
                    <b>
                        <%= smartphoneDetails.get(0).getPrice()%>
                    </b>
                </div>
                <div>
                    <form method="POST" action="Laptop">  
                        <input style="padding: 1% 5% 1% 5%; margin-top: 5%; font-size: 250%"id="apply-button" type="submit" value="Buy Now">
                    </form>
                </div>
            </div>

            <div class="bottom" align="center">
                <hr>
                <span font-size: 130%;">
                      <b>Technical Specification</b>
                </span>
                <table cellpadding="3%" style="border: 1px; border-collapse: collapse;">
                    <tr><th rowspan="6">Display</th></tr>
                    <tr><td >Technology</td><td><%= smartphoneDetails.get(0).getDisplayType()%></td></tr>
                    <tr><td>Resolution</td><td><%= smartphoneDetails.get(0).getResolution()%></td></tr>
                    <tr><td>Ratio</td><td><%= smartphoneDetails.get(0).getDisplayRatio()%></td></tr>
                    <tr><td>Pixel Density</td><td><%= smartphoneDetails.get(0).getPixelDensity()%></td></tr>
                    <tr><td>Feature</td><td><%= smartphoneDetails.get(0).getDisplayFeature()%></td></tr>

                    <tr><th rowspan="5">Camera</th></tr>
                    <tr><td>Front Camera</td><td><%= smartphoneDetails.get(0).getFrontCamera()%></td></tr>
                    <tr><td>Back Camera</td><td><%= smartphoneDetails.get(0).getBackCamera()%></td></tr>
                    <tr><td>Feature</td><td><%= smartphoneDetails.get(0).getCameraFeature()%></td></tr>
                    <tr><td>Video</td><td><%= smartphoneDetails.get(0).getVideoFeature()%></td></tr>

                    <tr><th rowspan="2">Operating System</th></tr>
                    <tr><td>OS</td><td><%= smartphoneDetails.get(0).getOs()%></td></tr>

                    <tr><th rowspan="4">Processor</th></tr>
                    <tr><td>CPU</td><td><%= smartphoneDetails.get(0).getCpu()%></td></tr>
                    <tr><td>Frequency</td><td><%= smartphoneDetails.get(0).getFrequency()%></td></tr>
                    <tr><td>GPU</td><td><%= smartphoneDetails.get(0).getGpu()%></td></tr>

                    <tr><th rowspan="3">Memory</th></tr>
                    <tr><td>RAM</td><td><%= smartphoneDetails.get(0).getRam()%></td></tr>
                    <tr><td>ROM</td><td><%= smartphoneDetails.get(0).getRom()%></td></tr>

                    <tr><th rowspan="3">SIM</th></tr>
                    <tr><td>SIM Slot</td><td><%= smartphoneDetails.get(0).getMemoryCard()%></td></tr>
                    <tr><td>Type</td><td><%= smartphoneDetails.get(0).getSimType()%></td></tr>

                    <tr><th rowspan="5">Connection</th></tr>
                    <tr><td>Mobile Network</td><td><%= smartphoneDetails.get(0).getMobileNetwork()%></td></tr>
                    <tr><td>WLAN</td><td><%= smartphoneDetails.get(0).getWlan()%></td></tr>
                    <tr><td>Bluetooth</td><td><%= smartphoneDetails.get(0).getBluetooth()%></td></tr>
                    <tr><td>Headphone Jack</td><td><%= smartphoneDetails.get(0).getHeadphoneJack()%></td></tr>

                    <tr><th rowspan="2">Security</th></tr>
                    <tr><td>Screen Unlock</td><td><%= smartphoneDetails.get(0).getUnlockSecurity()%></td></tr>

                    <tr><th rowspan="7">Design</th></tr>
                    <tr><td>Body</td><td><%= smartphoneDetails.get(0).getBodyProtection()%></td></tr>
                    <tr><td>Frame</td><td><%= smartphoneDetails.get(0).getFrameProtection()%></td></tr>
                    <tr><td>Screen</td><td><%= smartphoneDetails.get(0).getScreenProtection()%></td></tr>
                    <tr><td>Size</td><td><%= smartphoneDetails.get(0).getSize()%></td></tr>
                    <tr><td>Weight</td><td><%= smartphoneDetails.get(0).getWeight()%></td></tr>
                    <tr><td>Feature</td><td><%= smartphoneDetails.get(0).getDesignFeature()%></td></tr>

                    <tr><th rowspan="6">Battery</th></tr>
                    <tr><td>Capacity</td><td><%= smartphoneDetails.get(0).getBatteryCapacity()%></td></tr>
                    <tr><td>Type</td><td><%= smartphoneDetails.get(0).getBatteryType()%></td></tr>
                    <tr><td>Quick Charge</td><td><%= smartphoneDetails.get(0).getQuickCharge()%></td></tr>
                    <tr><td>Charging Port</td><td><%= smartphoneDetails.get(0).getChargingPort()%></td></tr>
                    <tr><td>Feature</td><td><%= smartphoneDetails.get(0).getBatteryFeature()%></td></tr>
                </table>
            </div>
            <div class="footer">
                © Copyright 2019 Anh Huy. All rights reserved. <br>
                https://github.com/HCMIU-CSE-DATABASE2019/Laptop-Store
            </div>
        </div>
    </body>
</html>
