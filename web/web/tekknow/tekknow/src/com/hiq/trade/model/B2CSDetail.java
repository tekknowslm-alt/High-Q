package com.hiq.trade.model;

import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;
@JsonSerialize(include = Inclusion.NON_NULL)
public class B2CSDetail {
	public String sply_ty;
	public String pos;
	public String typ;
	public double txval;
	public int rt;
	public double iamt;
	public double camt;
	public double samt;
	public double csamt;
}
