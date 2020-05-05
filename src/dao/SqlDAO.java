package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import bean.Brand;
import bean.Items;
import bean.User;
import bean.SubCategory;
import bean.Category;
import bean.Style;
import bean.Collection;

public class SqlDAO extends DAOFactory {

	Connection con;
	Statement st;
	ResultSet rs;
	String query;
	boolean flag = false;

	@Override
	public List<User> getAllUser() {

		User user = null;
		List<User> user_list = new ArrayList<User>();
		try {
			con = DbConnection.getConnection();
			st = con.createStatement();
			query = "SELECT * FROM ums_user ORDER BY id asc";
			rs = st.executeQuery(query);
			while (rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setSex(rs.getInt("sex"));
				user.setType(rs.getInt("type"));
				user.setStatus(rs.getInt("status"));
				user.setSellLevel(rs.getInt("sell_level"));
				user.setBuyCount(rs.getInt("buy_count"));
				user.setSellCount(rs.getInt("sell_count"));
				user.setDealCount(rs.getInt("deal_count"));

				user.setUserName(rs.getString("user_name"));
				user.setPassword(rs.getString("pass_word"));
				user.setTel(rs.getString("tel"));
				user.setEmail(rs.getString("email"));
				user.setHeadPic(rs.getString("head_pic"));
				user.setIntro(rs.getString("intro"));
				user.setRealName(rs.getString("real_name"));
				user.setIdCard(rs.getString("id_card"));
				user.setDevice(rs.getString("device"));
				user.setImToken(rs.getString("im_token"));

				user.setLastLogin(
						rs.getTimestamp("last_login") != null ? rs.getTimestamp("last_login").toLocalDateTime() : null);
				user.setCreateTime(
						rs.getTimestamp("create_time") != null ? rs.getTimestamp("create_time").toLocalDateTime()
								: null);
				user.setUpdateTime(
						rs.getTimestamp("update_time") != null ? rs.getTimestamp("update_time").toLocalDateTime()
								: null);
				user_list.add(user);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return user_list;
	}

	@Override
	public Integer getNewUserCount() {
		Integer month = LocalDateTime.now().getMonthValue();
		Integer count = 0;

		try {
			con = DbConnection.getConnection();
			st = con.createStatement();
			query = "SELECT COUNT(*) FROM ums_user WHERE month(create_time) = " + month;
			rs = st.executeQuery(query);
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public User getUser(Integer id) {

		User user = null;

		try {
			con = DbConnection.getConnection();
			st = con.createStatement();
			query = "select * from ums_user where id=" + id;
			rs = st.executeQuery(query);

			if (rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setSex(rs.getInt("sex"));
				user.setType(rs.getInt("type"));
				user.setStatus(rs.getInt("status"));
				user.setSellLevel(rs.getInt("sell_level"));
				user.setBuyCount(rs.getInt("buy_count"));
				user.setSellCount(rs.getInt("sell_count"));
				user.setDealCount(rs.getInt("deal_count"));

				user.setUserName(rs.getString("user_name"));
				user.setPassword(rs.getString("pass_word"));
				user.setTel(rs.getString("tel"));
				user.setEmail(rs.getString("email"));
				user.setHeadPic(rs.getString("head_pic"));
				user.setIntro(rs.getString("intro"));
				user.setRealName(rs.getString("real_name"));
				user.setIdCard(rs.getString("id_card"));
				user.setDevice(rs.getString("device"));
				user.setImToken(rs.getString("im_token"));

				user.setLastLogin(
						rs.getTimestamp("last_login") != null ? rs.getTimestamp("last_login").toLocalDateTime() : null);
				user.setCreateTime(
						rs.getTimestamp("create_time") != null ? rs.getTimestamp("create_time").toLocalDateTime()
								: null);
				user.setUpdateTime(
						rs.getTimestamp("update_time") != null ? rs.getTimestamp("update_time").toLocalDateTime()
								: null);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public boolean addUser(User user) {
		
		try {
			con = DbConnection.getConnection();
			st = con.createStatement();
			query = "insert into ums_user(user_name, sex, pass_word, tel, email, head_pic) values('" + user.getUserName() + "',"
					+ user.getSex() + ",'" + user.getPassword() + "','" + user.getTel() + "','" + user.getEmail() + "','" + user.getHeadPic()
					+ "')";
			int r = st.executeUpdate(query);
			if (r > 0) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean updateUser(User user) {
		try {
			con = DbConnection.getConnection();
			st = con.createStatement();
			if(user.getHeadPic() == null) {
				query = "update ums_user set user_name='" + user.getUserName() + "', sex=" + user.getSex() + ", tel='"
						+ user.getTel() + "', email='" + user.getEmail() + "', pass_word='" + user.getPassword()
						+ "' where id=" + user.getId();
			} else {
				query = "update ums_user set user_name='" + user.getUserName() + "', sex=" + user.getSex() + ", tel='"
						+ user.getTel() + "', email='" + user.getEmail() + "', pass_word='" + user.getPassword()
						+ "', head_pic='" + user.getHeadPic() + "' where id=" + user.getId();
			}
			int r = st.executeUpdate(query);
			if (r > 0) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean deleteUser(Integer user_id) {
		try {
			con = DbConnection.getConnection();
			st = con.createStatement();
			query = "delete from ums_user where id='" + user_id + "' ";
			int r = st.executeUpdate(query);
			if (r > 0) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<Brand> getAllBrand() {

		Brand brand = null;
		List<Brand> brand_list = new ArrayList<Brand>();
		try {
			con = DbConnection.getConnection();
			st = con.createStatement();
			query = "select * from pms_pro_brand";
			rs = st.executeQuery(query);

			while (rs.next()) {
				brand = new Brand();
				brand.setId(rs.getInt("id"));
				brand.setType(rs.getInt("type"));
				brand.setName(rs.getString("name"));
				brand.setPic(rs.getString("pic"));
				brand_list.add(brand);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return brand_list;
	}

	@Override
	public boolean addBrand(Brand brand) {
		try {
			con = DbConnection.getConnection();
			st = con.createStatement();
			query = "insert into pms_pro_brand(name, type, pic) values('" + brand.getName() + "', " + brand.getType() + ", '" + brand.getPic() + "')";
			int r = st.executeUpdate(query);
			if (r > 0) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean deleteBrand(Integer brand_id) {

		try {
			con = DbConnection.getConnection();
			st = con.createStatement();
			query = "delete from pms_pro_brand where id='" + brand_id + "' ";
			int r = st.executeUpdate(query);
			if (r > 0) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;

	}

	@Override
	public List<Items> getAllItems() {

		Items items = null;
		List<Items> items_list = new ArrayList<Items>();
		try {
			con = DbConnection.getConnection();
			st = con.createStatement();
			query = "select * from pms_product";
			rs = st.executeQuery(query);

			while (rs.next()) {
				items = new Items();
				items.setId(rs.getInt("id"));
				items.setSellUserId(rs.getInt("sell_user_id"));
				items.setStatus(rs.getInt("status"));
				items.setCategory(rs.getInt("category"));
				items.setSubCategory(rs.getInt("sub_category"));
				items.setUseCondition(rs.getInt("use_condition"));
				items.setSize(rs.getInt("size"));
				items.setCount(rs.getInt("count"));
				items.setDiscussPrice(rs.getInt("discuss_price"));
				items.setProductSex(rs.getInt("product_sex"));
				items.setFlaw(rs.getInt("flaw"));
				items.SetPrice(rs.getDouble("price"));
				items.setProductNum(rs.getString("product_num"));
				items.setRefuseReason(rs.getString("refuse_reason"));
				items.setName(rs.getString("name"));
				items.setStyle(rs.getString("style"));
				items.setColor(rs.getString("color"));
				items.setBrand(rs.getString("brand"));
				items.setIntro(rs.getString("intro"));
				items.setPic(rs.getString("pic"));
				items.setAllPic(rs.getString("all_pic"));
				items.setFlawReason(rs.getString("flaw_reason"));
				items.setCheckTime(
						rs.getTimestamp("check_time") != null ? rs.getTimestamp("check_time").toLocalDateTime() : null);
				items.setPublishTime(
						rs.getTimestamp("publish_time") != null ? rs.getTimestamp("publish_time").toLocalDateTime()
								: null);
				items.setDealTime(
						rs.getTimestamp("deal_time") != null ? rs.getTimestamp("deal_time").toLocalDateTime() : null);
				items.setCreateTime(
						rs.getTimestamp("create_time") != null ? rs.getTimestamp("create_time").toLocalDateTime()
								: null);
				items.setUpdateTime(
						rs.getTimestamp("update_time") != null ? rs.getTimestamp("update_time").toLocalDateTime()
								: null);

				items_list.add(items);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return items_list;
	}
	
	public Items getItem(Integer id) {

		Items items = null;

		try {
			con = DbConnection.getConnection();
			st = con.createStatement();
			query = "select * from pms_product where id=" + id;
			rs = st.executeQuery(query);

			if (rs.next()) {
				items = new Items();
				items.setId(rs.getInt("id"));
				items.setSellUserId(rs.getInt("sell_user_id"));
				items.setStatus(rs.getInt("status"));
				items.setCategory(rs.getInt("category"));
				items.setSubCategory(rs.getInt("sub_category"));
				items.setUseCondition(rs.getInt("use_condition"));
				items.setSize(rs.getInt("size"));
				items.setCount(rs.getInt("count"));
				items.setDiscussPrice(rs.getInt("discuss_price"));
				items.setProductSex(rs.getInt("product_sex"));
				items.setFlaw(rs.getInt("flaw"));
				items.SetPrice(rs.getDouble("price"));
				items.setProductNum(rs.getString("product_num"));
				items.setRefuseReason(rs.getString("refuse_reason"));
				items.setName(rs.getString("name"));
				items.setStyle(rs.getString("style"));
				items.setColor(rs.getString("color"));
				items.setBrand(rs.getString("brand"));
				items.setIntro(rs.getString("intro"));
				items.setPic(rs.getString("pic"));
				items.setAllPic(rs.getString("all_pic"));
				items.setFlawReason(rs.getString("flaw_reason"));
				items.setCheckTime(
						rs.getTimestamp("check_time") != null ? rs.getTimestamp("check_time").toLocalDateTime() : null);
				items.setPublishTime(
						rs.getTimestamp("publish_time") != null ? rs.getTimestamp("publish_time").toLocalDateTime()
								: null);
				items.setDealTime(
						rs.getTimestamp("deal_time") != null ? rs.getTimestamp("deal_time").toLocalDateTime() : null);
				items.setCreateTime(
						rs.getTimestamp("create_time") != null ? rs.getTimestamp("create_time").toLocalDateTime()
								: null);
				items.setUpdateTime(
						rs.getTimestamp("update_time") != null ? rs.getTimestamp("update_time").toLocalDateTime()
								: null);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return items;
	}


	@Override
	public Integer getNewItemCount() {
		Integer month = LocalDateTime.now().getMonthValue();
		Integer count = 0;

		try {
			con = DbConnection.getConnection();
			st = con.createStatement();
			query = "SELECT COUNT(*) FROM pms_product WHERE month(create_time) = " + month;
			rs = st.executeQuery(query);
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public List<Integer> getAuditCount() {
		List<Integer> audits = new ArrayList<Integer>();
		for (int i = 0; i < 7; i++)
			audits.add(0);
		try {
			con = DbConnection.getConnection();
			st = con.createStatement();
			query = "SELECT COUNT(*), status FROM pms_product GROUP BY status";
			rs = st.executeQuery(query);
			while (rs.next()) {
				audits.set(rs.getInt(2), rs.getInt(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return audits;
	}

	@Override
	public boolean addItem(Items item) {
		try {
			con = DbConnection.getConnection();
			st = con.createStatement();
			query = "insert into pms_product(name, product_num, status, category, sub_category, style, sell_user_id, use_condition, brand, price, intro, count, discuss_price, pic, all_pic) values('"
					+ item.getName() + "','" + item.getProductNum() + "'," + item.getStatus() + "," + item.getCategory()
					+ "," + item.getSubCategory() + ",'" + item.getStyle() + "', 0, 0, '', 0, '', 0, 0, '" + item.getPic() + "', '" + item.getAllPic() + "')";
			int r = st.executeUpdate(query);
			if (r > 0) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean updateItem(Items item) {
		try {
			con = DbConnection.getConnection();
			st = con.createStatement();
			if(item.getPic() == null) {
				query = "update pms_product set name='" + item.getName() + "', status=" + item.getStatus()
					+ ", product_num='" + item.getProductNum() + "', brand='" + item.getBrand() + "', intro='"
					+ item.getIntro() + "', count=" + item.getCount() + ", category=" + item.getCategory() + ", price="
					+ item.getPrice() + ", all_pic='" + item.getAllPic() + "' where id=" + item.getId();
			} else {
				query = "update pms_product set name='" + item.getName() + "', status=" + item.getStatus()
						+ ", product_num='" + item.getProductNum() + "', brand='" + item.getBrand() + "', intro='"
						+ item.getIntro() + "', count=" + item.getCount() + ", category=" + item.getCategory() + ", price="
						+ item.getPrice() + ", pic='" + item.getPic() + "', all_pic='" + item.getAllPic() + "' where id=" + item.getId();
			}
			int r = st.executeUpdate(query);
			if (r > 0) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean deleteItems(Integer items_id) {

		try {
			con = DbConnection.getConnection();
			st = con.createStatement();
			query = "delete from pms_product where id='" + items_id + "' ";
			int r = st.executeUpdate(query);
			if (r > 0) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;

	}

	public List<Category> getAllCategory() {

		Category category = null;
		List<Category> category_list = new ArrayList<Category>();
		try {
			con = DbConnection.getConnection();
			st = con.createStatement();
			query = "select * from pms_pro_category";
			rs = st.executeQuery(query);

			while (rs.next()) {
				category = new Category();
				category.setId(rs.getInt("id"));
				category.setType(rs.getInt("type"));
				category.setName(rs.getString("name"));
				category.setPic(rs.getString("pic"));
				category_list.add(category);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return category_list;
	}

	public List<SubCategory> getAllSubCategory() {

		SubCategory sub_category = null;
		List<SubCategory> sub_category_list = new ArrayList<SubCategory>();
		try {
			con = DbConnection.getConnection();
			st = con.createStatement();
			query = "select * from pms_pro_sub_category";
			rs = st.executeQuery(query);

			while (rs.next()) {
				sub_category = new SubCategory();
				sub_category.setId(rs.getInt("id"));
				sub_category.setType(rs.getInt("type"));
				sub_category.setName(rs.getString("name"));
				sub_category.setPic(rs.getString("pic"));
				sub_category_list.add(sub_category);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return sub_category_list;
	}

	public List<Style> getAllStyle() {

		Style style = null;
		List<Style> style_list = new ArrayList<Style>();
		try {
			con = DbConnection.getConnection();
			st = con.createStatement();
			query = "select * from pms_pro_style";
			rs = st.executeQuery(query);

			while (rs.next()) {
				style = new Style();
				style.setId(rs.getInt("id"));
				style.setType(rs.getInt("type"));
				style.setName(rs.getString("name"));
				style.setPic(rs.getString("pic"));
				style.setEnName(rs.getString("en_name"));
				style_list.add(style);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return style_list;
	}

	public Integer getTotalOrderCount() {
		Integer count = 0;

		try {
			con = DbConnection.getConnection();
			st = con.createStatement();
			query = "SELECT COUNT(*) FROM oms_order";
			rs = st.executeQuery(query);
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public Double getGMV() {
		Double gmv = 0.0;
		try {
			con = DbConnection.getConnection();
			st = con.createStatement();
			query = "SELECT SUM(deal_price) FROM oms_sold_product";
			rs = st.executeQuery(query);
			if (rs.next()) {
				gmv = rs.getDouble(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return gmv;
	}

	public List<Double> getSoldProduct() {
		List<Double> soldProduct = new ArrayList<Double>(12);
		for (int i = 0; i < 12; i++)
			soldProduct.add(0.0);
		try {
			con = DbConnection.getConnection();
			st = con.createStatement();
			query = "SELECT SUM(deal_price), MONTH(deal_time) FROM oms_sold_product GROUP By MONTH(deal_time)";
			rs = st.executeQuery(query);

			while (rs.next()) {
				soldProduct.set(rs.getInt(2) - 1, rs.getDouble(1));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return soldProduct;
	}

	public List<Collection> getAllCollection() {

		Collection collection = null;
		List<Collection> collection_list = new ArrayList<Collection>();
		try {
			con = DbConnection.getConnection();
			st = con.createStatement();
			query = "select * from pms_collection";
			rs = st.executeQuery(query);

			while (rs.next()) {
				collection = new Collection();
				collection.setId(rs.getInt("id"));
				collection.setType(rs.getInt("type"));
				collection.setOnUse(rs.getInt("on_use"));
				collection.setUrl(rs.getString("url"));
				collection.setTitle(rs.getString("title"));
				collection.setAuthor(rs.getString("author"));
				collection.setIntro(rs.getString("intro"));
				collection.setProductId(rs.getString("product_id"));
				collection.setCreateTime(
						rs.getTimestamp("create_time") != null ? rs.getTimestamp("create_time").toLocalDateTime() : null);
				collection.setUpdateTime(
						rs.getTimestamp("update_time") != null ? rs.getTimestamp("update_time").toLocalDateTime() : null);
				collection_list.add(collection);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return collection_list;
	}
	
	@Override
	public boolean addCollection(Collection collection) {
		
		try {
			con = DbConnection.getConnection();
			st = con.createStatement();
			query = "insert into pms_collection(title, author, intro, product_id, type, on_use, create_time, update_time, url) values('" + collection.getTitle() + "','"
					+ collection.getAuthor() + "','" + collection.getIntro() + "','" + collection.getProductId() + "'," + collection.getType()
					+ "," + collection.getOnUse() + ", now(), now(), '" + collection.getUrl() + "')";
			int r = st.executeUpdate(query);
			if (r > 0) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	@Override
	public Collection getCollection(Integer id) {

		Collection collection= null;

		try {
			con = DbConnection.getConnection();
			st = con.createStatement();
			query = "select * from pms_collection where id=" + id;
			rs = st.executeQuery(query);

			if (rs.next()) {
				collection = new Collection();
				collection.setId(rs.getInt("id"));
				collection.setType(rs.getInt("type"));
				collection.setOnUse(rs.getInt("on_use"));
				collection.setUrl(rs.getString("url"));
				
				collection.setTitle(rs.getString("title"));
				collection.setAuthor(rs.getString("author"));
				collection.setIntro(rs.getString("intro"));
				collection.setProductId(rs.getString("product_id"));
				collection.setCreateTime(
						rs.getTimestamp("create_time") != null ? rs.getTimestamp("create_time").toLocalDateTime() : null);
				collection.setUpdateTime(
						rs.getTimestamp("update_time") != null ? rs.getTimestamp("update_time").toLocalDateTime()
								: null);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return collection;
	}
	
	@Override
	public boolean updateCollection(Collection collection) {
		try {
			con = DbConnection.getConnection();
			st = con.createStatement();
			if(collection.getUrl() == null) {
				query = "update pms_collection set title='" + collection.getTitle() + "', author='" + collection.getAuthor() + "', intro='"
						+ collection.getIntro() + "', product_id='" + collection.getProductId() + "', type=" + collection.getType()
						+ ", on_use=" + collection.getOnUse() + " where id=" + collection.getId();
			} else {
				query = "update pms_collection set title='" + collection.getTitle() + "', author='" + collection.getAuthor() + "', intro='"
						+ collection.getIntro() + "', product_id='" + collection.getProductId() + "', type=" + collection.getType()
						+ ", on_use=" + collection.getOnUse() + ", url='" + collection.getUrl() + "' where id=" + collection.getId();
			}
			int r = st.executeUpdate(query);
			if (r > 0) { 
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	@Override
	public boolean deleteCollection(Integer id) {

		try {
			con = DbConnection.getConnection();
			st = con.createStatement();
			query = "delete from pms_collection where id='" + id + "' ";
			int r = st.executeUpdate(query);
			if (r > 0) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;

	}
}
