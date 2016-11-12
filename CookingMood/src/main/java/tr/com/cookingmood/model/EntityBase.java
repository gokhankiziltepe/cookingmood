package tr.com.cookingmood.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.PrePersist;
import javax.persistence.PreRemove;
import javax.persistence.PreUpdate;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Version;


@SuppressWarnings("serial")
@Entity(name = "ENTITY_BASE")
@Inheritance(strategy = InheritanceType.JOINED)
public class EntityBase implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID", updatable = false, nullable = false)
	private Long id = null;

	@Version
	@Column(name = "VERSION")
	private int version = 0;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATE_DATE")
	private Date createDate;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "UPDATE_DATE")
	private Date updateDate;

	@Column(name = "OPERATION")
	private String operation;

	@Column(name = "ACTIVE")
	private boolean active = true;

	protected void copy(final EntityBase source) {
		this.id = source.id;
		this.version = source.version;
		this.createDate = source.createDate;
		this.updateDate = source.updateDate;
		this.operation = source.operation;
		this.active = source.active;
	}

	@PrePersist
	public void onPrePersist() {
		audit("INSERT");
		setCreateDate(new Date());
	}

	@PreUpdate
	public void onPreUpdate() {
		audit("UPDATE");
	}

	@PreRemove
	public void onPreRemove() {
		audit("DELETE");
	}

	private void audit(String operation) {
		setOperation(operation);
		setUpdateDate(new Date());
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	@Override
	public boolean equals(final Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (!(obj instanceof EntityBase)) {
			return false;
		}
		final EntityBase other = (EntityBase) obj;
		if (this.id != null && other.id != null) {
			if (this.id != other.id) {
				return false;
			}
		}
		return true;
	}

}