package com.ycz.atcrowdfunding.web;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ycz.atcrowdfunding.pojo.Permission;
import com.ycz.atcrowdfunding.service.PermissionService;

/**
 * 继承适配器，路径拦截器
 * 
 * @author Administrator
 *
 */
public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private PermissionService pService;// 自动注入依赖

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		// 获取用户的请求地址
		String uri = request.getRequestURI();
		String path = request.getSession().getServletContext().getContextPath();
		
		// 判断当前用户是否需要进行权限验证
		// 查询所有需要验证的路径集合
		List<Permission> permissions = pService.queryAll();// 查询所有权限
		Set<String> uriSet = new HashSet<>();
		for (Permission p : permissions) {
			if (p.getUrl() != null && !"".equals(p.getUrl())) {// 如果URL不为空
				uriSet.add(path + "/" + p.getUrl());
			}
		}
		if (uriSet.contains(uri)) {
			// 权限验证
			// 判断当前用户是否拥有对应的权限
			Set<String> authUriSet = (Set<String>) request.getSession().getAttribute("uriSet");
			if(authUriSet.contains(uri)) {
				return true;
			}else {
				response.sendRedirect(path + "/error");
				return false;
			}
		} else {
			return true;
		}
	}

}
