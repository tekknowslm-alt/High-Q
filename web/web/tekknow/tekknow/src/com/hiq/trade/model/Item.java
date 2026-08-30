package com.hiq.trade.model;

import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;
@JsonSerialize(include = Inclusion.NON_NULL)
public class Item {
	public int num;
	public ItemDetail itm_det;
}
