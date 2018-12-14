package cn.sxt.pojo;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class RentTable implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3513393899426705724L;
	private Integer tableId;
	private Integer imprest;
	private Integer shouldPayPrice;
	private Integer price;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date beginDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date shouldReturnDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date returnDate;
	private Integer rentFlag;
	private String userName;
	private String carId;
	private String custId;

	/**
	 * @return tableId
	 */
	public Integer getTableId() {
		return tableId;
	}

	/**
	 * @param tableId
	 *            要设置的 tableId
	 */
	public void setTableId(Integer tableId) {
		this.tableId = tableId;
	}

	/**
	 * @return imprest
	 */
	public Integer getImprest() {
		return imprest;
	}

	/**
	 * @param imprest
	 *            要设置的 imprest
	 */
	public void setImprest(Integer imprest) {
		this.imprest = imprest;
	}

	/**
	 * @return shouldPayPrice
	 */
	public Integer getShouldPayPrice() {
		return shouldPayPrice;
	}

	/**
	 * @param shouldPayPrice
	 *            要设置的 shouldPayPrice
	 */
	public void setShouldPayPrice(Integer shouldPayPrice) {
		this.shouldPayPrice = shouldPayPrice;
	}

	/**
	 * @return price
	 */
	public Integer getPrice() {
		return price;
	}

	/**
	 * @param price
	 *            要设置的 price
	 */
	public void setPrice(Integer price) {
		this.price = price;
	}

	/**
	 * @return beginDate
	 */
	public Date getBeginDate() {
		return beginDate;
	}

	/**
	 * @param beginDate
	 *            要设置的 beginDate
	 */
	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	/**
	 * @return shouldReturnDate
	 */
	public Date getShouldReturnDate() {
		return shouldReturnDate;
	}

	/**
	 * @param shouldReturnDate
	 *            要设置的 shouldReturnDate
	 */
	public void setShouldReturnDate(Date shouldReturnDate) {
		this.shouldReturnDate = shouldReturnDate;
	}

	/**
	 * @return returnDate
	 */
	public Date getReturnDate() {
		return returnDate;
	}

	/**
	 * @param returnDate
	 *            要设置的 returnDate
	 */
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	/**
	 * @return rentFlag
	 */
	public Integer getRentFlag() {
		return rentFlag;
	}

	/**
	 * @param rentFlag
	 *            要设置的 rentFlag
	 */
	public void setRentFlag(Integer rentFlag) {
		this.rentFlag = rentFlag;
	}

	/**
	 * @return userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName
	 *            要设置的 userName
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return carId
	 */
	public String getCarId() {
		return carId;
	}

	/**
	 * @param carId
	 *            要设置的 carId
	 */
	public void setCarId(String carId) {
		this.carId = carId;
	}

	/**
	 * @return custId
	 */
	public String getCustId() {
		return custId;
	}

	/**
	 * @param custId
	 *            要设置的 custId
	 */
	public void setCustId(String custId) {
		this.custId = custId;
	}

	@Override
	public String toString() {
		return "RentTable [tableId=" + tableId + ", imprest=" + imprest
				+ ", shouldPayPrice=" + shouldPayPrice + ", price=" + price
				+ ", beginDate=" + beginDate + ", shouldReturnDate="
				+ shouldReturnDate + ", returnDate=" + returnDate
				+ ", rentFlag=" + rentFlag + ", userName=" + userName
				+ ", carId=" + carId + ", custId=" + custId + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((tableId == null) ? 0 : tableId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RentTable other = (RentTable) obj;
		if (tableId == null) {
			if (other.tableId != null)
				return false;
		} else if (!tableId.equals(other.tableId))
			return false;
		return true;
	}

}
