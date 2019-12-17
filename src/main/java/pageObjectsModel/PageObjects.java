package pageObjectsModel;




import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;
import org.openqa.selenium.support.PageFactory;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class PageObjects {

	public PageObjects(WebDriver driver) {
		PageFactory.initElements(driver, this);
	}
	@FindBy(how = How.ID, using = "adroll_allow") 
	private WebElement cookies;
	
	@FindBy(how = How.CSS, using = "#ui-id-2 > span.title.desktop-only") 
	private WebElement insuranceMenuTab;

	@FindBy(how = How.CSS, using = "#tabs-1 > div.row.duckeggblue > div.col-12.col-lg-7.col-xl-6 > div.white-bg > div.white-bg-inner > div.square-button.aqua > a > span.link-text") 
	private WebElement getQuoteButton;

	@FindBy(how = How.ID, using = "lead_name") 
	private WebElement leadName;

	@FindBy(how = How.ID, using = "lead_business_name") 
	private WebElement businessName;

	@FindBy(how = How.ID, using = "lead_email") 
	private WebElement leadEmail;

	@FindBy(how = How.ID, using = "lead_telephone_number") 
	private WebElement telephoneNumber;
	
	@FindBy(how = How.ID, using = "lead_submit_to_lock") 
	private WebElement nextButton;
	
	@FindBy(how = How.CSS, using = "h1") 
	private WebElement pageHeaderText;

	public void ClickCookies() {
		cookies.click();
	}

	public void ClickInsuranceMenuTab() {
		insuranceMenuTab.click();
	}

	public void ClickGetaQuoteButton() {
		getQuoteButton.click();
	}

	public void EnterFullName(String FullName) {
		leadName.sendKeys(FullName);
	}

	public void EnterCompanyName(String CompanyName) {
		businessName.sendKeys(CompanyName);
	}


	public void EnterEmailAddresse(String EmailAddress) {
		leadEmail.sendKeys(EmailAddress);
	}

	public void EnterTelephoneNumber(String TelephoneNumber) {
		telephoneNumber.sendKeys(TelephoneNumber);
	}
	
	public void ClickNextButton() {
		nextButton.click();
	}
	
	public void ActualHeaderText() {
		pageHeaderText.getText();
	}

}