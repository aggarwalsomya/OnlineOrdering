package com.cmpe275.OnlineOrdering;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.context.annotation.Bean;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
@RequestMapping("/")
public class AdminController {
	
	@Autowired
	private AdminService adminSvc;

	/**
	 * get data request for some menu name will be mapped here
	 * @return It will return the required view
	 */
	@RequestMapping(value = "/searchItem", method = RequestMethod.POST)
	public String getData(HttpServletRequest request, Model model) {
		String name = request.getParameter("name");
		MenuItem mi = adminSvc.getMenuItem(name);
		
		if (mi == null) {
			model.addAttribute("name",name);
			return "ErrorFindMenuItem";
		}

		model.addAttribute("name", name);
		model.addAttribute("id",mi.getId());
		model.addAttribute("category", mi.getCategory());
		model.addAttribute("calories", mi.getCalories());
		model.addAttribute("picture", mi.getPicture());
		model.addAttribute("unitprice", mi.getUnitprice());
		model.addAttribute("preptime", mi.getPreptime());

		return "DeleteMenuItem";
	}
	
	/**
	 * Request for adding the menu item will be mapped here
	 * @param request
	 * @return view
	 */
	@RequestMapping(value = "/addItem", method = RequestMethod.POST)
	public String addMenuItem(HttpServletRequest request,
			 					@RequestParam CommonsMultipartFile fileUpload) {
		
		int id = this.getNextNonExistingNumber();
		adminSvc.add(setParams(request, id, fileUpload
		));
		if(validateImageFile(fileUpload))
			return "AddMenuItem";
		else
			return "ImageUploadError";
	}
	
	private boolean validateImageFile(CommonsMultipartFile fileUpload) {
		if (fileUpload != null && fileUpload.getSize() > 0) {
			return true;
		} else
			return false;
	}
	
	/**
	 * It will generate the Random Id, if the id exists, it will generate a new one.
	 * @return the unique id
	 */
	private int getNextNonExistingNumber() {
		Random rn = new Random();
		rn.setSeed(System.currentTimeMillis());
		while (true) {
			int rand_id = rn.nextInt(Integer.SIZE - 1) % 10000;
			if (!adminSvc.existsById(rand_id)) {
				return rand_id;
			}
		}
	}

	/**
	 * It will set the params in the profile object from the servlet request object
	 * @param request
	 * @param id
	 * @param fileUpload 
	 * @return the profile object will all the parameters
	 */
	private MenuItem setParams(HttpServletRequest request, int id, CommonsMultipartFile fileUpload) {
		MenuItem mi = new MenuItem();
		mi.setId(id);
		mi.setName(request.getParameter("name"));
		mi.setCategory(request.getParameter("category"));
		mi.setCalories(request.getParameter("calories"));
		mi.setPreptime(request.getParameter("preptime"));
		mi.setUnitprice(request.getParameter("unitprice"));
		mi.setPicture(fileUpload.getBytes());
		return mi;
	}	

	/**
	 * It will delete the entry of the menu item passed to it by the menu item
	 * name
	 * 
	 * @param name : menu item name
	 * @param model
	 * @return view
	 */
	@RequestMapping(value = "/deleteMenuItem", method = RequestMethod.POST)
	public String deleteMenuItem(HttpServletRequest request, Model model) {
		String name = request.getParameter("name");
		adminSvc.delete(name);
		return "SuccessDeleteMenuItem";
	}
    
    
    //returns search page on click
    @RequestMapping(value = "/searchIt", method = RequestMethod.GET)
    public String searchIt(HttpServletRequest request) {
        System.out.println("entered register home");
        return "SearchMenuItem";
    }
    
    //returns add item page on click
    @RequestMapping(value = "/addIt", method = RequestMethod.GET)
    public String addIt(HttpServletRequest request) {
        System.out.println("entered register home");
        return "AddMenuItem";
    }
    
    //Go back to home page
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home(HttpServletRequest request) {
        System.out.println("entered register home");
        return "home";
    }
    
    //logout and jump to first page.
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request) {
        System.out.println("entered register home");
        return "Login";
    }
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	/**
	 * returns the home page
	 * @return
	 */
	public String home() {
		return "home";
	}
}