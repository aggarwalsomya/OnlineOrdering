package com.cmpe275.OnlineOrdering;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminSvc;


	/**
	 * get data request for some menu name will be mapped here
	 * @return It will return the required view
	 */
	public String getData(String name,Model model) {
		MenuItem mi = adminSvc.getSpecificUser(name);
		model.addAttribute("name", name);

		if (mi == null) {
			return "errorFindMenuItem";
		}

		model.addAttribute("name", mi.getName());
		model.addAttribute("category", mi.getCategory());
		model.addAttribute("calories", mi.getCalories());
		model.addAttribute("picture", mi.getPicture());
		model.addAttribute("unitprice", mi.getUnitprice());
		model.addAttribute("preptime", mi.getPreptime());

		return "GetMenuItemData";
	}
	
	/**
	 * Request for adding the menu item will be mapped here
	 * @param request
	 * @return view
	 */
	@RequestMapping(value = "/addMenuItem", method = RequestMethod.POST)
	public String addMenuItem(HttpServletRequest request,
			 					@RequestParam CommonsMultipartFile fileUpload) {
		int id = this.getNextNonExistingNumber();
		adminSvc.add(setParams(request, id, fileUpload
		));
		if(validateImageFile(fileUpload))
			return "redirect:/" + request.getParameter("name");
		else
			return "image_error";
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
	 * It will delete the entry of the menu item passed to it by the menu item name
	 * @param name : menu item name
	 * @param model
	 * @return view
	 */

	public String deleteMenuItem(String name, Model model) {
		if (adminSvc.exists(name)) {
			System.out.println("row exist for this menu item with name:" + name);
			adminSvc.delete(name);
			return "success_delete";
		} else {
			System.out.println("row doesn't exist for menu item with name:" + name);
			model.addAttribute("name",name);
			return "errorFindMenuItem";
		}
	}
}