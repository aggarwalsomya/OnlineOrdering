package com.cmpe275.OnlineOrdering;

import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MaxUploadSizeExceededException;

@Controller
@RequestMapping("/")
public class UserController {

	public final String MAINCOURSE = "maincourse";
	public final String DESERT = "desert";
	public final String APPETIZER = "appetizer";
	public final String DRINK = "drink";
	public final String ORDERPLACED = "PLACED";

	@Autowired
	private UserService userSvc;

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
	 * 
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

	public String getEarliestPickUpTime() {

		return "";
	}

	private int getTotalPrepTimeForMenu(List<String> MenuItemNames) {
		int totalPrepTime = 0;
		for (int i = 0; i < MenuItemNames.size(); i++) {
			// parse the order and get the total prep time for all items from
			// database.
			String menuitem_name = MenuItemNames.get(i);
			MenuItem mi = userSvc.getTotalPrepTimeForOrder(menuitem_name);
			int prepTime = Integer.parseInt(mi.getPreptime());
			totalPrepTime += prepTime;
		}

		System.out.println("Total prep time for the order is:" + totalPrepTime);
		return totalPrepTime;

	}

	/**
	 * 
	 * @param time
	 * @param date
	 * @param preptime
	 * @return
	 * @author Somya
	 */
	@RequestMapping(value = "/Menu/Checkout", method = RequestMethod.GET)
	public String checkCustomTime() {
		Date date = null;

		List<String> MenuItemNames = new ArrayList<String>();
		MenuItemNames.add("coke");
		MenuItemNames.add("chocolate fudge");
		MenuItemNames.add("brown rice");
		MenuItemNames.add("spring rolls");
		MenuItemNames.add("ice tea");

		Time t = null;
		int pickuptime = 0;
		int orderid = 101;
		// get the post/get data. // TODO:

		// parse post/get data. you will get menu items here. // TODO
		// output of parsing should be a struct filled with request data

		int totalPrepTime = getTotalPrepTimeForMenu(MenuItemNames);

		Schedule sch = isAnyChefFree(pickuptime, date, totalPrepTime);
		if (sch != null) {
			System.out.println("Some chef is free. we can take the order.");

			// update the order status in the database for this order.
			userSvc.placeConfirmOrder(orderid, ORDERPLACED);

			// add the order to the chef's schedule as well.
			// fill the class here. TODO:
			sch.setOrderid(orderid);
			sch.setDate(date);
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
	private Schedule isAnyChefFree(int pickuptime, Date date, int preptime) {
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
	private Schedule isChefFree(int chefid, int pickuptime, Date date, int preptime) {
		int a[] = { 540, 650, 710 };
		int b[] = { 600, 700, 900 };

		int minStartTime = pickuptime - preptime - 60;
		int maxStartTime = pickuptime - preptime;
		
		Schedule sch = new Schedule();

		// it means the chef is all free
		if (a.length == 0) {
			System.out.println("Yes, can accomodate, chef is all free!");
			sch.setBusystarttime(maxStartTime);						//scheduled here late
			sch.setBusyendtime(pickuptime);							//scheduled here late
			return sch;
		} else {
			// assuming all the start times are valid.
			// cases where the start time lies before the chef schedule start time
			if (minStartTime < a[0]) {
				if (maxStartTime <= a[0]) {
					System.out.println("Yes.");
					sch.setBusystarttime(minStartTime);				//scheduled here early.
					sch.setBusyendtime(minStartTime + preptime);	//scheduled here early.
					return sch;
				} else {
					if (a[0] - minStartTime >= preptime) {
						System.out.println("Yes.");					//scheduled here late
						sch.setBusystarttime(a[0] - preptime);		//scheduled here late
						sch.setBusyendtime(pickuptime);
						return sch;
					} else {
						System.out.println("No.");
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
						System.out.println("Yes:");
						sch.setBusystarttime(Math.min(maxLimit,pickuptime) - preptime);		//scheduled here late
						sch.setBusyendtime(pickuptime);										//scheduled here late
						return sch;
					} else {
						System.out.println("No:");
						return null;
					}
				} else {
					if (i <= a.length - 2 && minStartTime >= a[i + 1])
						continue;
					else {
						if (minStartTime + preptime <= maxLimit) {
							System.out.println("Yes::");
							sch.setBusystarttime(minStartTime);					//scheduled here early
							sch.setBusyendtime(minStartTime+preptime);			//scheduled here early
							return sch;
						} else {
							System.out.println("No::");
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