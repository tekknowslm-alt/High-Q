package com.hiq.trade.model;

import java.util.ArrayList;

import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;
@JsonSerialize(include = Inclusion.NON_NULL)
public class HSNData{
	public ArrayList<HSNDetail> data;
}
