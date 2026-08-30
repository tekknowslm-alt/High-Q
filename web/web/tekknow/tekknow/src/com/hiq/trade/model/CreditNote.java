package com.hiq.trade.model;

import java.util.ArrayList;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;

@JsonSerialize(include = Inclusion.NON_NULL)
public class CreditNote {
	public String ntty;
	public String nt_num;
	public String nt_dt;
	public String p_gst;	
	public String inum;
	public String idt;
	public double val;
	public ArrayList<Item> itms;
	@JsonIgnore
	public int crCode;
}
