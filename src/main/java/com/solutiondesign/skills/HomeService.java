package com.solutiondesign.skills;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.google.gson.Gson;
import com.solutiondesign.skills.dao.SkillgroupDAO;
import com.solutiondesign.skills.domain.Skillgroup;

@Path("/")
/**
 * Simple Service class to handle requests to the root - maybe change to jsp
 * @author Dan
 *
 */
public class HomeService {
	@GET
	@Produces(MediaType.TEXT_HTML)
	public String getList() {
		return "<html> " + "<title>" + "SDG Skills Inventory" + "</title>"
		        + "<body><h1>" + "SDG Skills Inventory" + "</h1>" 
				+ "<a href='Service'>Services</a>" + "</body>" + "</html> ";
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public String getPerson() {
		Skillgroup group = new SkillgroupDAO().findById(1);
//		Person dan = new PersonHome().findById(1);
		return new Gson().toJson(group);
	}
	
	
}
