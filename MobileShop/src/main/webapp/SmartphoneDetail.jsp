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
        <link rel="stylesheet" type="text/css" href="SmartphoneDetail.css">
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
                <form id="search-form" method="POST" action="Smartphone">
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
            <div class="nav" align="center" style="padding: 1.45% 0% 1.45% 0%"></div>
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
                <div style="font-size: 200%"><%= smartphoneModifiers.get(0).getName()%> (<%= smartphoneDetails.get(0).getColor()%>)</div>

                <img style="width: 55%"src="IMAGE/SMARTPHONE/<%= smartphoneDetails.get(0).getImageFile()%>">

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
                <div style="font-size: 125%; padding: 2% 0% 2% 0%">
                    You are selecting version <b><%=smartphoneDetails.get(0).getRam()%> / <%=smartphoneDetails.get(0).getRom()%></b>
                </div>
                <div style="font-size: 125%; padding: 5% 0% 2% 0%">
                    RAM / ROM option
                </div>
                <table>
                    <tr>
                        <%
                            for (SmartphoneModifier smartphoneModifier : smartphoneModifiers) {
                        %>        
                        <td>
                            <a href="SmartphoneDetail?modelId=<%= smartphoneModifier.getModelId()%>&modifierId=<%= smartphoneModifier.getModifierId()%>&color=<%= smartphoneModifier.getColor()%>">
                                <table cellspacing="7.5" id="modifierOptionButton">
                                    <tr><td align="center"><b><%= smartphoneModifier.getRam()%> / <%= smartphoneModifier.getRom()%></b></td></tr>
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
                <table cellpadding="3%" style="border: 1px; border-collapse: collapse;">
                    <caption style="font-size: 150%; padding: 2%">
                        <b>Technical Specification</b>
                    </caption>
                    <tr><th rowspan="6" style="color: #8e5711">Display</th></tr>
                    <tr><td><b>Technology       </b></td><td><%= smartphoneDetails.get(0).getDisplayType()%></td></tr>
                    <tr><td><b>Resolution       </b></td><td><%= smartphoneDetails.get(0).getResolution()%></td></tr>
                    <tr><td><b>Ratio            </b></td><td><%= smartphoneDetails.get(0).getDisplayRatio()%></td></tr>
                    <tr><td><b>Pixel Density    </b></td><td><%= smartphoneDetails.get(0).getPixelDensity()%></td></tr>
                    <tr><td><b>Feature          </b></td><td><%= smartphoneDetails.get(0).getDisplayFeature()%></td></tr>

                    <tr><th rowspan="5" style="color: #8e5711">Camera</th></tr>
                    <tr><td><b>Front Camera     </b></td><td><%= smartphoneDetails.get(0).getFrontCamera()%></td></tr>
                    <tr><td><b>Back Camera      </b></td><td><%= smartphoneDetails.get(0).getBackCamera()%></td></tr>
                    <tr><td><b>Feature          </b></td><td><%= smartphoneDetails.get(0).getCameraFeature()%></td></tr>
                    <tr><td><b>Video            </b></td><td><%= smartphoneDetails.get(0).getVideoFeature()%></td></tr>

                    <tr><th rowspan="2" style="color: #8e5711">Operating System</th></tr>
                    <tr><td><b>OS               </b></td><td><%= smartphoneDetails.get(0).getOs()%></td></tr>

                    <tr><th rowspan="4" style="color: #8e5711">Processor</th></tr>
                    <tr><td><b>CPU              </b></td><td><%= smartphoneDetails.get(0).getCpu()%></td></tr>
                    <tr><td><b>Frequency        </b></td><td><%= smartphoneDetails.get(0).getFrequency()%></td></tr>
                    <tr><td><b>GPU              </b></td><td><%= smartphoneDetails.get(0).getGpu()%></td></tr>

                    <tr><th rowspan="3" style="color: #8e5711">Memory</th></tr>
                    <tr><td><b>RAM              </b></td><td><%= smartphoneDetails.get(0).getRam()%></td></tr>
                    <tr><td><b>ROM              </b></td><td><%= smartphoneDetails.get(0).getRom()%></td></tr>

                    <tr><th rowspan="3" style="color: #8e5711">SIM</th></tr>
                    <tr><td><b>SIM Slot         </b></td><td><%= smartphoneDetails.get(0).getMemoryCard()%></td></tr>
                    <tr><td><b>Type             </b></td><td><%= smartphoneDetails.get(0).getSimType()%></td></tr>

                    <tr><th rowspan="5" style="color: #8e5711">Connection</th></tr>
                    <tr><td><b>Mobile Network   </b></td><td><%= smartphoneDetails.get(0).getMobileNetwork()%></td></tr>
                    <tr><td><b>WLAN             </b></td><td><%= smartphoneDetails.get(0).getWlan()%></td></tr>
                    <tr><td><b>Bluetooth        </b></td><td><%= smartphoneDetails.get(0).getBluetooth()%></td></tr>
                    <tr><td><b>Headphone Jack   </b></td><td><%= smartphoneDetails.get(0).getHeadphoneJack()%></td></tr>

                    <tr><th rowspan="2" style="color: #8e5711">Security</th></tr>
                    <tr><td><b>Screen Unlock    </b></td><td><%= smartphoneDetails.get(0).getUnlockSecurity()%></td></tr>

                    <tr><th rowspan="7" style="color: #8e5711">Design</th></tr>
                    <tr><td><b>Body             </b></td><td><%= smartphoneDetails.get(0).getBodyProtection()%></td></tr>
                    <tr><td><b>Frame            </b></td><td><%= smartphoneDetails.get(0).getFrameProtection()%></td></tr>
                    <tr><td><b>Screen           </b></td><td><%= smartphoneDetails.get(0).getScreenProtection()%></td></tr>
                    <tr><td><b>Size             </b></td><td><%= smartphoneDetails.get(0).getSize()%></td></tr>
                    <tr><td><b>Weight           </b></td><td><%= smartphoneDetails.get(0).getWeight()%></td></tr>
                    <tr><td><b>Feature          </b></td><td><%= smartphoneDetails.get(0).getDesignFeature()%></td></tr>

                    <tr><th rowspan="6" style="color: #8e5711">Battery</th></tr>
                    <tr><td><b>Capacity         </b></td><td><%= smartphoneDetails.get(0).getBatteryCapacity()%></td></tr>
                    <tr><td><b>Type             </b></td><td><%= smartphoneDetails.get(0).getBatteryType()%></td></tr>
                    <tr><td><b>Quick Charge     </b></td><td><%= smartphoneDetails.get(0).getQuickCharge()%></td></tr>
                    <tr><td><b>Charging Port    </b></td><td><%= smartphoneDetails.get(0).getChargingPort()%></td></tr>
                    <tr><td><b>Feature          </b></td><td><%= smartphoneDetails.get(0).getBatteryFeature()%></td></tr>
                </table>
            </div>
            <div class="footer">
                © Copyright 2019 Anh Huy. All rights reserved. <br>
                https://github.com/HCMIU-CSE-DATABASE2019/Laptop-Store
            </div>
        </div>
    </body>
</html>
