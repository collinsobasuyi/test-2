package testRunner;

import java.io.File;

import org.junit.AfterClass;
import org.junit.runner.RunWith;

import com.cucumber.listener.Reporter;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

@RunWith(Cucumber.class)
@CucumberOptions(
		features = "src/test/resources/functionalTestCases/Integration.feature",
		plugin = { "com.cucumber.listener.ExtentCucumberFormatter:target/testReports/cucumber-reports/report.html"}, 
		monochrome = true,
		glue= {"stepDefinition"}
		//,tags= {"@Scenario_2"}
		,tags= {"@Scenario_1, @Scenario_2,  @Scenario_3, @Scenario_4,  @Scenario_5, @Scenario_6,  @Scenario_7, @Scenario_8,  @Scenario_9, @Scenario_10,  @Scenario_11, @Scenario_12"}
		//,tags= {"@PostcodeValidation, @ManualAddressValidation, @Scenario_1, @Scenario_2,  @Scenario_3, @Scenario_4,  @Scenario_5, @Scenario_6,  @Scenario_7, @Scenario_8,  @Scenario_9, @Scenario_10,  @Scenario_11, @Scenario_12"}
		)

public class Runner {
	@AfterClass
	public static void writeExtentReport() {
		Reporter.loadXMLConfig(new File("reportConfig/report.xml"));

	}

}
