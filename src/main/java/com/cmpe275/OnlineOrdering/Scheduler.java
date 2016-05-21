package com.cmpe275.OnlineOrdering;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

@Component
public class Scheduler {

	private List<Order> orders = new ArrayList<Order>();

	@Autowired
	SchedulerService schSvc;

	@Autowired
	AdminService adminSvc;

	
	/**
	 * It is the scheduler which runs every minute , checking the order times
	 * and changing the status accordingly and sending notifications.
	 * @author Meera
	 */
	@Scheduled(cron = "0 * * * * *")
	public void reportCurrentTime() {

		String currDate = Utils.getCurrdate();

		System.out.println("The time is now " + currDate);//add condition for not proceeding in the night
		
		orders = adminSvc.getAllOrders(currDate, currDate, "");
		if (orders != null && !orders.isEmpty()) {
			for (Order o : orders) {
				System.out.println("the oder id is" + o.getOrderid());
				int startTime = Utils.getTimeinMins(o.getPrepStartTime());
				int endTime = Utils.getTimeinMins(o.getPrepEndTime());
				int pickupTime = Utils.getTimeinMins(o.getpickup_time());

				String status = statuscheck(startTime, endTime, pickupTime,
						o.getEmail());
				System.out.println("statsu is " + status);
				updateStatus(status, o);
			}
		} else {
			System.out.println("its null");
		}
	}

	/**
	 * updates the status of the order and 
	 * remove fulfilled orders from chef's schedule.
	 * @param order, status
	 * @author Meera
	 */
	private void updateStatus(String status, Order ord) {
		
		if (status != "") {
			OrderDetails ordd = schSvc.getOrder(ord.getOrderid());
			if (ordd != null) {
				ordd.setStatus(status);
				schSvc.updateStatus(ordd);
				if (status.equals("fulfilled")) {
					schSvc.deleteSchedule(ord.getOrderid());
				}
			}
		}
	}

	/**
	 * checks the times and decides the status 
	 * of the order.
	 * @param start time, end time, pickup time,
	 * and email id of the user of that order. 
	 * @author Meera
	 */
	private String statuscheck(int startTime, int endtime, int pickuptime,
			String mail) {
	
		int currTime = Utils.getCurrTimeInMins();

		if (currTime == startTime) {
			StringBuffer message = new StringBuffer(
					"Your order preparation has begun! ");
			message.append("It is ready to be picked up soon at ");
			message.append(Utils.convertMinsToTime(pickuptime));
			message.append(" hrs");
			Runnable r = new Notify(mail, message.toString());
			new Thread(r).start();

		}
		if (currTime >= startTime && currTime < endtime) {

			return "inprocess";

		} else if (currTime >= endtime && currTime < pickuptime) {
			return "prepared";
		} else if (currTime >= pickuptime) {
			return "fulfilled";
		} else
			return "";

	}

}
