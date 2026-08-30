package com.hiq.trade.model;

import java.util.ArrayList;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;
@JsonSerialize(include = Inclusion.NON_NULL)
public class CDNRDetail {
	public String ctin;
	public ArrayList<CreditNote> nt;
	@JsonIgnore
	public int suppCode;
}
