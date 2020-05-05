package dao;

import java.util.List;

import bean.Brand;
import bean.Items;
import bean.User;
import bean.Category;
import bean.SubCategory;
import bean.Style;
import bean.Collection;

public abstract class DAOFactory {

	public static DAOFactory getDao() {
		DAOFactory dao = new SqlDAO();
		return dao;
	}
	
	public abstract List<User> getAllUser();
	public abstract User getUser(Integer id);
	public abstract Integer getNewUserCount();
	public abstract boolean addUser(User user);
	public abstract boolean	updateUser(User user);
	public abstract boolean deleteUser(Integer user_id);

	public abstract List<Brand> getAllBrand();
	public abstract boolean addBrand(Brand brand);
	public abstract boolean deleteBrand(Integer brand_id);

	public abstract List<Items> getAllItems();
	public abstract Items getItem(Integer item_id);
	public abstract Integer getNewItemCount();
	public abstract boolean addItem(Items item);
	public abstract boolean updateItem(Items item);
	public abstract boolean deleteItems(Integer items_id);
	public abstract List<Integer> getAuditCount();

	public abstract Integer getTotalOrderCount();
	
	public abstract Double getGMV();
	
	public abstract List<Category> getAllCategory();
	
	public abstract List<SubCategory> getAllSubCategory();
	
	public abstract List<Style> getAllStyle();
	
	public abstract List<Double> getSoldProduct();
	
	public abstract List<Collection> getAllCollection();
	public abstract boolean addCollection(Collection collection);
	public abstract Collection getCollection(Integer id);
	public abstract boolean  updateCollection(Collection collection);
	public abstract boolean deleteCollection(Integer id);
}
