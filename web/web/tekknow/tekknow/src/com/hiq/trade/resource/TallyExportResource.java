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


import com.hiq.trade.master.TallyExporter;


@Path("tallyexport")
public class TallyExportResource {

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public String generateData(MultivaluedMap<String, String> formParams,@Context final UriInfo  uriInfo) {
    	String result="";
    	try{
    		System.out.println(" "+formParams.getFirst("data"));
	    	ObjectMapper obj=new ObjectMapper();
	    	Map<String,Object> m=obj.readValue(formParams.getFirst("data"), new TypeReference<Map<String, Object>>() {});
	    	System.out.println(" "+m.get("savedata"));
	    	TallyExporter l=TallyExporter.getInstance();
	    	String op=(String)m.get("operation");
	    	l.generateData((Map)m.get("savedata"));
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	return result;
    }
    @Path("/getguid")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getGUID(@QueryParam("code") String code,@Context final UriInfo  uriInfo) {
    	String result="{}";
    	try{
    		TallyExporter l=TallyExporter.getInstance();
    		result=l.getGUID(code);
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	return result;
    }
}