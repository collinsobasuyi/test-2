package pageObjectsModel;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;
import org.openqa.selenium.support.PageFactory;

public class ElectricityIndustryDataAgreement {
	
	public ElectricityIndustryDataAgreement(WebDriver driver) {
		PageFactory.initElements(driver, this);
	}
	@FindBy(how = How.CSS, using = "#get-industry-data-form > input[name=\"commit\"]")
	private WebElement YesIndustryButton;
	
	// give consent for industry searches
	public void GiveConsent() {
		YesIndustryButton.click();
	}

}
