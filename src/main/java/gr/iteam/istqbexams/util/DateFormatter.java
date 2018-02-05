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
		return date;
	}
	
	public static String timePassed(String time){
		String[] parts = time.split(":");
		String part1 = parts[0];
		String part2 = parts[1];

		int timeBefore = (Integer.parseInt(part1) * 60) + (Integer.parseInt(part2));
		int timeAfter = 3600 - timeBefore;
		
		int minutes = timeAfter / 60;
		int seconds = timeAfter % 60;
		String result = minutes + ":" + seconds;
		
		return result;
	}
}
