package gr.iteam.istqbexams.model;

public enum CorrectAnswer {
	A("a"),
	B("b"),
	C("c"),
	D("d"),
	E("e");
	
	String correctAnswer;
	
	private CorrectAnswer(String correctAnswer){
		this.correctAnswer = correctAnswer;
	}
	
	public String getCorrectAnswer(){
		return correctAnswer;
	}
	
}
