package cn.sxt.controller;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.sxt.pojo.Funs;
import cn.sxt.pojo.LoginLogs;
import cn.sxt.pojo.Menus;
import cn.sxt.pojo.Pagination;
import cn.sxt.pojo.Roles;
import cn.sxt.pojo.Users;
import cn.sxt.service.PermissionService;
import cn.sxt.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private PermissionService permissionService;

	@RequestMapping("/login")
	public String login(Users user, HttpSession session,
			HttpServletRequest request) {
		System.out.println("进入了/user/login");
		// 调用UserService进行比对，返回User对象
		Users temp = userService.login(user);
		// 判断是否为null，为null，回到登陆页面，不为null，将用户信息保存到session中，跳转到index.jsp页面
		// System.out.println("测试以下：" + temp.toString());
		if (temp == null) {
			// System.out.println("temp是空的");
			return "fault";
		}

		// 根据用户id得到用户对应菜单信息，通过session返回数据
		List<Menus> menus = permissionService.getMenuByUserName(temp
				.getUserName());
		List<Funs> funs = permissionService.getFunsByUserName(temp
				.getUserName());
		temp.setMenus(menus);
		temp.setFuns(funs);

		session.setAttribute("loginUser", temp);
		// System.out.println("temp不为空：" + temp.toString());

		// 已经查询到用户 ，登陆成功，可以写如loginlog表了
		LoginLogs loginLogs = new LoginLogs();
		String loginIp = getIpAddr(request);// 可以获得ip地址了。
		loginLogs.setLoginIp(loginIp);
		// 登陆时间
		SimpleDateFormat dateFm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String timeNow = dateFm.format(new Date());
		Timestamp time = Timestamp.valueOf(timeNow);
		// Date time = new java.sql.Date(new java.util.Date().getTime());
		loginLogs.setLoginTime(time);
		System.out.println("系统当前时间：" + time);
		// 登陆用户
		String loginName = temp.getUserName();
		loginLogs.setLoginName(loginName);
		System.out.println("userController中loginLogs:" + loginLogs.toString());
		// 调用添加到LoginLogs的方法
		userService.addLoginLog(loginLogs);

		return "forward:main";
	}
	// initMenu
	@ResponseBody
	@RequestMapping("/initMenu")
	public List<Menus> initMenu(HttpSession session) {
		// System.out.println("controller中刚提交过来的user:" + user.toString());
		Users temp = (Users) session.getAttribute("loginUser");
		System.out.println("请求initMenu的用户" + temp.toString());
		List<Menus> menus = permissionService.getMenuByUserName(temp
				.getUserName());
		return menus;
	}

	/**
	 * 跳转到index.jsp
	 * 
	 * @return
	 */
	@RequestMapping("/main")
	public String index() {
		return "WEB-INF/main";
	}

	@RequestMapping("/toAdd")
	public String toAdd() {
		return "WEB-INF/user/add";
	}

	@RequestMapping("/toList")
	public String toList() {
		return "WEB-INF/user/list";
	}

	@ResponseBody
	@RequestMapping("/add")
	public boolean addUser(MultipartFile uploadFile, Users user,
			HttpServletRequest req) {

		String oname = uploadFile.getOriginalFilename();
		String suffix = oname.substring(oname.lastIndexOf("."));
		// 得到新的文件名
		String nname = UUID.randomUUID().toString() + suffix;
		// 新文件名存入到user中
		user.setPicture(nname);
		// 先设置头像文件名，再调用service方法
		userService.addUser(user);
		System.out.println("controller中user.pic:" + user.getPicture());
		// 得到转移路径
		String path = req.getRealPath("/upload") + File.separator + nname;
		System.out.println("path:" + path);
		try {
			// 文件转移
			uploadFile.transferTo(new File(path));
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	@ResponseBody
	@RequestMapping("/select")
	public Pagination<Users> selUser(int page, int rows, Users user) {
		System.out.println("controller中刚提交过来的user:" + user.toString());
		Pagination<Users> p = userService.selUser(page, rows, user);
		System.out.println("usercontroller:" + p);
		return p;

	}
	@ResponseBody
	@RequestMapping("/delete")
	public boolean deleteUser(Users user) {
		userService.deleteUser(user);

		return true;
	}

	@ResponseBody
	@RequestMapping("/update")
	public String updateUser(Users user) {
		userService.updateUser(user);

		return "true";
	}

	@ResponseBody
	@RequestMapping("/roles")
	public List<Roles> getRoles() {
		return userService.getRoles();
	}

	private String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		if (ip.equals("0:0:0:0:0:0:0:1")) {
			ip = "本地";
		}
		return ip;
	}

}
