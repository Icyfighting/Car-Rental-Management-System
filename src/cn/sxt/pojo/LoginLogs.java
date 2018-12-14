package cn.sxt.pojo;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class LoginLogs implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer loginLogId;
	private String loginName;
	private String loginIp;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date loginTime;

	public Integer getLoginLogId() {
		return loginLogId;
	}

	public void setLoginLogId(Integer loginLogId) {
		this.loginLogId = loginLogId;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getLoginIp() {
		return loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	public Date getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	@Override
	public String toString() {
		return "LoginLogs [loginLogId=" + loginLogId + ", loginName="
				+ loginName + ", loginIp=" + loginIp + ", loginTime="
				+ loginTime + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((loginLogId == null) ? 0 : loginLogId.hashCode());
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
		LoginLogs other = (LoginLogs) obj;
		if (loginLogId == null) {
			if (other.loginLogId != null)
				return false;
		} else if (!loginLogId.equals(other.loginLogId))
			return false;
		return true;
	}

}
