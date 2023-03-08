package com.mirac.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public class HTMLReplace {
	public static HashMap<String, String> htmlMap1 = new HashMap<String, String>();
	public static HashMap<String, String> htmlMap2 = new HashMap<String, String>();
	public static HashMap<String, String> htmlMap3 = new HashMap<String, String>();
	
	static{
		htmlMap1.put("&", "&amp;");
		
		htmlMap2.put(">", "&lt;");
		htmlMap2.put("<", "&gt;");
		htmlMap2.put(" ", "&nbsp;");	
		htmlMap2.put("\"", "&quot;");
		htmlMap2.put("\t", "&nbsp;&nbsp;&nbsp;&nbsp;");
		
		htmlMap3.put("\n\r", "<br/>");
		htmlMap3.put("\r\n", "<br/>");
		htmlMap3.put("\n", "<br/>");
		htmlMap3.put("\r", "<br/>");
	}
	public static String replace(String str){
		String html = str;
		
		Set<String>  keys = htmlMap1.keySet();
		Iterator<String> iterator = keys.iterator();
		
		while (iterator.hasNext()) {
			String key = iterator.next();
			
			html = html.replaceAll(key, htmlMap1.get(key));
		}		
		
		keys = htmlMap2.keySet();
		iterator = keys.iterator();
		
		while (iterator.hasNext()) {
			String key = iterator.next();
			
			html = html.replaceAll(key, htmlMap2.get(key));
		}		

		keys = htmlMap3.keySet();
		iterator = keys.iterator();
		
		while (iterator.hasNext()) {
			String key = iterator.next();
			
			html = html.replaceAll(key, htmlMap3.get(key));
		}		
		return html;
	}
}
