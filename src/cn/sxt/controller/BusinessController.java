package cn.sxt.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.sxt.pojo.Cars;
import cn.sxt.pojo.Pagination;
import cn.sxt.service.CarService;

@Controller
public class BusinessController {
	@RequestMapping("/business/toList")
	public String toAdd() {
		return "WEB-INF/business/businessList";
	}
}
