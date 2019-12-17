package pageObjectsModel;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.Select;

public class ElectricityChat {
	
	public ElectricityChat(WebDriver driver) {
		PageFactory.initElements(driver, this);
	}
	
	
	@FindBy(how = How.CSS, using = "label.chat__radio-label")
	private WebElement InContractRadioButton;
	
	@FindBy(how = How.XPATH, using = "(.//*[normalize-space(text()) and normalize-space(.)='In Contract'])[1]/following::label[1]")
	private WebElement OutOfContractRadioButton;
	
	@FindBy(how = How.XPATH, using = "(.//*[normalize-space(text()) and normalize-space(.)='?'])[2]/preceding::label[1]")
	private WebElement NotSureRadioButton;
	
	@FindBy(how = How.ID, using = "expiration-date")
	private WebElement ContractEndDateField;
	
	@FindBy(how = How.CSS, using = "button.chat__date-btn.hover-ripple.btn")
	private WebElement ConfirmDateButton;
	
	@FindBy(how = How.ID, using = "call-later")
	private WebElement ScheduleCall;
	
	@FindBy(how = How.ID, using = "date")
	private WebElement ScheduleCallDateDropDown;
	
	@FindBy(how = How.XPATH, using = "(.//*[normalize-space(text()) and normalize-space(.)='Time'])[1]/preceding::select[1]")
	private WebElement SelectCallBackDate; 
	
	@FindBy(how = How.XPATH, using = "(.//*[normalize-space(text()) and normalize-space(.)='Time'])[1]/following::select[1]")
	private WebElement SelectCallBackTime;
	
	@FindBy(how = How.ID, using = "time")
	private WebElement ScheduleCallTimeDropDown;

	@FindBy(how = How.CSS, using = "#schedule-callback-form > div.callback-modal__form-box > #name")
	private WebElement ScheduleCallFullNameTextField;
	
	@FindBy(how = How.CSS, using = "#schedule-callback-form > div.callback-modal__form-box > #email")
	private WebElement ScheduleCallEmailTextField;
	
	@FindBy(how = How.CSS, using = "#schedule-callback-form > div.callback-modal__form-box > #telephone_number")
	private WebElement ScheduleCallPhoneNumberField;
	
	@FindBy(how = How.CSS, using = "#schedule-callback-form > div.callback-modal__footer > div.row > div.col-lg-5.col-md-12 > button.callback-modal__button.hover-ripple.btn")
	private WebElement ScheduleCallSubmitButton;
	
	@FindBy(how = How.ID, using = "call-now")
	private WebElement CallMeNowButton;
	
	@FindBy(how = How.ID, using = "name")
	private WebElement CallNowFullNameTextField;
	
	@FindBy(how = How.ID, using = "email")
	private WebElement CallNowEmailTextField;
	
	@FindBy(how = How.ID, using = "telephone_number")
	private WebElement CallNowPhoneNumberField;
	
	@FindBy(how = How.ID, using = "button.callback-modal__button.hover-ripple.btn")
	private WebElement CallMeNowSubmitButon;
	
	
	public void ClickInContract() {
		InContractRadioButton.click();
	}
	
	public void ClickOutOfContract() {
		OutOfContractRadioButton.click();
	}
	
	public void ClickNotSure() {
		NotSureRadioButton.click();
	}
	
	public void ClickContractExpirationDateField() {
		ContractEndDateField.click();
	}
	
	public void SelectContractEndDate(String Date) {
		ContractEndDateField.sendKeys(String.valueOf(Date));
	}
	
	public void ClickConfirmDateButton() {
		ConfirmDateButton.click();
	}
	
	public void ClickScheduleCallButton() {
		ScheduleCall.click();
	}
	
	public void ClickScheduleDateDropDown() {
		ScheduleCallDateDropDown.click();
	}
	
	public void SelectCallBackDate(String Date) {
		((Select) SelectCallBackDate).selectByVisibleText(Date);
	}
	
	public void SelectCallBackTime(String Time) {
		((Select) SelectCallBackTime).selectByVisibleText(Time);
	}
	
	public void ClickScheduleCallFullNameTextField() {
		ScheduleCallFullNameTextField.click();
	}
	
	public void ClearScheduleFullNameTextField() {
		ScheduleCallFullNameTextField.clear();
	}
	
	public void ScheduleCallInputFullName(String FullName) {
		ScheduleCallFullNameTextField.sendKeys(FullName);
	}
	
	public void ClickScheduleCallEmailTextField() {
		ScheduleCallEmailTextField.click();
	}
	
	public void ClearScheduleCallEmailTextField() {
		ScheduleCallEmailTextField.clear();
	}
	
	public void ScheduleCallInputEmailTextField(String Email) {
		ScheduleCallEmailTextField.sendKeys(Email);
	}
	
	public void ClickScheduleCallPhoneTextField() {
		ScheduleCallPhoneNumberField.click();
	}
	
	public void ClearScheduleCallPhoneTextField() {
		ScheduleCallEmailTextField.clear();
	}
	
	public void ScheduleCallInputPhoneNumber(String PhoneNumber) {
		ScheduleCallEmailTextField.sendKeys(PhoneNumber);
	}
	
	public void ClickCallMeNowButton() {
		CallMeNowButton.click();
	}
	
	public void ClickFullNameTextField() {
		CallNowFullNameTextField.click();
	}
	
	public void ClearFullNameTextField() {
		CallNowFullNameTextField.clear();
	}
	
	public void InputFullNameTextField(String FullName) {
		CallNowFullNameTextField.sendKeys(FullName);
	}
	
	public void ClickEmailTextField() {
		CallNowEmailTextField.click();
	}
	
	public void ClearEmailTextField() {
		CallNowEmailTextField.clear();
	}
	
	public void InputEmailTextField(String Email) {
		CallNowEmailTextField.sendKeys(Email);
	}
	public void ClickPhoneNumberField() {
		CallNowPhoneNumberField.click();
	}
	
	public void ClearPhoneTextField() {
		CallNowPhoneNumberField.clear();
	}
	
	public void InputPhoneNumberTextField(String PhoneNumber) {
		CallNowPhoneNumberField.sendKeys(PhoneNumber);
	}
	public void SubmitCallMeNowRequest() {
		CallMeNowSubmitButon.click();
	}
}
