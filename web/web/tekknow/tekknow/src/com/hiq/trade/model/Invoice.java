package com.hiq.trade.model;

import java.util.ArrayList;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;

@JsonSerialize(include = Inclusion.NON_NULL)
public class Invoice {
	public String inum;
	public String idt;
	public double val;
	public String pos;
	public String rchrg;	
	public ArrayList<Item> itms;
	public String inv_typ;
	@JsonIgnore
	public int invCode;
}
