package gr.iteam.istqbexams.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="questions")
public class Question {
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name="chapter")
	private int chapter;
	
	@Column(name="context")
	private String context;
	
	@Column(name="difficulty")
	private int difficulty;
	
	@Column(name="responsea")
	private String answera;
	
	@Column(name="responseb")
	private String answerb;
	
	@Column(name="responsec")
	private String answerc;
	
	@Column(name="responsed")
	private String answerd;
	
	@Column(name="responsee")
	private String answere;
	
	@Column(name="correct")
	private String correct;
	
	@Column(name="course")
	private String course;
	
	@Transient
	private String selected;
	
	public Question() {
		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getChapter() {
		return chapter;
	}

	public void setChapter(int chapter) {
		this.chapter = chapter;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public int getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(int difficulty) {
		this.difficulty = difficulty;
	}

	public String getAnswera() {
		return answera;
	}

	public void setAnswera(String answera) {
		this.answera = answera;
	}

	public String getAnswerb() {
		return answerb;
	}

	public void setAnswerb(String answerb) {
		this.answerb = answerb;
	}

	public String getAnswerc() {
		return answerc;
	}

	public void setAnswerc(String answerc) {
		this.answerc = answerc;
	}

	public String getAnswerd() {
		return answerd;
	}

	public void setAnswerd(String answerd) {
		this.answerd = answerd;
	}

	public String getAnswere() {
		return answere;
	}

	public void setAnswere(String answere) {
		this.answere = answere;
	}

	public String getCorrect() {
		return correct;
	}

	public void setCorrect(String correct) {
		this.correct = correct;
	}

	public String getSelected() {
		return selected;
	}

	public void setSelected(String selected) {
		this.selected = selected;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	@Override
	public String toString() {
		return "Question [id=" + id + ", chapter=" + chapter + ", context=" + context + ", difficulty=" + difficulty
				+ ", answera=" + answera + ", answerb=" + answerb + ", answerc=" + answerc + ", answerd=" + answerd
				+ ", answere=" + answere + ", correct=" + correct + ", course=" + course + ", selected=" + selected
				+ "]";
	}

	
}
