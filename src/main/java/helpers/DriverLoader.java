package helpers;

import java.util.Map;

public class DriverLoader {
	private static Map<String, String> driverMap = Map.of("windows", "geckodriver.exe", "mac", "geckodriver");

	private static String driverName() {
		return driverMap.get(OSDetector.normalName());
	}

	public static void loadDriver() {
		String driver = driverName();
		System.setProperty("webdriver.gecko.driver", String.format("browserDrivers/%s", driver));
	}
}
