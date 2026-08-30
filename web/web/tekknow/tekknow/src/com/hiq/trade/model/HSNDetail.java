package com.hiq.trade.model;

import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;
@JsonSerialize(include = Inclusion.NON_NULL)
public class HSNDetail{
	public int num;
	public String hsn_sc;
	public String desc;
	public String uqc;
	public double qty;
	public double val;
	public double txval;
	public double iamt;
	public double camt;
	public double samt;
	public double csamt;
}
