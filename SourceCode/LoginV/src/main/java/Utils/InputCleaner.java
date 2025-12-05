package Utils;

public class InputCleaner {


	public static String trimEnd(String input) {
	    if (input == null) return null;
	    return input.replaceAll("\\s+$", "");
	}
	
	public static String removeMiddleSpaces(String input) {
	    if (input == null) return null;
	    return input.replaceAll("\\s+(?=\\S)", "").replaceAll("(?<=\\S)\\s+", "");
	}

	public static String trimStart(String input) {
	    if (input == null) return null;
	    return input.replaceAll("^\\s+", "");
	}

   public static String clean(String input) {
	    if (input == null) return null;
	    return input.trim();
	}
   
   public static String removeAllSymbols(String input) {
	    if (input == null) return null;
	    return input.replaceAll("[^a-zA-Z0-9\\s]", "");
	}


}
