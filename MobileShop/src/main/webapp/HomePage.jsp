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
        <link rel="stylesheet" type="text/css" href="homepage.css">
        <script src="laptopPage.js"></script>
        <title>HC Store</title>
    </head>
    <body style="background-color: seashell">
        <header>
            <span style="padding-left: 20%;">HC Store</span>
            
            <form id="search-form" method="POST" action="Laptop">
                <input type="text" id="search-text" name="searchText" placeholder="Search..">
                <button type="submit" id="search-button" alt="Search">
                <img src="IMAGE/ICON/Search_25px.png">
                </button>
            </form>   
   
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
            
            <a href="login.html" style="text-decoration: none;">
                <button id="login-button">
                    <img src="IMAGE/ICON/Login_25px.png">Login
                </button>
            </a>
        </header>
        
        <br>
        <div style="padding-left: 20%">
        <table class="table1">
            <tr>
                <td>
                    <a href="link here"><img style="cursor:pointer" src="IMAGE/AD/ipx.png" alt="ip" width="800" height="300"></a></td>
                <td><div>Some ad here</div></td>
            </tr>
            
        </table>
        </div>
        <br>
            
        <div style ="padding-left: 20%">
            <b>MOST PROMINENT PHONE</b>
            <table>
                <tr>
                    <td>
                        <a href="link here"><img src="IMAGE/AD/oppo-f11-pro-ft-3-6.jpg" alt="OPPO F11 Pro 64GB" width="500" height="250"></a><br>
                        OPPO F11 Pro 64GB
                        <div class="price"><strong>8.490.000₫</strong></div>
                    </td>
                    <td>
                        <a href="link here"><img width="180" height="180" src="IMAGE/AD/iphone-xs-max-gray-400x400.jpg" alt="iPhone Xs Max 64GB" /></a><br>
                        iPhone Xs Max 64GB
                        <div class="price"><strong>29.990.000₫</strong></div>
                    </td>
                    <td>
                        <a href="link here"><img width="180" height="180" src="IMAGE/AD/samsung-galaxy-note8-black-1-600x600-600x600-400x400.jpg" alt="Samsung Galaxy Note 8" /></a><br>
                        Samsung Galaxy Note 8
                        <div class="price"><strong>11.990.000₫</strong></div>
                    </td>
                    <td>
                        <a href="link here"><img width="180" height="180" src="IMAGE/AD/iphone-7-plus-32gb-gold-600x600-400x400.jpg" alt="iPhone 7 Plus 32GB" /></a><br>
                        iPhone 7 Plus 32GB
                        <div class="price"><strong>12.990.000₫</strong></div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="link here"><img src="IMAGE/AD/samsung-galaxy-a10-ft-2-1.jpg" alt="Samsung Galaxy A10" width="500" height="250"></a><br>
                        Samsung Galaxy A10
                        <div class="price"><strong>3.090.000₫</strong></div>
                    </td>
                    <td>
                        <a href="link here"><img width="180" height="180" src="IMAGE/AD/oppo-f11-mtp-400x400.jpg" alt="OPPO F11" /></a><br>
                        OPPO F11
                        <div class="price"><strong>7.290.000₫</strong></div>
                    </td>
                    <td>
                        <a href="link here"><img width="180" height="180" src="IMAGE/AD/iphone-7-hh-400x400.jpg" alt="iPhone 7 32GB" /></a><br>
                        iPhone 7 32GB
                        <div class="price"><strong>10.990.000₫</strong></div>
                    </td>
                    <td>
                        <a href="link here"><img width="180" height="180" src="IMAGE/AD/huawei-p30-lite-1-400x400.jpg" alt="Huawei P30 Lite" /></a><br>
                        Huawei P30 Lite
                        <div class="price"><strong>7.490.000₫</strong></div>
                    </td>
                </tr>
            </table>
        </div>
        
        <br>
        
        <div style ="padding-left: 20%">
            <b>MOST PROMINENT LAPTOP</b>
            <table>
                <tr>
                    <td>
                        <a href="link here"><img src="IMAGE/AD/dell-inspiron-3576-i5-8250u-70157552-1.jpg" alt="Dell Inspiron 3576 i5 8250U" width="500" height="250"></a><br>
                        Dell Inspiron 3576 i5 8250U (70157552)
                        <div class="price"><strong>15.490.000₫</strong></div>
                    </td>
                    <td>
                        <a href="link here"><img width="180" height="180" src="IMAGE/AD/Laptop-Acer-Predator-Helios-300-G3-572-50XL-2.jpg" alt="Acer-Predator-Helios-300-G3-572-50XL-2" /></a><br>
                        Acer Predator Helios 300<br>
                        PH315-51-759Y
                        <div class="price"><strong>40,999,000₫</strong></div>
                    </td>
                    <td>
                        <a href="link here"><img width="180" height="180" src="IMAGE/AD/636384034193136493_HP-Envy-13-ad076TU-3.png" alt="HP Pavilion 15-cs01045TX (5JL29PA)" /></a><br>
                        HP Pavilion cs01045TX<br>
                        (5JL29PA)
                        <div class="price"><strong>15,890,000₫</strong></div>
                    </td>
                    <td>
                        <a href="link here"><img width="180" height="180" src="IMAGE/AD/apple-macbook-air-mre82sa-a-i5-8gb-128gb-2018-2-1-org.jpg" alt="Apple Macbook Air 2018 (MRE82SA/A)" /></a><br>
                        Apple Macbook Air 2018<br>
                        (MRE82SA/A)
                        <div class="price"><strong>31,490,000₫</strong></div>
                    </td>
                </tr>
            </table>
        </div>
        
        <br>
        
        <footer>
            © Copyright 2019 Anh Huy. All rights reserved. <br>
            https://github.com/HCMIU-CSE-DATABASE2019/Laptop-Store
        </footer>
        
        
        
    </body>
</html>
