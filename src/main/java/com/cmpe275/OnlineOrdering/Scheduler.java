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

public class Scheduler{

   // private static final SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
	 private List<Schedule> orders = new ArrayList<Schedule>();
    
    @Autowired
	SchedulerService schSvc;
    

    @Scheduled(fixedDelay = 30000)
    public void reportCurrentTime() {
    	
    	
    	
    	String currDate = Utils.getCurrdate();
    	
        System.out.println("The time is now " + currDate);
        //get all orders
         orders = schSvc.getOrders(currDate);
         if(orders!= null && !orders.isEmpty()) {
         for(Schedule s : orders)  {
        	 System.out.println("the oder id is" + s.getOrderid());
        	 int startTime = s.getBusystarttime();
        	 int endTime = s.getBusyendtime();
        	 int pickupTime = schSvc.getPickuptime(s.getOrderid());
        	 if(pickupTime!=0) {
        		 System.out.println("pickuptime is " + pickupTime);
        	 
        	 String status = statuscheck(startTime, endTime,pickupTime);
        	 System.out.println("statsu is " + status);
        	 updateStatus(status, s);
        	 }
         }
         } else {
        	 System.out.println("its null");
         }
        //for every order get - in-process, 
    	//prepared, 
    //	fulfilled.
    	
        
        
    }


	private void updateStatus(String status, Schedule sch) {
		// TODO Auto-generated method stub
		if(status != "") {
			OrderDetails ord = schSvc.getOrder(sch.getOrderid());
			if(ord!=null) {
				ord.setStatus(status);
				schSvc.updateStatus(ord);
			}
		}
	}




	private String statuscheck(int startTime, int endtime, int pickuptime) {
		// TODO Auto-generated method stub
			int currTime = Utils.getCurrTimeInMins();
			
			 if(currTime>=startTime && currTime<endtime) {
				
				return "inprocess";
				
			}   else if(currTime>=endtime && currTime<pickuptime){
				return "prepared";
			}else if(currTime>=pickuptime) {
				return "fulfilled";
			} else return "";
		
	}
}
