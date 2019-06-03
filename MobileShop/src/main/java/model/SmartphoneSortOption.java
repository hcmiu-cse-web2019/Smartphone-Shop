/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author KiroHikaru
 */
public enum SmartphoneSortOption {
    DEFAULT,
    PRICE_ASC, 
    PRICE_DESC,
    PERFORMANCE_ASC,
    PERFORMANCE_DESC,
    DATE_RELEASED_LATEST;

    @Override
    public String toString() {
        switch (this){
            case DEFAULT:               return "";
            case PRICE_ASC:             return "ORDER BY smartphone_modifier.price ASC";
            case PRICE_DESC:            return "ORDER BY smartphone_modifier.price DESC";
            case PERFORMANCE_ASC:       return "ORDER BY cpu.performance_rating ASC";
            case PERFORMANCE_DESC:      return "ORDER BY cpu.performance_rating DESC";
            case DATE_RELEASED_LATEST:  return "ORDER BY smartphone_model.date_released DESC";
            default: throw new AssertionError("Unknown operations " + this);
        }
    }  
}
