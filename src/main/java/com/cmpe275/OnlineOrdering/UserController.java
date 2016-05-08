package com.cmpe275.OnlineOrdering;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class UserController {

	public final String MAINCOURSE = "maincourse";
	public final String DESERT = "desert";
	public final String APPETIZER = "appetizer";
	public final String DRINK = "drink";
	public final String ORDERPLACED = "PLACED";

	//TODO remove this later
	public int last_order_id = 0;

	@Autowired
	private UserService userSvc;
	
	@Autowired
	private AdminService adminSvc;

	/**
	 * get data request for some menu name will be mapped here
	 * 
	 * @return It will return the required view
	 * @author Somya
	 */
	@RequestMapping(value = "/Menu/displayMenuItems", method = RequestMethod.POST)
	public String getData(HttpServletRequest request, Model model) {
		String category = request.getParameter("category");
		List<MenuItem> mi = userSvc.getMenuItems(category);

		if (mi == null) {
			model.addAttribute("category", category);
			return "ErrorFindMenuItem_User";
		}
		model.addAttribute("list", mi);
		return "GetUserMenuItems";
	}

	/**
	 * @param model
	 * @return
	 * @author Somya
	 */
	public String getDataForEachCategory(Model model) {
		String category[] = { MAINCOURSE, DRINK, DESERT, APPETIZER };
		for (int i = 0; i < category.length; i++) {
			List<MenuItem> mi = userSvc.getMenuItems(category[i]);
			model.addAttribute("list_" + category[i].toString(), mi);
		}
		return "GetUserMenuItems";
	}

	/**
	 * This function will take the current date and return a list of dates for next 30 days.
	 * @param curDate
	 * @return
	 * @throws ParseException
	 * @author Somya
	 */
	private List<String> getNextDates(String curDate) throws ParseException {
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
	
	private Map<String, Integer> deserializeMenuItems(String mi) {
		String[] items = mi.split(";;");
		Map<String, Integer> menu_items = new TreeMap<String, Integer>();
		for (String item: items) {
			String[] parts = item.split("::");
			menu_items.put(parts[0], Integer.parseInt(parts[1]));
		}
		return menu_items;
	}

	private String serializeMenuItems(Map<String, Integer> menuItems){
		//TODO:
		String serializedString = "";
		for (Map.Entry<String, Integer> entry: menuItems.entrySet()) {
			serializedString += entry.getKey() + "::" + Integer.toString(entry.getValue());
			serializedString += ";;";
		}
		return serializedString;
	}

	private Map<String, Integer> parseMenuItemsFromRequest() {
		//TODO: Integrate .dummy data for now
		Map<String, Integer> menuItems = new TreeMap<String, Integer>();
		menuItems.put("coke", 1);
		menuItems.put("chocolate fudge", 2);
		menuItems.put("brown rice", 3);
		menuItems.put("spring rolls", 4);
		menuItems.put("ice tea", 2);
		return menuItems;
	}
	
	
	/**
	 * It will generate the Random Id, if the id exists, it will generate a new one.
	 * @return the unique id
	 */
	private int getNextNonExistingOrderId(int user_id) {
		Random rn = new Random();
		rn.setSeed(System.currentTimeMillis());
		while (true) {
			int rand_id = rn.nextInt(Integer.SIZE - 1) % 10000;
			if (!userSvc.orderExists(user_id, rand_id)) {
				return rand_id;
			}
		}
	}


	/**
	 * This function will return the earliest pick up time for an order
	 * @return
	 * @throws ParseException
	 * @author Somya
	 */
	@RequestMapping(value = "/Menu/EarlyTime", method = RequestMethod.GET)
	public String getEarliestPickUpTime() throws ParseException {
		String curDate = "2016-05-11";
		List<String>daterange = getNextDates(curDate);
		int user_id = 123;
		int orderid = this.getNextNonExistingOrderId(user_id);
		this.last_order_id = orderid;
		// TODO: integrate
		Map<String, Integer> mi = this.parseMenuItemsFromRequest();
		int totalPrepTime = getTotalPrepTimeForMenu(mi);
		float totalPrice = this.getTotalPriceForMenu(mi);
		
		for(int id = 0; id < 30; id++) {
			int earlytime = getEarliestPickupForDate(totalPrepTime, daterange.get(id));
			if(earlytime >= 540 && earlytime <= 1080) {
				System.out.println("Earliest pick up time is:"+earlytime+" on:" + daterange.get(id));
				break;
			}
		}

		String menu_items_str = this.serializeMenuItems(mi);
		userSvc.placeOrder(user_id, orderid, menu_items_str, "pending");
		return "home";
	}

	/**
	 * This function will return the earliest pick up time for any chef on one date
	 * @param preptime
	 * @param date
	 * @return
	 * @author Somya
	 */
	private int getEarliestPickupForDate(int preptime, String date) {
		int earlyTime = 9999;

		for(int chefid = 1; chefid <= 3; chefid++) {
			earlyTime = Math.min(earlyTime, getEarliestTimeForChef(chefid, date, preptime));
		}

		return earlyTime;
	}
	
	/**
	 * This function contains the algo, it will check the earliest time on a day for a chef.
	 * @param chefid
	 * @param date
	 * @param preptime
	 * @return
	 * @author Somya
	 */
	private int getEarliestTimeForChef(int chefid, String date, int preptime) {

		Map<Integer, Integer> time = new TreeMap<Integer, Integer>();
		time = userSvc.getScheduleForChef(chefid, date);

		int a[] = new int[time.size()];
		int b[] = new int[time.size()];
		int id = 0;
		for (Map.Entry<Integer, Integer> entry : time.entrySet()) {
			a[id] = entry.getKey();
			b[id] = entry.getValue();
			id++;
		}
		//for(int i=0; i<a.length; i++)
		//	System.out.print(a[i]+"-"+b[i]+" ");

		int restOpen = 540;
		int restClose = 1080;

		// case where chef is all free
		if (a.length == 0)
			return restOpen + preptime;
		else {

			// see if chef can accomodate it as the first order of the day
			if (a[0] - restOpen >= preptime) {
				// chef can do this as first meal of the day.
				return restOpen + preptime;
			}

			// see if chef can accomodate in the middle of the day schedule
			for (int i = 0; i < a.length - 1; i++) {
				if (a[i + 1] - b[i] >= preptime)
					return b[i] + preptime;
			}

			// see if chef can accomodate in the end
			if (restClose - b[b.length - 1] >= preptime)
				return b[b.length - 1] + preptime;

			return 9999;
		}
	}
	
	/**
	 * This function will return the total prep time for a list of menu item names
	 * @param MenuItemNames
	 * @return
	 * @author Somya
	 */
	private int getTotalPrepTimeForMenu(Map<String, Integer> MenuItemNames) {
		int totalPrepTime = 0;
		for (Map.Entry<String, Integer> entry : MenuItemNames.entrySet()) {
			// parse the order and get the total prep time for all items from
			// database.
			int prepTime = adminSvc.getTotalPrepTimeForMenuItem(entry.getKey()) * entry.getValue();
			totalPrepTime += prepTime;
		}

		System.out.println("Total prep time for the order is:" + totalPrepTime);
		return totalPrepTime;
	}
	
	/**
	 * This function will return the total price for a list of menu item names
	 * @param MenuItemNames
	 * @return
	 * @author Somya
	 */
	private float getTotalPriceForMenu(Map<String, Integer> MenuItemNames) {
		float totalPrice= 0;
		for (Map.Entry<String, Integer> entry : MenuItemNames.entrySet()) {
			// parse the order and get the total prep time for all items from
			// database.
			float pr = adminSvc.getPriceForMenuItem(entry.getKey()) * entry.getValue();
			totalPrice += pr;
		}

		System.out.println("Total price for the order is:" + totalPrice);
		return totalPrice;
	}

	/**
	 * @param time
	 * @param date
	 * @param preptime
	 * @return
	 * @author Somya
	 */
	@RequestMapping(value = "/Menu/Checkout", method = RequestMethod.GET)
	public String checkCustomTime() {
		//TODO: integrate
		Map<String, Integer> mi = this.parseMenuItemsFromRequest();

		// TODO: parse the whole request
		String date = "2016-05-12";
		int user_id = 123;
		int orderid = this.last_order_id;
		int pickuptime = 1000;

		// get the post/get data. // TODO:
		// parse post/get data. you will get menu items here. // TODO
		// output of parsing should be a struct filled with request data

		int totalPrepTime = getTotalPrepTimeForMenu(mi);
		System.out.println("Pickup time:"+pickuptime);
		System.out.println("Date:"+date);

		Schedule sch = getAvailableScheduleForOrder(pickuptime, date, totalPrepTime);
		if (sch != null) {
			System.out.println("Order Accepted.");
			String menu_items = mi.toString();

			// update the order status in the database for this order.
			userSvc.placeOrder(user_id, orderid, menu_items, "placed");

			// add the order to the chef's schedule as well.
			// fill the class here. TODO:
			sch.setOrderid(orderid);
			sch.setDate(date);

			System.out.println("Start Time:"+ sch.getBusystarttime());
			System.out.println("End Time:"+ sch.getBusyendtime());
			System.out.println("Chef:"+sch.getChefid());

			userSvc.addOrderToChefSchedule(sch);
			return "success";
		} else {
			System.out.println("No chef is free, ask him to modify the order");
			return "customTimeOrderError";
		}
	}

	/**
	 * This method checks if any of the three chefs is free. If yes, then it
	 * will return the chef id of the free chef and the time when it can start
	 * to prepare
	 * 
	 * @return chefid who is free
	 * @author Somya
	 */
	private Schedule getAvailableScheduleForOrder(int pickuptime, String date, int preptime) {
		int chefid = 1;
		Schedule sch_1 = isChefFree(chefid, pickuptime, date, preptime);
		if (sch_1 == null) {
			Schedule sch_2 = isChefFree(chefid + 1, pickuptime, date, preptime);
			if (sch_2 == null) {
				Schedule sch_3 = isChefFree(chefid + 2, pickuptime, date, preptime);
				if (sch_3 == null) {
					return null;
				} else {
					sch_3.setChefid(chefid + 2);
					return sch_3;
				}
			} else {
				sch_2.setChefid(chefid + 1);
				return sch_2;
			}
		} else {
			sch_1.setChefid(chefid);
			return sch_1;
		}
	}

	/**
	 * Checks if a chef with the chef id is free for the date and time
	 * 
	 * @param chefid
	 * @return
	 * @author Somya
	 */
	private Schedule isChefFree(int chefid, int pickuptime, String date, int preptime) {

		Map<Integer, Integer> time = new TreeMap<Integer, Integer>();
		time = userSvc.getScheduleForChef(chefid, date);

		int a[] = new int[time.size()];
		int b[] = new int[time.size()];
		int id = 0;
		for (Map.Entry<Integer, Integer> entry : time.entrySet()) {
			a[id] = entry.getKey();
			b[id] = entry.getValue();
			id++;
		}
		//for(int i=0; i<a.length; i++)
			//System.out.print(a[i]+"-"+b[i]+" ");
		
		// cases failing : 610-640-30 ; 640-750-10; 610-670-30; 950-1000
		int minStartTime = pickuptime - preptime - 60;
		int maxStartTime = pickuptime - preptime;
		System.out.println("\nMinStartTime:"+minStartTime);
		System.out.println("MaxStartTime:"+maxStartTime);
		
		Schedule sch = new Schedule();

		// it means the chef is all free
		if (a.length == 0) {
			System.out.println("Yes, can accomodate, chef is all free!");
			sch.setBusystarttime(maxStartTime); // scheduled here late
			sch.setBusyendtime(pickuptime); // scheduled here late
			return sch;
		} else {
			// assuming all the start times are valid.
			// cases where the start time lies before the chef schedule start
			// time
			if (minStartTime < a[0]) {
				if (maxStartTime <= a[0]) {
					if (maxStartTime == a[0]) {
						System.out.println("Yes, can be accomodated-1");
						sch.setBusystarttime(a[0] - preptime);
						sch.setBusyendtime(maxStartTime);
						return sch;
					} else {
						if (a[0] - maxStartTime >= preptime) {
							sch.setBusystarttime(maxStartTime);
							sch.setBusyendtime(pickuptime);
							return sch;
						} else {
							sch.setBusystarttime(a[0] - preptime);
							sch.setBusyendtime(a[0]);
							return sch;
						}
					}
				} else {
					if (a[0] - minStartTime >= preptime) {
						System.out.println("Will it ever come here?");
						sch.setBusystarttime(a[0] - preptime);
						sch.setBusyendtime(pickuptime);
						return sch;
					} else {
						System.out.println("No, it cannot be accomodated");
						return null;
					}
				}
			}

			int maxLimit = 0;
			// cases where start time is within the chef schedule of the day
			for (int i = 0; i < a.length; i++) {

				// check if it is the last schedule of the day for this chef
				if (i == a.length - 1)
					maxLimit = 1080; // 6pm
				else
					maxLimit = a[i + 1];

				if (minStartTime <= b[i]) {
					if (((b[i] + preptime) <= maxLimit) && ((b[i] + preptime) <= pickuptime)) {
						System.out.println("Yes, it can be accomodated-2");
						sch.setBusystarttime(Math.min(maxLimit, pickuptime) - preptime);
						sch.setBusyendtime(Math.min(maxLimit, pickuptime));
						return sch;
					} else {
						System.out.println("No, it cannot be accomodated");
						return null;
					}
				} else {
					if (i <= a.length - 2 && minStartTime >= a[i + 1])
						continue;
					else {
						if (minStartTime + preptime <= maxLimit) {
							System.out.println("Yes, scheduling early");
							sch.setBusystarttime(minStartTime); // scheduled
																// here early
							sch.setBusyendtime(minStartTime + preptime); // scheduled
																			// here
																			// early
							return sch;
						} else {
							System.out.println("No, it cant be accomodated");
							return null;
						}
					}
				}
			}
		}
		return null;
	}
	
	@RequestMapping(value = "/Menu", method = RequestMethod.GET)
	/**
	 * returns the home page
	 * 
	 * @return
	 * @author Somya
	 */
	public String home() {
		return "DisplayUserMenu";
	}
}