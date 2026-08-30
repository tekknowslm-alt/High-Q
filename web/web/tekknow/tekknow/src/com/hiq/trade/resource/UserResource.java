package com.hiq.trade.resource;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Map;

import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;
import javax.ws.rs.core.UriInfo;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

import com.hiq.trade.master.UserManager;

@Path("users")
public class UserResource {

	@Path("/employee")
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String addEmployee(MultivaluedMap<String, String> formParams, @Context final UriInfo uriInfo) {
		String result = "";
		try {
			System.out.println(" " + formParams.getFirst("data"));
			ObjectMapper obj = new ObjectMapper();
			Map<String, Object> m = obj.readValue(formParams.getFirst("data"),
					new TypeReference<Map<String, Object>>() {
					});
			System.out.println(" " + m.get("savedata"));
			UserManager l = UserManager.getInstance();
			String op = (String) m.get("operation");
			if ("ADD".equals(op)) {
				result = l.addEmployee((Map) m.get("savedata"));
			} else if ("EDIT".equals(op)) {
				result = l.modifyEmployee((Map) m.get("savedata"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Path("/employee")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public String getServiceProcess(@QueryParam("code") String code, @Context final UriInfo uriInfo) {
		String result = "{}";
		try {
			UserManager b = UserManager.getInstance();
			result = b.getEmployee(code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Path("/role")
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String addServiceAgent(MultivaluedMap<String, String> formParams, @Context final UriInfo uriInfo) {
		String result = "";
		try {
			System.out.println(" " + formParams.getFirst("data"));
			ObjectMapper obj = new ObjectMapper();
			Map<String, Object> m = obj.readValue(formParams.getFirst("data"),
					new TypeReference<Map<String, Object>>() {
					});
			System.out.println(" " + m.get("savedata"));
			UserManager l = UserManager.getInstance();
			String op = (String) m.get("operation");
			if ("ADD".equals(op)) {
				result = l.addRole((Map) m.get("savedata"));
			} else if ("EDIT".equals(op)) {
				result = l.modifyRole((Map) m.get("savedata"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Path("/role")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public String getRole(@QueryParam("code") String code, @Context final UriInfo uriInfo) {
		String result = "{}";
		try {
			UserManager b = UserManager.getInstance();
			result = b.getRole(code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Path("/role/menus")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public String getParentRoleMenus(@QueryParam("code") String code, @Context final UriInfo uriInfo) {
		String result = "{}";
		try {
			UserManager b = UserManager.getInstance();
			result = b.getParentRoleMenus(code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Path("/usercheck")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public String login(@QueryParam("code") String code, @Context final UriInfo uriInfo) {
		String result = "";
		try {
			UserManager l = UserManager.getInstance();
			result = l.checkUser(code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}