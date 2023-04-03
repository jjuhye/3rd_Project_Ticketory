package com.basic.reserve.frontController;

public class viewResolve {
	public static String makeView(String nextpage) {
		return "/WEB-INF/reserve/"+nextpage+".jsp";
	}
}
