package web.salons.model;
// Generated Feb 22, 2021 12:43:00 AM by Hibernate Tools 4.3.1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * ImageServices generated by hbm2java
 */
@Entity
@Table(name = "imageServices")
public class ImageService implements java.io.Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "imageServiceID", unique = true)
	private int imageServiceId;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "serviceDetailID")
	private ServiceDetail servicesDetails;
	@Column(name = "linkImage")
	private String linkImage;

	public ImageService() {

	}

	public ImageService(ServiceDetail servicesDetails, String linkImage) {
		this.servicesDetails = servicesDetails;
		this.linkImage = linkImage;
	}

	public int getImageServiceId() {
		return this.imageServiceId;
	}

	public void setImageServiceId(int imageServiceId) {
		this.imageServiceId = imageServiceId;
	}

	public ServiceDetail getServicesDetails() {
		return this.servicesDetails;
	}

	public void setServicesDetails(ServiceDetail servicesDetails) {
		this.servicesDetails = servicesDetails;
	}

	public String getLinkImage() {
		return this.linkImage;
	}

	public void setLinkImage(String linkImage) {
		this.linkImage = linkImage;
	}

}
