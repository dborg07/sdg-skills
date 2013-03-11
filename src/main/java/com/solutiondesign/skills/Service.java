package com.solutiondesign.skills;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;
import com.solutiondesign.skills.dao.SkillgroupDAO;
import com.solutiondesign.skills.dao.TestDAO;
import com.solutiondesign.skills.domain.Skillgroup;

//@Scope("request")
@Component
@Path("/Service")
public class Service {
	
	@Autowired
	private SkillgroupDAO skillgroupDAO;
	
	@GET
	@Produces(MediaType.TEXT_HTML)
	public String getList() {
		String s = new TestDAO().doTest();
//		Skillgroup group = new SkillgroupDAO().findById(1);
//		return "<html> " + "<title>" + "Hello Neal" + "</title>"
//        + "<body><h1>" + "Skillgroup 1: " + group.getSkillGroupName() + "</body></h1>" + "</html> ";
		return "<html> " + "<title>" + "Hello SDG" + "</title>"
		        + "<body><h1>" + "Skillgroup 1 Test Results: <br/>" + s + "</body></h1>" + "</html> ";
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public String getPerson() {
		Skillgroup group = skillgroupDAO.findById(1);
		return new Gson().toJson(group);
	}
	
	
}
