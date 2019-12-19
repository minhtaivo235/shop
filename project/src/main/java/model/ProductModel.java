package model;

public class ProductModel extends AbstractModel<ProductModel> {
	private String name;
	private Integer origin_price;
	private Integer sale_price;
	private String image;
	private String brand;
	private Long categoryid;	
	private String wire_type;	
	private String status;	
	private String glass_surface;	
	private String material_case;	
	private String size;	
	private String guarantee;	
	private String trademark;	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getOrigin_price() {
		return origin_price;
	}
	public void setOrigin_price(int origin_price) {
		this.origin_price = origin_price;
	}
	public int getSale_price() {
		return sale_price;
	}
	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public long getCategoryid() {
		return categoryid;
	}
	public void setCategoryid(long categoryid) {
		this.categoryid = categoryid;
	}
	public String getWire_type() {
		return wire_type;
	}
	public void setWire_type(String wire_type) {
		this.wire_type = wire_type;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMaterial_case() {
		return material_case;
	}
	public void setMaterial_case(String material_case) {
		this.material_case = material_case;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getGuarantee() {
		return guarantee;
	}
	public void setGuarantee(String guarantee) {
		this.guarantee = guarantee;
	}
	
	public void setOrigin_price(Integer origin_price) {
		this.origin_price = origin_price;
	}
	public void setSale_price(Integer sale_price) {
		this.sale_price = sale_price;
	}
	
	public void setCategoryid(Long categoryid) {
		this.categoryid = categoryid;
	}
	public String getGlass_surface() {
		return glass_surface;
	}
	public void setGlass_surface(String glass_surface) {
		this.glass_surface = glass_surface;
	}
	public String getTrademark() {
		return trademark;
	}
	public void setTrademark(String trademark) {
		this.trademark = trademark;
	}
	
	

}
