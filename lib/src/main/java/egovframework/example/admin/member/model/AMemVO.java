package egovframework.example.admin.member.model;

import java.sql.Date;

public class AMemVO {
	private String userid;
	private String passwd;
	private String level;
	private String name;
	private Date birth;
	private String birthdate;
	private String phone;
	private String email;
	private String addr1;
	private String addr2;

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	/**
	 * @userid@ getter
	 * @return	userid
	 */
	public String getUserid() {
		return userid;
	}

	/**
	 * @userid@ setter
	 * @param	userid
	 */
	public void setUserid(String userid) {
		this.userid = userid;
	}

	/**
	 * @passwd@ getter
	 * @return	passwd
	 */
	public String getPasswd() {
		return passwd;
	}

	/**
	 * @passwd@ setter
	 * @param	passwd
	 */
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	/**
	 * @level@ getter
	 * @return	level
	 */
	public String getLevel() {
		return level;
	}

	/**
	 * @level@ setter
	 * @param	level
	 */
	public void setLevel(String level) {
		this.level = level;
	}

	/**
	 * @name@ getter
	 * @return	name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @name@ setter
	 * @param	name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @birth@ getter
	 * @return	birth
	 */
	public Date getBirth() {
		return birth;
	}

	/**
	 * @birth@ setter
	 * @param	birth
	 */
	public void setBirth(Date birth) {
		this.birth = birth;
	}

	/**
	 * @phone@ getter
	 * @return	phone
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * @phone@ setter
	 * @param	phone
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * @email@ getter
	 * @return	email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @email@ setter
	 * @param	email
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @addr1@ getter
	 * @return	addr1
	 */
	public String getAddr1() {
		return addr1;
	}

	/**
	 * @addr1@ setter
	 * @param	addr1
	 */
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	/**
	 * @addr2@ getter
	 * @return	addr2
	 */
	public String getAddr2() {
		return addr2;
	}

	/**
	 * @addr2@ setter
	 * @param	addr2
	 */
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	/** 
	 *
	 * @return
	 *
	 * (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */

	@Override
	public String toString() {
		return "MemberVO [userid=" + userid + ", passwd=" + passwd + ", level=" + level + ", name=" + name + ", birth=" + birth + ", birthdate=" + birthdate + ", phone=" + phone + ", email=" + email + ", addr1=" + addr1 + ", addr2=" + addr2 + "]";
	}

}
