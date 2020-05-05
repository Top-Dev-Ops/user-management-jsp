package bean;

import java.time.LocalDateTime;

public class Collection {

	Integer id, type, on_use;
	String url, title, author, intro, product_id;
	LocalDateTime create_time, update_time;
	
	public Integer getId() { return id; }
	public Integer getType() { return type; }
	public Integer getOnUse() { return on_use; }
	public String getUrl() { return url; }
	public String getTitle() { return title; }
	public String getAuthor() { return author; }
	public String getIntro() { return intro; }
	public String getProductId() { return product_id; }
	public LocalDateTime getCreateTime() { return create_time; }
	public LocalDateTime getUpdateTime() { return update_time; }
	public void setId(int id) { this.id = id; }
	public void setType(int type) { this.type = type; }
	public void setOnUse(int on_use) { this.on_use = on_use; }
	public void setUrl(String url) { this.url = url; }
	public void setTitle(String title) { this.title = title; }
	public void setAuthor(String author) { this.author = author; }
	public void setIntro(String intro) { this.intro = intro; }
	public void setProductId(String product_id) { this.product_id = product_id; }
	public void setCreateTime(LocalDateTime create_time) { this.create_time = create_time; }
	public void setUpdateTime(LocalDateTime update_time) { this.update_time = update_time; }
}

	