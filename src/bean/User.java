package bean;

import java.time.LocalDateTime;

public class User {


	Integer id, sex, type, status, sell_level, buy_count, sell_count, deal_count;
	String user_name, pass_word, tel, email, head_pic, intro, real_name, id_card, device, im_token;
	LocalDateTime last_login, create_time, update_time;

	public int getId() { return id; }
	public int getSex() { return sex; }
	public int getType() { return type; }
	public int getStatus() { return status;	}
	public int getSellLevel() { return sell_level; }
	public int getBuyCount() { return buy_count; }
	public int getSellCount() { return sell_count; }
	public int getDealCount() { return deal_count; }
	public void setId(int id) { this.id = id; }
	public void setSex(int sex) { this.sex = sex; }
	public void setType(int type) {	this.type = type; }
	public void setStatus(int status) {	this.status = status; }
	public void setSellLevel(int sell_level) { this.sell_level = sell_level; }
	public void setBuyCount(int buy_count) { this.buy_count = buy_count; }
	public void setSellCount(int sell_count) { this.sell_count = sell_count; }
	public void setDealCount(int deal_count) { this.deal_count = deal_count; }
	public String getUserName() { return user_name; }
	public String getPassword() { return pass_word; }
	public String getTel() { return tel; }
	public String getEmail() { return email; }
	public String getHeadPic() { return head_pic; }
	public String getIntro() { return intro; }
	public String getRealName() { return real_name; }
	public String getIdCard() { return id_card; }
	public String getDevice() { return device; }
	public String getImToken() { return im_token; }
	public void setUserName(String user_name) { this.user_name = user_name; }
	public void setPassword(String pass_word) { this.pass_word = pass_word; }
	public void setTel(String tel) { this.tel = tel; }
	public void setEmail(String email) { this.email = email; }
	public void setHeadPic(String head_pic) { this.head_pic = head_pic; }
	public void setIntro(String intro) { this.intro = intro; }
	public void setRealName(String real_name) { this.real_name = real_name; }
	public void setIdCard(String id_card) { this.id_card = id_card; }
	public void setDevice(String device) { this.device = device; }
	public void setImToken(String im_token) { this.im_token = im_token; }
	public LocalDateTime getLastLogin() { return last_login; }
	public LocalDateTime getCreateTime() { return create_time; }
	public LocalDateTime getUpdateTime() { return update_time; }
	public void setLastLogin(LocalDateTime last_login) { this.last_login = last_login; }
	public void setCreateTime(LocalDateTime create_time) { this.create_time = create_time; }
	public void setUpdateTime(LocalDateTime update_time) { this.update_time = update_time; }
}

	