package com.hiq.trade.model;

import java.util.ArrayList;

import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;
@JsonSerialize(include = Inclusion.NON_NULL)
public class GST {
	public String gstin;
	public String fp;
	public int gt;
	public int cur_gt;
	public ArrayList<Party> b2b;	
	public ArrayList<B2CSDetail> b2cs;
	public ArrayList<CDNRDetail> cdnr;
	public HSNData hsn;

}
