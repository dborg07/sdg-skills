package com.solutiondesign.skills;

import java.net.URI;

import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.UriBuilder;

import com.google.gson.Gson;
import com.solutiondesign.skills.domain.Skillgroup;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;

public class TestClient {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
	    ClientConfig config = new DefaultClientConfig();
	    Client client = Client.create(config);
	    WebResource service = client.resource(getBaseURI());
	    // Get JSON
	    String response = service.path("Service").accept(MediaType.APPLICATION_JSON).get(String.class);
	    System.out.println(response);
	    Skillgroup agroup = new Gson().fromJson(response, Skillgroup.class);
	    // The HTML
	    if(agroup == null) {
	    	System.out.println("### Oops! agroup was null!");
	    }
	    System.out.println(service.path("Service").accept(MediaType.TEXT_HTML).get(String.class));

	  }

	  private static URI getBaseURI() {
	    return UriBuilder.fromUri("http://localhost:8080/skills").build();
	  }

}
