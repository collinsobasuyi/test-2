package pageObjectsModel;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;
import org.openqa.selenium.support.PageFactory;

public class BusinessName {
	
	public BusinessName(WebDriver driver) {
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(how = How.ID, using = "business_name") 
	private WebElement BusinessNameField;
	
	
	@FindBy(how = How.CSS, using = "button.hover-ripple.confirm-business-name__button")
	private WebElement BusinessNextButton;
	
	public void ClearBusinessTextField() {
		BusinessNameField.clear();
	}
	
	public void ClickBusinesTextField() {
		BusinessNameField.click();
	}
	
	public void InputBusinessName(String BusinessName) {
		BusinessNameField.sendKeys(BusinessName);
	}
	
	public void ClickNextBusinessButton() {
		BusinessNextButton.click();
	}

}
