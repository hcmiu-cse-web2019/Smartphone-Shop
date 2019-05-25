/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author KiroHikaru
 */
public enum LaptopSortOption {
    DEFAULT,
    PRICE_ASC, 
    PRICE_DESC,
    BRAND_ASC, 
    BRAND_DESC;

    @Override
    public String toString() {
        switch (this){
            case DEFAULT: return "";
            case PRICE_ASC: return "ORDER BY laptop.laptop_price ASC";
            case PRICE_DESC: return "ORDER BY laptop.laptop_price DESC";
            case BRAND_ASC: return "ORDER BY laptopbrand.laptop_brand_name ASC";
            case BRAND_DESC: return "ORDER BY laptopbrand.laptop_brand_name DESC";
            default: throw new AssertionError("Unknown operations " + this);
        }
    }  
}
