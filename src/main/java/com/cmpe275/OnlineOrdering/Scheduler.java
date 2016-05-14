package com.cmpe275.OnlineOrdering;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Scheduler{

    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
    

    @Scheduled(fixedDelay = 5000)
    public void reportCurrentTime() {
   //     System.out.println("The time is now " + dateFormat.format(new Date()));
        //get all orders
        
        
        //for every order get - in-process, 
    	//prepared, 
    //	fulfilled.
    	
        
        
    }
}