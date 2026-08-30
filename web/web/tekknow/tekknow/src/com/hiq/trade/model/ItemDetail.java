package com.hiq.trade.model;

import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;
@JsonSerialize(include = Inclusion.NON_NULL)

public class ItemDetail {
	public Double txval;
	public int rt;
	public Double camt;
	public Double samt;
	public Double csamt;
	public Double iamt;
}
