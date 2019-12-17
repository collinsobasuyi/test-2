package helpers;

public class OSDetector {
  private static String name = System.getProperty("os.name").toLowerCase();
  
  public static String normalName() {
	  if (isWindows()) return "windows";
	  if (isMac()) return "mac";
	  
	return null;
  }

  public static boolean isWindows() {
    return name.contains("win");
  }

  public static boolean isMac() {
    return name.contains("mac");
  }
}
