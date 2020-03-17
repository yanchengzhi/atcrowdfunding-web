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
 * �̳���������·��������
 * 
 * @author Administrator
 *
 */
public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private PermissionService pService;// �Զ�ע������

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		// ��ȡ�û��������ַ
		String uri = request.getRequestURI();
		String path = request.getSession().getServletContext().getContextPath();
		
		// �жϵ�ǰ�û��Ƿ���Ҫ����Ȩ����֤
		// ��ѯ������Ҫ��֤��·������
		List<Permission> permissions = pService.queryAll();// ��ѯ����Ȩ��
		Set<String> uriSet = new HashSet<>();
		for (Permission p : permissions) {
			if (p.getUrl() != null && !"".equals(p.getUrl())) {// ���URL��Ϊ��
				uriSet.add(path + "/" + p.getUrl());
			}
		}
		if (uriSet.contains(uri)) {
			// Ȩ����֤
			// �жϵ�ǰ�û��Ƿ�ӵ�ж�Ӧ��Ȩ��
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
