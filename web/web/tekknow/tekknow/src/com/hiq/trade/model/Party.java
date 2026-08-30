package com.hiq.trade.model;

import java.util.ArrayList;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;
@JsonSerialize(include = Inclusion.NON_NULL)
public class Party {
	public String ctin;
	public ArrayList<Invoice> inv;
	@JsonIgnore
	public int suppCode;
}
