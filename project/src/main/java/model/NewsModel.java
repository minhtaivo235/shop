package model;

import java.sql.Timestamp;

public class NewsModel extends AbstractModel<NewsModel> {
	private String title;
	private String thumbnail;
	private Long categoryid;
	private String shortdesciption;
	private String content;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public long getCategoryid() {
		return categoryid;
	}
	public void setCategoryid(long categoryid) {
		this.categoryid = categoryid;
	}
	public String getShortdesciption() {
		return shortdesciption;
	}
	public void setShortdesciption(String shortdesciption) {
		this.shortdesciption = shortdesciption;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	

}
