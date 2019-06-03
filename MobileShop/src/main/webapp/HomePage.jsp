<%-- 
    Document   : HomePage
    Created on : May 19, 2019, 11:21:37 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="HomePage.css">
        <title>HC Store</title>
    </head>
    <body>
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
            <div class="category">
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
            <div class="login">
                <a href="" style="text-decoration: none;">
                    <button id="login-button">
                        <img src="IMAGE/ICON/Login_25px.png">Login
                    </button>
                </a>
            </div>
            <div class="header-unused-2"></div>
            <div class="side-1" align="center" style="padding: 5.65vh 0% 0% 0%;">
                <a href="http://www.saigonco-op.com.vn/?utm_source=VnExpress&utm_medium=statis&utm_campaign=C187335" target="_blank">
                    <img src="IMAGE/AD/banner1.png">
                </a>  
            </div>
            <div class="middle" align="center">
                <div style="text-align: center; padding: 2% 0% 0% 0%">
                    <b>
                        This page is under development
                    </b>
                </div>

                <div style="padding: 2% 0% 2% 0%;">
                    <b>MOST PROMINENT PHONE</b>
                </div>
                <div style="padding: 0% 0% 5% 0%;">
                    <table style="text-align: center; font-weight: bold">
                        <tr>
                            <td>
                                <a href="Smartphone"><img src="IMAGE/HOMEPAGE/oppo-f11-pro-ft-3-6.jpg" alt="OPPO F11 Pro 64GB" width="500" height="250"></a><br>
                                OPPO F11 Pro 64GB
                                <div class="price"><strong>8.490.000₫</strong></div>
                            </td>
                            <td>
                                <a href="SmartphoneDetail?modelId=1&modifierId=1&color=Space%20Gray"><img width="180" height="180" src="IMAGE/HOMEPAGE/iphone-xs-max-gray-400x400.jpg" alt="iPhone Xs Max 64GB" /></a><br>
                                iPhone Xs Max 64GB
                                <div class="price"><strong>29.990.000₫</strong></div>
                            </td>
                            <td>
                                <a href="SmartphoneDetail?modelId=14&modifierId=25&color=Midnight%20Black"><img width="180" height="180" src="IMAGE/HOMEPAGE/samsung-galaxy-note8-black-1-600x600-600x600-400x400.jpg" alt="Samsung Galaxy Note 8" /></a><br>
                                Samsung Galaxy Note 8
                                <div class="price"><strong>11.990.000₫</strong></div>
                            </td>
                            <td>
                                <a href="SmartphoneDetail?modelId=7&modifierId=15&color=Gold"><img width="180" height="180" src="IMAGE/HOMEPAGE/iphone-7-plus-32gb-gold-600x600-400x400.jpg" alt="iPhone 7 Plus 32GB" /></a><br>
                                iPhone 7 Plus 32GB
                                <div class="price"><strong>12.990.000₫</strong></div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href="Smartphone"><img src="IMAGE/HOMEPAGE/samsung-galaxy-a10-ft-2-1.jpg" alt="Samsung Galaxy A10" width="500" height="250"></a><br>
                                Samsung Galaxy A10
                                <div class="price"><strong>3.090.000₫</strong></div>
                            </td>
                            <td>
                                <a href="Smartphone"><img width="180" height="180" src="IMAGE/HOMEPAGE/oppo-f11-mtp-400x400.jpg" alt="OPPO F11" /></a><br>
                                OPPO F11
                                <div class="price"><strong>7.290.000₫</strong></div>
                            </td>
                            <td>
                                <a href="SmartphoneDetail?modelId=8&modifierId=16&color=Black"><img width="180" height="180" src="IMAGE/HOMEPAGE/iphone-7-hh-400x400.jpg" alt="iPhone 7 32GB" /></a><br>
                                iPhone 7 32GB
                                <div class="price"><strong>10.990.000₫</strong></div>
                            </td>
                            <td>
                                <a href="Smartphone"><img width="180" height="180" src="IMAGE/HOMEPAGE/huawei-p30-lite-1-400x400.jpg" alt="Huawei P30 Lite" /></a><br>
                                Huawei P30 Lite
                                <div class="price"><strong>7.490.000₫</strong></div>
                            </td>
                        </tr>
                    </table>
                </div>

                <div style="padding: 2% 0% 2% 0%;">
                    <b>MOST PROMINENT LAPTOP</b>
                </div>

                <div style="padding: 0% 0% 5% 0%;">
                    <table style="text-align: center; font-weight: bold">
                        <tr>
                            <td>
                                <a href="Laptop"><img src="IMAGE/HOMEPAGE/dell-inspiron-3576-i5-8250u-70157552-1.jpg" alt="Dell Inspiron 3576 i5 8250U" width="500" height="250"></a><br>
                                Dell Inspiron 3576 i5 8250U (70157552)
                                <div class="price"><strong>15.490.000₫</strong></div>
                            </td>
                            <td>
                                <a href="Laptop"><img width="180" height="180" src="IMAGE/HOMEPAGE/Laptop-Acer-Predator-Helios-300-G3-572-50XL-2.jpg" alt="Acer-Predator-Helios-300-G3-572-50XL-2" /></a><br>
                                Acer Predator Helios 300<br>
                                PH315-51-759Y
                                <div class="price"><strong>40,999,000₫</strong></div>
                            </td>
                            <td>
                                <a href="Laptop"><img width="180" height="180" src="IMAGE/HOMEPAGE/636384034193136493_HP-Envy-13-ad076TU-3.png" alt="HP Pavilion 15-cs01045TX (5JL29PA)" /></a><br>
                                HP Pavilion cs01045TX<br>
                                (5JL29PA)
                                <div class="price"><strong>15,890,000₫</strong></div>
                            </td>
                            <td>
                                <a href="Laptop"><img width="180" height="180" src="IMAGE/HOMEPAGE/apple-macbook-air-mre82sa-a-i5-8gb-128gb-2018-2-1-org.jpg" alt="Apple Macbook Air 2018 (MRE82SA/A)" /></a><br>
                                Apple Macbook Air 2018<br>
                                (MRE82SA/A)
                                <div class="price"><strong>31,490,000₫</strong></div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="side-2" align="center" style="padding: 5.65vh 0% 0% 0%;">
                <a href="https://www.sendo.vn/su-kien/sinh-nhat-sendo?utm_source=eclick&utm_medium=cpm-adnet&utm_campaign=tq_pc-bannersky_event-sinhnhat7tuoi-display_na_na_na_na_na&shortlink=82a4efd7&pid=Display_eclick_cpm-adnet_tq_pc-bannersky_2_event-sinhnhat7tuoi-display_na_na_na_na_na_300519&c=Display_eclick_cpm-adnet_tq_pc-bannersky_2_event-sinhnhat7tuoi-display_na_na_na_na_na_300519&is_retargeting=true" target="_blank">
                    <img src="IMAGE/AD/banner2.png">
                </a>
            </div>
            <div class="footer">
                © Copyright 2019 Anh Huy. All rights reserved. <br>
                https://github.com/HCMIU-CSE-DATABASE2019/Laptop-Store
            </div>
        </div>
    </body>
</html>
