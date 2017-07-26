package gr.iteam.istqbexams.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormatter {
	
	public static Date now(){
		SimpleDateFormat  dateFormat = new SimpleDateFormat ("HH:mm:ss dd/MM/yyyy");
		Date now = new Date();
		System.out.println(dateFormat.format(now));
		Date date = null;
		try {
			date = dateFormat.parse(dateFormat.format(now));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(date);
		return date;
	}

}
