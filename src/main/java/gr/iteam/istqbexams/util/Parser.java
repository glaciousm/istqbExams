package gr.iteam.istqbexams.util;

public class Parser {
	
	public static String parseString(String str){
		String formattedStr = str.replace("\n", "").replace("\r", "<br>");
		return formattedStr;
	}
	
	public static String parseBR(String str){
		String formattedStr = str.replace("<br>", "&nbsp;").replace("</br>", "");
		return formattedStr;
	}

}
