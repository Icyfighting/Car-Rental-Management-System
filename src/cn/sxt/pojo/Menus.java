package cn.sxt.pojo;

import java.awt.Menu;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Menus implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String text;
	private String url;
	private Integer fatherId;
	private List<Menus> children = new ArrayList<>();
	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * @return the text
	 */
	public String getText() {
		return text;
	}
	/**
	 * @param text
	 *            the text to set
	 */
	public void setText(String text) {
		this.text = text;
	}
	/**
	 * @return the url
	 */
	public String getUrl() {
		return url;
	}
	/**
	 * @param url
	 *            the url to set
	 */
	public void setUrl(String url) {
		this.url = url;
	}
	/**
	 * @return the fatherId
	 */
	public Integer getFatherId() {
		return fatherId;
	}
	/**
	 * @param fatherId
	 *            the fatherId to set
	 */
	public void setFatherId(Integer fatherId) {
		this.fatherId = fatherId;
	}
	/**
	 * @return the children
	 */
	public List<Menus> getChildren() {
		return children;
	}
	/**
	 * @param children
	 *            the children to set
	 */
	public void setChildren(List<Menus> children) {
		this.children = children;
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
		result = prime * result + ((id == null) ? 0 : id.hashCode());
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
		Menus other = (Menus) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
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
		return "Menus [id=" + id + ", text=" + text + ", url=" + url
				+ ", fatherId=" + fatherId + ", children=" + children + "]";
	}

}
