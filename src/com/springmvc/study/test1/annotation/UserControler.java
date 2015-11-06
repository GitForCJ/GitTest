package com.springmvc.study.test1.annotation;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 根据输入省份名称获得省份简称
 */
@Controller
@RequestMapping(value="/test")
public class UserControler {
	
	@RequestMapping("/toSubmit")
	public String toAddUser(){
		return "/submit";
	}
	
	@RequestMapping(method=RequestMethod.POST,value="/getShortName")
	public void getShortName(@RequestBody String name, HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		String provinceName = request.getParameter("name");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("广东省", "粤");
		map.put("湖北省", "鄂");
		map.put("湖南省", "湘");
		map.put("北京", "京");
		map.put("福建省", "闽");
		
		String shortName = map.get(provinceName);
		if (null == shortName){
			shortName = "NA";
		}
		PrintWriter writer = response.getWriter();
		writer.write(shortName);
		writer.flush();
	}
	
}
