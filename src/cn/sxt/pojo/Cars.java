package cn.sxt.pojo;

import java.io.Serializable;

public class Cars implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String carNumber;
	private String carType;
	private String color;
	private Integer price;
	private Integer rentPrice;
	private Integer deposit;
	private Integer isrenting;
	private String carPicture;
	private String description;

	/**
	 * @return the carNumber
	 */
	public String getCarNumber() {
		return carNumber;
	}

	/**
	 * @param carNumber
	 *            the carNumber to set
	 */
	public void setCarNumber(String carNumber) {
		this.carNumber = carNumber;
	}

	/**
	 * @return the carType
	 */
	public String getCarType() {
		return carType;
	}

	/**
	 * @param carType
	 *            the carType to set
	 */
	public void setCarType(String carType) {
		this.carType = carType;
	}

	/**
	 * @return the color
	 */
	public String getColor() {
		return color;
	}

	/**
	 * @param color
	 *            the color to set
	 */
	public void setColor(String color) {
		this.color = color;
	}

	/**
	 * @return the price
	 */
	public Integer getPrice() {
		return price;
	}

	/**
	 * @param price
	 *            the price to set
	 */
	public void setPrice(Integer price) {
		this.price = price;
	}

	/**
	 * @return the rentPrice
	 */
	public Integer getRentPrice() {
		return rentPrice;
	}

	/**
	 * @param rentPrice
	 *            the rentPrice to set
	 */
	public void setRentPrice(Integer rentPrice) {
		this.rentPrice = rentPrice;
	}

	/**
	 * @return the deposit
	 */
	public Integer getDeposit() {
		return deposit;
	}

	/**
	 * @param deposit
	 *            the deposit to set
	 */
	public void setDeposit(Integer deposit) {
		this.deposit = deposit;
	}

	/**
	 * @return the isrenting
	 */
	public Integer getIsrenting() {
		return isrenting;
	}

	/**
	 * @param isrenting
	 *            the isrenting to set
	 */
	public void setIsrenting(Integer isrenting) {
		this.isrenting = isrenting;
	}

	public String getCarPicture() {
		return carPicture;
	}

	public void setCarPicture(String carPicture) {
		this.carPicture = carPicture;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description
	 *            the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((carNumber == null) ? 0 : carNumber.hashCode());
		return result;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cars other = (Cars) obj;
		if (carNumber == null) {
			if (other.carNumber != null)
				return false;
		} else if (!carNumber.equals(other.carNumber))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Cars [carNumber=" + carNumber + ", carType=" + carType
				+ ", color=" + color + ", price=" + price + ", rentPrice="
				+ rentPrice + ", deposit=" + deposit + ", isrenting="
				+ isrenting + ", carPicture=" + carPicture + ", description="
				+ description + "]";
	}

}
