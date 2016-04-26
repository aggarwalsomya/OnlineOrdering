package com.cmpe275.OnlineOrdering;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class UserController {
	
	@Autowired
	private UserService userSvc;

	/**
	 * get data request for some menu name will be mapped here
	 * @return It will return the required view
	 */
	@RequestMapping(value = "/Menu/displayMenuItems", method = RequestMethod.POST)
	public String getData(HttpServletRequest request, Model model) {
		String category = request.getParameter("category");
		List<MenuItem> mi = userSvc.getMenuItems(category);

		if (mi == null) {
			model.addAttribute("category",category);
			return "ErrorFindMenuItem_User";
		}
		
		for(int i = 0; i < mi.size(); i++) {
			model.addAttribute("record"+i, mi.get(i));
		}
		
		return "GetUserMenuItems";
	}
	
	@RequestMapping(value = "/Menu", method = RequestMethod.GET)
	/**
	 * returns the home page
	 * @return
	 */
	public String home() {
		return "DisplayUserMenu";
	}
}