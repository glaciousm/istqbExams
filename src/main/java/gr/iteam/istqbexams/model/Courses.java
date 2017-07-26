package gr.iteam.istqbexams.model;

public enum Courses {
	ISTQB_FOUNDATION("foundation"),
	ISTQB_AGILE("agile"),
	ISTQB_MANAGER("manager"),
	ISTQB_ANALYST("analyst"),
	ISTQB_AUTOMATION("automation");
	
	String course;
	
	private Courses(String course){
		this.course = course;
	}
	
	public String getCourse(){
		return course;
	}
	
}