package pageObjectsModel;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;
import org.openqa.selenium.support.PageFactory;

import gherkin.lexer.Pa;

public class SelectAddress {

	public SelectAddress(WebDriver driver) {
		PageFactory.initElements(driver, this);
	}

	@FindBy(how = How.CSS, using = "input.addresses__search-input-field") 
	private WebElement SearchAddressTextField;
	
	@FindBy(how = How.XPATH, using = "//li[67]/form/input[5]") 
	private WebElement Fredericks;
	
	@FindBy(how = How.XPATH, using = "//li[29]/form/input[5]") 
	private WebElement Sainsburys;

	@FindBy(how = How.XPATH, using = "//li[5]/form/input[5]") 
	private WebElement Flat;
	
	@FindBy(how = How.XPATH, using = "//input[5]") 
	private WebElement Glasgow;
	
	@FindBy(how = How.XPATH, using = "//li[7]/form/input[5]") 
	private WebElement PapaJohns;
	
	@FindBy(how = How.XPATH, using = "//input[5]") 
	private WebElement Axminster;
	
	public void ClearAddressTextField() {
		SearchAddressTextField.clear();
	}
	
	public void ClickAddressTextField() {
		SearchAddressTextField.click();
	}
	
	public void InputAddressTextField(String Address) {
		SearchAddressTextField.sendKeys(Address);
	}
	
	public void SelectFredericksAddressFromList() {
		Fredericks.click();
	}
	
	public void SelectSainsburysAddressFromList() {
		Sainsburys.click();
	}
	
	public void SelectFlat5AddressFromList() {
		Flat.click();
	}
	
	public void SelectGlasgowFromAddressList() {
		Glasgow.click();
	}
	
	public void SelectPapaJohnsAddressFromList() {
		PapaJohns.click();
	}
	
	public void SelectAxminsterAddressFromListn() {
		Axminster.click();
	}
	
	
	
	
	
	

	
	

}