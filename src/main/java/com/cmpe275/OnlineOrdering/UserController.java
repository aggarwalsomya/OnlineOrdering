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
@RequestMapping("/")
public class UserController {
	
	@Autowired
	private UserService userSvc;

	/**
	 * get data request for some menu name will be mapped here
	 * @return It will return the required view
	 */
	@RequestMapping(value = "/user/searchItem", method = RequestMethod.POST)
	public String getData(HttpServletRequest request, Model model) {
		String category = request.getParameter("category");
		MenuItem[] mi = userSvc.getMenuItems(category);
		
		if (mi == null) {
			return "errorFindMenuItem";
		}

		for(int i = 0; i < mi.length; i++) {
			model.addAttribute("name", mi[i].getName());
			model.addAttribute("category", mi[i].getCategory());
			model.addAttribute("calories", mi[i].getCalories());
			model.addAttribute("picture", mi[i].getPicture());
			model.addAttribute("unitprice", mi[i].getUnitprice());
		}

		return "GetUserMenuItems";
	}
	
	@RequestMapping(value = "/Menu", method = RequestMethod.GET)
	/**
	 * returns the home page
	 * @return
	 */
	public String home() {
		return "AddMenuItem";
	}
}