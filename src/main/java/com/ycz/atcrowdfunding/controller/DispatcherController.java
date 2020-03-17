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
 * ��Ϊ�����û���¼�Ŀ�����
 * 
 * @author Administrator
 *
 */
@Controller
public class DispatcherController {

	@Autowired
	private UserService uService;// �Զ�ע�������������

	@Autowired
	private PermissionService pService;

	/**
	 * ��λ����¼ҳ��
	 * 
	 * @return
	 */
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	/**
	 * ��������ҳ��
	 */
	@RequestMapping("error")
	public String error() {
		return "error";
	}

	/**
	 * �˳�ϵͳ
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();// ʹ������ʧЧ
		return "redirect:login";// �ض��򵽵�¼ҳ��
	}

	/**
	 * ��λ����ҳ��
	 * 
	 * @return
	 */
	@RequestMapping("/main")
	public String Main() {
		return "main";
	}

	/**
	 * ��¼��֤ �����ύ�������û����������װΪ������������֤
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/doLogin")
	public Object doAjaxLogin(User user, HttpSession session) {
		AjaxResult result = new AjaxResult();
		User dbUser = uService.queryUser(user);
		if (dbUser != null) {
			session.setAttribute("currentUser", dbUser);// ����ǰ�û��浽�Ự���У�ǰ�˿���ȡ��ʹ��
			// ��½�ɹ����ȡ�û���Ȩ����Ϣ
			List<Permission> permissions = pService.queryPermissionsByUser(dbUser);
			Map<Integer, Permission> map = new HashMap<>();
			Permission root = null;// ��ʼ�����ڵ�
			Set<String> uriSet = new HashSet<>();
			for (Permission p : permissions) {
				map.put(p.getId(), p);// ������Ȩ�޴浽map��
				if(p.getUrl()!=null && !"".equals(p.getUrl())) {
					uriSet.add(session.getServletContext().getContextPath()+ "/" + p.getUrl());
				}
			}
			//��·���浽session��
			session.setAttribute("uriSet", uriSet);
			for (Permission p : permissions) {
				Permission child = p;
				if (child.getpId() == 0) {
					root = p;// �ҵ����ڵ�
				} else {
					Permission parent = map.get(child.getpId());// �ҵ����ڵ�
					// ��ϸ��ӽڵ�Ĺ�ϵ
					parent.getChildren().add(child);
				}
			}
			session.setAttribute("rootPermission", root);//�����ڵ�浽session����
			result.setSuccess(true);
		} else {
			result.setSuccess(false);
		}
		return result;
	}

}
