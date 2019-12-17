package managers;
import org.openqa.selenium.WebDriver;

import pageObjectsModel.*;


public class PageObjectManager {

	private WebDriver driver;
	private PageObjects pageObjects;
	private Home home;
	private SelectAddress selectAddress;
	private BusinessName businessName;
	private SwitchType switchType;
	private ElectricityIndustryData electricityIndustryData;
	private ElectricityIndustryDataAgreement electricityIndustryDataAgreement;
	private ElectricityChat electricityChat;


	public PageObjectManager(WebDriver driver) {
		this.driver = driver;
	}

	public PageObjects getPageObjects(){
		return (pageObjects == null) ? pageObjects = new PageObjects(driver) : pageObjects;
	}

	public Home getHome(){
		return (home == null) ? home = new Home(driver) : home;
	}

	public SelectAddress getSelectAddress(){
		return (selectAddress == null) ? selectAddress = new SelectAddress(driver) : selectAddress;
	}

	public BusinessName getBusinessName(){
		return (businessName == null) ? businessName = new BusinessName(driver) : businessName;
	}

	public SwitchType getSwitchType(){
		return (switchType == null) ? switchType = new SwitchType(driver) : switchType;
	}

	public ElectricityIndustryData getElectricityIndustryData(){
		return (electricityIndustryData == null) ? electricityIndustryData = new ElectricityIndustryData(driver) : electricityIndustryData;
	}

	public ElectricityIndustryDataAgreement getElectricityIndustryDataAgreement(){
		return (electricityIndustryDataAgreement == null) ? electricityIndustryDataAgreement = new ElectricityIndustryDataAgreement(driver) : electricityIndustryDataAgreement;
	}
	public ElectricityChat getElectricityChat(){
		return (electricityChat == null) ? electricityChat = new ElectricityChat(driver) : electricityChat;
	}

}