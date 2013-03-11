package com.solutiondesign.skills;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;
import com.solutiondesign.skills.dao.SkillgroupDAO;
import com.solutiondesign.skills.dao.TestDAO;
import com.solutiondesign.skills.domain.Skillgroup;
//import org.springframework.context.annotation.Scope;

//@Scope("request")
@Component
@Path("/Skillgroup")
public class SkillgroupService {
	
	@Autowired
	private SkillgroupDAO skillgroupDAO;
	
	@GET
	@Produces(MediaType.TEXT_HTML)
	public String getaList() {
		//TODO Make this usable, or get rid of it
		String s = new TestDAO().doTest();
//		Skillgroup group = new SkillgroupDAO().findById(1);
//		return "<html> " + "<title>" + "Hello Neal" + "</title>"
//        + "<body><h1>" + "Skillgroup 1: " + group.getSkillGroupName() + "</body></h1>" + "</html> ";
		return "<html> " + "<title>" + "Hello SDG" + "</title>"
		        + "<body><h1>" + "Skillgroup 1 Test Results: <br/>" + s + "</body></h1>" + "</html> ";
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/{id}")
	public String getSkill(@PathParam("id") int id) {
		Skillgroup group = skillgroupDAO.findById(id);
		return new Gson().toJson(group);
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public String getSkills() {
		List<Skillgroup> groups = skillgroupDAO.list();
		return new Gson().toJson(groups);
	}	
}
