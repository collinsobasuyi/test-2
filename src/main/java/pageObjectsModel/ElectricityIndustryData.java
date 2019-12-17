package pageObjectsModel;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;
import org.openqa.selenium.support.PageFactory;

public class ElectricityIndustryData {
	
	public ElectricityIndustryData(WebDriver driver) {
		PageFactory.initElements(driver, this);
	}
	@FindBy(how = How.CSS, using = "button[name=\"button\"]")
	private WebElement IndustryNextButton;
	
	public void ClickIndustryDatNextButton() {
		IndustryNextButton.click();
	}

}
