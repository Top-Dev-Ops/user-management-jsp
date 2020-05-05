package bean;

import java.time.LocalDateTime;

public class Items {

	Integer id, sell_user_id, status, category, sub_category, use_condition, size, count, discuss_price, product_sex, flaw;
	Double price;
	String product_num, refuse_reason, name, style, color, brand, intro, pic, all_pic, flaw_reason;
	LocalDateTime check_time, publish_time, deal_time, create_time, update_time;
	
	public int getId() { return id; }
	public int getSellUserId() { return sell_user_id; }
	public int getStatus() { return status; }
	public int getCategory() { return category; }
	public int getSubCategory() { return sub_category; }
	public int getUseCondition() { return use_condition; }
	public int getSize() { return size; }
	public int getCount() { return count; }
	public int getDiscussPrice() { return discuss_price; }
	public int getProductSex() { return product_sex; }
	public int getFlaw() { return flaw; }
	public Double getPrice() { return price; }
	public String getProductNum() { return product_num; }
	public String getRefuseReason() { return product_num; }
	public String getName() { return name; }
	public String getStyle() { return style; }
	public String getColor() { return color; }
	public String getBrand() { return brand; }
	public String getIntro() { return intro; }
	public String getPic() { return pic; }
	public String getAllPic() { return all_pic; }
	public String getFlawReason() { return flaw_reason; }
	public LocalDateTime getCheckTime() { return check_time; }
	public LocalDateTime getPublishTime() { return publish_time; }
	public LocalDateTime getDealTime() { return deal_time; }
	public LocalDateTime getCreateTime() { return create_time; }
	public LocalDateTime getUpdateTime() { return update_time; }
	
	public void setId(int id) { this.id = id; }
	public void setSellUserId(int sell_user_id) { this.sell_user_id = sell_user_id; }
	public void setStatus(int status) { this.status = status; }
	public void setCategory(int category) { this.category = category; }
	public void setSubCategory(int sub_category) { this.sub_category = sub_category; }
	public void setUseCondition(int use_condition) { this.use_condition = use_condition; }
	public void setSize(int size) { this.size = size; }
	public void setCount(int count) { this.count = count; }
	public void setDiscussPrice(int discuss_price) { this.discuss_price= discuss_price; }
	public void setProductSex(int product_sex) { this.product_sex = product_sex; }
	public void setFlaw(int flaw) { this.flaw = flaw; }
	public void SetPrice(Double price) { this.price = price; }
	public void setProductNum(String product_num) { this.product_num = product_num; }
	public void setRefuseReason(String refuse_reason) { this.refuse_reason = refuse_reason; }
	public void setName(String name) { this.name = name; }
	public void setStyle(String style) { this.style = style; }
	public void setColor(String color) { this.color = color; }
	public void setBrand(String brand) { this.brand = brand; }
	public void setIntro(String intro) { this.intro = intro; }
	public void setPic(String pic) { this.pic = pic; }
	public void setAllPic(String all_pic) { this.all_pic = all_pic; }
	public void setFlawReason(String flaw_reason) { this.flaw_reason = flaw_reason; }
	public void setCheckTime(LocalDateTime check_time) { this.check_time = check_time; }
	public void setPublishTime(LocalDateTime publish_time) { this.publish_time = publish_time; }
	public void setDealTime(LocalDateTime deal_time) { this.deal_time = deal_time; }
	public void setCreateTime(LocalDateTime create_time) { this.create_time = create_time; }
	public void setUpdateTime(LocalDateTime update_time) { this.update_time = update_time; }

}

	