package com.ycz.atcrowdfunding.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ycz.atcrowdfunding.pojo.User;
import com.ycz.atcrowdfunding.service.UserService;

@Controller
@RequestMapping("/test/")
public class TestController {
	
	@Autowired
	private UserService uService;//ע�������������
	
	//���Է�����ͼ
	@RequestMapping("index")
	public String index() {
		return "index";
	}

	//���Է����ַ���
	@ResponseBody
	@RequestMapping("json")
	public Object json() {
		Map map = new HashedMap();
		map.put("username", "۳��־");
		return map;
	}
	
	@ResponseBody
	@RequestMapping("queryAll")
	public Object queryAll() {
		List <User> userList = uService.queryAll();
		return userList;
	}
}
