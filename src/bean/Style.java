package bean;

public class Style {
	
	Integer id, type;
	String name, pic, en_name;
	
	public Integer getId() { return id; }
	public Integer getType() { return type; }
	public String getEnName() { return en_name; }
	public String getName() { return name; }
	public String getPic() { return pic; }
	public void setId(int id) { this.id = id; }
	public void setType(int type) { this.type = type; }
	public void setEnName(String en_name) { this.en_name = en_name; }
	public void setName(String name) { this.name = name; }
	public void setPic(String pic) { this.pic = pic; }
}
