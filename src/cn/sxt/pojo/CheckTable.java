package cn.sxt.pojo;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CheckTable implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String checkId;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date checkDate;
	private String field;
	private String problem;
	private Integer paying;
	private String checkUser;
	private Integer rentId;
	/**
	 * @return the checkId
	 */
	public String getCheckId() {
		return checkId;
	}
	/**
	 * @param checkId
	 *            the checkId to set
	 */
	public void setCheckId(String checkId) {
		this.checkId = checkId;
	}
	/**
	 * @return the checkDate
	 */
	public Date getCheckDate() {
		return checkDate;
	}
	/**
	 * @param checkDate
	 *            the checkDate to set
	 */
	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}
	/**
	 * @return the field
	 */
	public String getField() {
		return field;
	}
	/**
	 * @param field
	 *            the field to set
	 */
	public void setField(String field) {
		this.field = field;
	}
	/**
	 * @return the problem
	 */
	public String getProblem() {
		return problem;
	}
	/**
	 * @param problem
	 *            the problem to set
	 */
	public void setProblem(String problem) {
		this.problem = problem;
	}
	/**
	 * @return the paying
	 */
	public Integer getPaying() {
		return paying;
	}
	/**
	 * @param paying
	 *            the paying to set
	 */
	public void setPaying(Integer paying) {
		this.paying = paying;
	}
	/**
	 * @return the checkUser
	 */
	public String getCheckUser() {
		return checkUser;
	}
	/**
	 * @param checkUser
	 *            the checkUser to set
	 */
	public void setCheckUser(String checkUser) {
		this.checkUser = checkUser;
	}
	/**
	 * @return the rentId
	 */
	public Integer getRentId() {
		return rentId;
	}
	/**
	 * @param rentId
	 *            the rentId to set
	 */
	public void setRentId(Integer rentId) {
		this.rentId = rentId;
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
		result = prime * result + ((checkId == null) ? 0 : checkId.hashCode());
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
		CheckTable other = (CheckTable) obj;
		if (checkId == null) {
			if (other.checkId != null)
				return false;
		} else if (!checkId.equals(other.checkId))
			return false;
		return true;
	}
	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "CheckTable [checkId=" + checkId + ", checkDate=" + checkDate
				+ ", field=" + field + ", problem=" + problem + ", paying="
				+ paying + ", checkUser=" + checkUser + ", rentId=" + rentId
				+ "]";
	}

}
