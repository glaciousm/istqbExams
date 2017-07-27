package gr.iteam.istqbexams.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Type;

@Entity
@Table(name="results")
public class Result {
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	
	@Column(name="userId")
	int userId;
	
	@Column(name="date")
	@Type(type="timestamp")
	Date date;
	
	@Column(name="score")
	double score;
	
	@ManyToOne
    @JoinColumn(name = "courseid", referencedColumnName = "id")
	private Course course;
	
	@Transient
	String user;
	
	public Result() {
		// TODO Auto-generated constructor stub
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Result [id=" + id + ", userId=" + userId + ", date=" + date + ", score=" + score + ", course=" + course
				+ ", user=" + user + "]";
	}


}
