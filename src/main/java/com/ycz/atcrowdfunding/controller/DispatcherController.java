package com.ycz.atcrowdfunding.controller;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ycz.atcrowdfunding.pojo.AjaxResult;
import com.ycz.atcrowdfunding.pojo.Permission;
import com.ycz.atcrowdfunding.pojo.User;
import com.ycz.atcrowdfunding.service.PermissionService;
import com.ycz.atcrowdfunding.service.UserService;

/**
 * 作为控制用户登录的控制器
 * 
 * @author Administrator
 *
 */
@Controller
public class DispatcherController {

	@Autowired
	private UserService uService;// 自动注入服务层组件依赖

	@Autowired
	private PermissionService pService;

	/**
	 * 定位到登录页面
	 * 
	 * @return
	 */
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	/**
	 * 跳到错误页面
	 */
	@RequestMapping("error")
	public String error() {
		return "error";
	}

	/**
	 * 退出系统
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();// 使作用域失效
		return "redirect:login";// 重定向到登录页面
	}

	/**
	 * 定位到主页面
	 * 
	 * @return
	 */
	@RequestMapping("/main")
	public String Main() {
		return "main";
	}

	/**
	 * 登录验证 将表单提交过来的用户名和密码封装为对象来进行验证
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/doLogin")
	public Object doAjaxLogin(User user, HttpSession session) {
		AjaxResult result = new AjaxResult();
		User dbUser = uService.queryUser(user);
		if (dbUser != null) {
			session.setAttribute("currentUser", dbUser);// 将当前用户存到会话域中，前端可以取出使用
			// 登陆成功后获取用户的权限信息
			List<Permission> permissions = pService.queryPermissionsByUser(dbUser);
			Map<Integer, Permission> map = new HashMap<>();
			Permission root = null;// 初始化根节点
			Set<String> uriSet = new HashSet<>();
			for (Permission p : permissions) {
				map.put(p.getId(), p);// 将所有权限存到map里
				if(p.getUrl()!=null && !"".equals(p.getUrl())) {
					uriSet.add(session.getServletContext().getContextPath()+ "/" + p.getUrl());
				}
			}
			//将路径存到session中
			session.setAttribute("uriSet", uriSet);
			for (Permission p : permissions) {
				Permission child = p;
				if (child.getpId() == 0) {
					root = p;// 找到根节点
				} else {
					Permission parent = map.get(child.getpId());// 找到父节点
					// 组合父子节点的关系
					parent.getChildren().add(child);
				}
			}
			session.setAttribute("rootPermission", root);//将根节点存到session域中
			result.setSuccess(true);
		} else {
			result.setSuccess(false);
		}
		return result;
	}

}
