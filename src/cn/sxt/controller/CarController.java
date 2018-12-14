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
public class CarController {
	@Autowired
	private CarService carService;

	/**
	 * 获取所有的汽车
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/cars/selAllCars")
	public Pagination<Cars> selAllCars(int page, int rows, String srchVal,
			Pagination<Cars> P) throws Exception {
		P = carService.selAllCars(page, rows, srchVal);
		/* System.out.println(srchVal); */
		return P;
	}

	/**
	 * 删除汽车
	 * 
	 * @param cars
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/cars/delCar")
	public boolean delCar(Cars cars) {
		// System.out.println("controller删除" + cars);
		boolean retVal = carService.delCar(cars);
		return retVal;
	}

	/**
	 * 修改汽车
	 * 
	 * @param cars
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/cars/updCar")
	public String updCar(Cars cars) {
		carService.updCar(cars);
		return "true";
	}

	/**
	 * 添加汽车
	 * 
	 * @param cars
	 * @param upload
	 * @param req
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/cars/insCar")
	public boolean insCar(Cars cars, MultipartFile upload,
			HttpServletRequest req) {
		// System.out.println("CarController.insCar()");
		// 得到文件后缀名 xx.jpg
		String oname = upload.getOriginalFilename();
		String suffix = oname.substring(oname.lastIndexOf("."));
		// 得到新的文件名
		String nname = UUID.randomUUID().toString() + suffix;
		// 得到转移路径
		String path = req.getRealPath("/upload") + File.separator + nname;

		try {
			// 文件转移
			upload.transferTo(new File(path));
			cars.setCarPicture(nname);
			// System.out.println("controller" + cars.toString());
			carService.insCar(cars);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	/**
	 * 根据客户身份证查询汽车信息
	 * 
	 * @param srchValue
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/car/selByCustomerIdentity")
	public List<Cars> selByCustomerIdentity(String srchValue) {
		// System.out.println("controller" + srchValue);

		List<Cars> list = carService.selByCustomerIdentity(srchValue);
		return list;
	}

	/**
	 * 根据客户身份证查询汽车信息
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/car/selByIsrenting")
	public List<Cars> selByIsrenting() {
		List<Cars> list = carService.selByIsrenting();
		return list;
	}

	@RequestMapping("/car/toList")
	public String toList() {
		return "WEB-INF/car/carList";
	}

	@RequestMapping("/car/toAdd")
	public String toAdd() {
		return "WEB-INF/car/insCar";
	}

	@ResponseBody
	@RequestMapping("/car/selOneByCarNumber")
	public List<Cars> selOneByCarNumber(String carNumber) {
		// System.out.println("conterller----" + carNumber);
		return carService.selOneByCarNumber(carNumber);
	}

	@ResponseBody
	@RequestMapping("/car/updIsrentingZero")
	public boolean updIsrentingZero(String carNumber) {

		boolean flag = carService.updIsrentingZero(carNumber);
		return flag;
	}

}
