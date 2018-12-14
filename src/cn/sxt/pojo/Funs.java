package cn.sxt.pojo;

import java.io.Serializable;

public class Funs implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer funId;
	private String funName;
	private String funUrl;
	private Integer menuId;
	/**
	 * @return the funId
	 */
	public Integer getFunId() {
		return funId;
	}
	/**
	 * @param funId
	 *            the funId to set
	 */
	public void setFunId(Integer funId) {
		this.funId = funId;
	}
	/**
	 * @return the funName
	 */
	public String getFunName() {
		return funName;
	}
	/**
	 * @param funName
	 *            the funName to set
	 */
	public void setFunName(String funName) {
		this.funName = funName;
	}
	/**
	 * @return the funUrl
	 */
	public String getFunUrl() {
		return funUrl;
	}
	/**
	 * @param funUrl
	 *            the funUrl to set
	 */
	public void setFunUrl(String funUrl) {
		this.funUrl = funUrl;
	}
	/**
	 * @return the menuId
	 */
	public Integer getMenuId() {
		return menuId;
	}
	/**
	 * @param menuId
	 *            the menuId to set
	 */
	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
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
		result = prime * result + ((funId == null) ? 0 : funId.hashCode());
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
		Funs other = (Funs) obj;
		if (funId == null) {
			if (other.funId != null)
				return false;
		} else if (!funId.equals(other.funId))
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
		return "Funs [funId=" + funId + ", funName=" + funName + ", funUrl="
				+ funUrl + ", menuId=" + menuId + "]";
	}

}
