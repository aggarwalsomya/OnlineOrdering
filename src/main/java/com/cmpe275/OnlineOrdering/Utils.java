package com.cmpe275.OnlineOrdering;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class Utils {
	
	/**
	 * 
	 * @return
	 */
	public String getCurrdate() {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String curdate = df.format(new Date());
		return curdate;
	}
	
	/**
	 * 
	 * @return
	 */
	public String getCurrtime() {
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm");
	    Date now = new Date();
	    String currtime = sdfTime.format(now);
	    return currtime;
	}
	
	/**
	 * This function will take the current date and return a list of dates for
	 * next 30 days.
	 * 
	 * @param curDate
	 * @return
	 * @throws ParseException
	 * @author Somya
	 */
	public List<String> getNextDates(String curDate) throws ParseException {
		List<String> dateList = new ArrayList<String>();
		dateList.add(curDate);

		final SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		for (int i = 0; i < 29; i++) {
			final Date date = format.parse(curDate);
			final Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			calendar.add(Calendar.DAY_OF_YEAR, 1);
			dateList.add(format.format(calendar.getTime()));
			curDate = format.format(calendar.getTime());
		}
		return dateList;
	}
	
	/**
	 * 
	 * @param part
	 * @return
	 */
		public String removeSpace(String part) {

			if (Character.isWhitespace(part.charAt(0))) {
				System.out.println("inside removespace:" + part);
				part = part.substring(1);
				System.out.println("inside removespace:" + part);
				return part;
			} else
				return part;

		}
/**
 * 
 * @param mi
 * @return
 */
		public Map<String, Integer> deserializeMenuItems(String mi) {
			if(mi.length() == 0 || mi == null)
				return new HashMap<String, Integer>();
			
			String[] items = mi.split(";;");
			Map<String, Integer> menu_items = new TreeMap<String, Integer>();
			for (String item : items) {
				String[] parts = item.split("::");
				System.out.println("items are: " + parts[0]);
				parts[0] = removeSpace(parts[0]);
				menu_items.put(parts[0], Integer.parseInt(parts[1]));
			}
			return menu_items;
		}
	
	/**
	 * 
	 * @param menuItems
	 * @return
	 */
	public String serializeMenuItems(Map<String, Integer> menuItems) {
		String serializedString = " ";
		for (Map.Entry<String, Integer> entry : menuItems.entrySet()) {
			serializedString += entry.getKey() + "::" + Integer.toString(entry.getValue());
			serializedString += ";;";
		}
		return serializedString;
	}
	
	/**
	 * 
	 * @param earlytime
	 * @return
	 */
	public String convertMinsToTime(int earlytime) {
		String startTime = "00:00";
		int h = earlytime / 60 + Integer.parseInt(startTime.substring(0, 2));
		int m = earlytime % 60 + Integer.parseInt(startTime.substring(3, 5));
		String hr = String.valueOf(h);
		String min = String.valueOf(m);
		
		if(h <= 9)
			hr = "0"+h;
		if(m <= 9)
			min = "0"+m;
		
		String newtime = hr + ":" + min;
		return newtime;
	}
	
	/**
	 * 
	 * @return
	 */
	public int getCurrTimeInMins() {
		Calendar cal = Calendar.getInstance();
		int currMin = cal.get(Calendar.HOUR_OF_DAY) * 60
				+ cal.get(Calendar.MINUTE);
		return currMin;
	}
	
	/**
	 * 
	 * @param datetime
	 * @return
	 */
	public String getDateFromDateTime(String datetime) {
		//parsing the date and time from request
				String date = "";
				String parts[] = datetime.split(" ");
				if(parts.length == 2) {
					date = parts[0];
					System.out.println("Date::"+date);
				} else {
					date = null;
				}
				return date;
	}
	
	/**
	 * 
	 * @param datetime
	 * @return
	 */
	public String getTimeFromDateTime(String datetime) {
		// parsing the date and time from request
		String time = "";
		String parts[] = datetime.split(" ");
		if (parts.length == 2) {
			time = parts[1];
			System.out.println("time::" + time);
		} else {
			time = null;
		}
		return time;
	}
}
