package bean;

public class SubCategory {
	
	Integer id, type, category_id;
	String name, pic;
	
	public Integer getId() { return id; }
	public Integer getType() { return type; }
	public Integer getCategoryId() { return category_id; }
	public String getName() { return name; }
	public String getPic() { return pic; }
	public void setId(int id) { this.id = id; }
	public void setType(int type) { this.type = type; }
	public void setCategoryId(int category_id) { this.category_id = category_id; }
	public void setName(String name) { this.name = name; }
	public void setPic(String pic) { this.pic = pic; }
}
