

import java.math.BigInteger;
import java.security.MessageDigest;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

/**
 * @Author Kiro Hikaru
 * @Version 1.2
 * @Since Dec-17-2018
 */
public abstract class Encryptor {
    
    /**
     * Convert String to Hex.
     * @param arg String to convert
     * @return String of the hex code
     */
    public static String stringToHex(String arg) {
	return String.format("%040x", new BigInteger(1, arg.getBytes(/*YOUR_CHARSET?*/)));
    }

    /**
     * Convert Hex to String.
     * @param hex String
     * @return String of the converted hex code
     */
    public static String hexToString(String hex) {
	StringBuilder str = new StringBuilder();
	for (int i = 0; i < hex.length(); i += 2) {
	    str.append((char) Integer.parseInt(hex.substring(i, i + 2), 16));
	}
	return str.toString().trim();
    }
    
    /**
     * Convert String to LocalDate (yyyy-MM-dd).
     * @param arg String
     * @return LocalDate type
     */
    public static LocalDate stringToDate(String arg) {
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH);
	LocalDate date = LocalDate.parse(arg, formatter);
	return date;
    }
    
    /**
     * Convert LocalDate to String (yyyy-MM-dd).
     * @param date LocalDate
     * @return String of the LocalDate
     */
    public static String dateToString(LocalDate date) {
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH);
	String formattedString = date.format(formatter);
	return formattedString;
    }
    
    /**
     * Convert String to hash code based on SHA-512 security.
     * @param input String
     * @return String of the hash code
     */
    public static String stringToSha512(String input){

	try {
	    MessageDigest digest = MessageDigest.getInstance("SHA-512");

	    //Applies sha256 to our input, 
	    byte[] hash = digest.digest(input.getBytes("UTF-8"));

	    StringBuffer hexString = new StringBuffer(); // This will contain hash as hexadecimal
	    for (int i = 0; i < hash.length; i++) {
		String hex = Integer.toHexString(0xff & hash[i]);
		if(hex.length() == 1) hexString.append('0');
		hexString.append(hex);
	    }
	    return hexString.toString();
	}
	catch(Exception e) {
	    throw new RuntimeException(e);
	}
    }
}
