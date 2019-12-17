package stepDefinition;

import static org.junit.Assert.assertEquals;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

import helpers.DriverLoader;

public class Integration {
	private WebDriver driver;


	@Given("^User is on homepage \"([^\"]*)\"$")
	public void user_is_on_homepage(String arg1) throws Throwable {
		DriverLoader.loadDriver();
		driver = new FirefoxDriver();
		driver.manage().window().maximize();
		driver.get(arg1);
	}

	@Given("^Copy content \"([^\"]*)\" is present as heading level one at the top of the page$")
	public void copy_content_is_present_as_heading_level_one_at_the_top_of_the_page(String ExpectedResult) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		String ActualResult;
		ActualResult= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("h1.hero-block__header"))).getText();
		assertEquals(ExpectedResult, ActualResult);
	}

	@Given("^Copy content \"([^\"]*)\" is present as heading level two at the top of the page$")
	public void copy_content_is_present_as_heading_level_two_at_the_top_of_the_page(String ExpectedResult) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		String ActualResult;
		ActualResult= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("h2.hero-block__subheader"))).getText();
		assertEquals(ExpectedResult, ActualResult);
	}

	@Given("^Copy content \"([^\"]*)\" is present as heading level two in connectivity section$")
	public void copy_content_is_present_as_heading_level_two_in_connectivity_section(String ExpectedResult) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		String ActualResult;
		ActualResult= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("h2.section-header.two-row-block__header"))).getText();
		assertEquals(ExpectedResult, ActualResult);
	}

	@Given("^Copy content \"([^\"]*)\" is present as heading level three in connectivity section$")
	public void copy_content_is_present_as_heading_level_three_in_connectivity_section(String ExpectedResult) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		String ActualResult;
		ActualResult= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("p.two-row-block__content"))).getText();
		assertEquals(ExpectedResult, ActualResult);
	}

	@Given("^Copy content \"([^\"]*)\" is present as heading level two in about section$")
	public void copy_content_is_present_as_heading_level_two_in_about_section(String ExpectedResult) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		String ActualResult;
		ActualResult= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("div.about-block > div.container.small-container > h2.section-header"))).getText();
		assertEquals(ExpectedResult, ActualResult);
	}

	@Given("^Copy content \"([^\"]*)\" is present as heading level four in about section$")
	public void copy_content_is_present_as_heading_level_four_in_about_section(String ExpectedResult) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		String ActualResult;
		ActualResult= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("div.about-block > div.container.small-container > p"))).getText();
		assertEquals(ExpectedResult, ActualResult);
	}

	@Given("^Copy content \"([^\"]*)\" is present contact section$")
	public void copy_content_is_present_contact_section(String ExpectedResult) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		String ActualResult;
		ActualResult= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("p.call-banner__copy"))).getText();
		assertEquals(ExpectedResult, ActualResult);
	}

	@Given("^Copy content \"([^\"]*)\" is present as heading level two in connectivity providers section$")
	public void copy_content_is_present_as_heading_level_two_in_connectivity_providers_section(String ExpectedResult) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		String ActualResult;
		ActualResult= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("div.provider-block > div.container > h2.section-header"))).getText();
		assertEquals(ExpectedResult, ActualResult);
	}

	@When("^User enter postcode \"([^\"]*)\"$")
	public void user_enter_postcode(String PostCode) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("input.postcode-search__input")));
		elem.sendKeys(PostCode);
	}

	@When("^Click find business button$")
	public void click_find_business_button() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("span.postcode-search__button-text")));
		elem.click();
	}

	@Then("^Current URL should be \"([^\"]*)\"$")
	public void current_URL_should_be(String ExpectedURL) throws Throwable {
		//Thread.sleep(3000);
		String ActualURL = driver.getCurrentUrl();
		assertEquals(ExpectedURL, ActualURL );
	}

	@Then("^Copy content heading level one should be \"([^\"]*)\"$")
	public void copy_content_heading_level_one_should_be(String ExpectedResult) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		String ActualResult;
		ActualResult= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("h1.title"))).getText();
		assertEquals(ExpectedResult, ActualResult);
	}

	@Then("^Copy content heading level two should be \"([^\"]*)\"$")
	public void copy_content_heading_level_two_should_be(String ExpectedResult) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		String ActualResult;
		ActualResult= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("h2.subtitle"))).getText();
		assertEquals(ExpectedResult, ActualResult);
	}

	@When("^User enter address \"([^\"]*)\"$")
	public void user_enter_address(String Address) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("input.postcode-lookup__filter-input")));
		elem.sendKeys(Address);
	}

	@When("^Click on fredericks$")
	public void click_on_fredericks() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("div.postcode-lookup__address-item.postcode-lookup__address-item--address > span")));
		elem.click();
	}

	@When("^User enter business trade \"([^\"]*)\"$")
	public void user_enter_business_trade(String BusinessTrade) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("search-dropdown")));
		elem.sendKeys(BusinessTrade);
		//businessTrade.click();
	}

	@When("^Click business trade$")
	public void click_business_trade() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".dropdown-item")));
		elem.click();
	}

	@When("^Click next button$")
	public void click_next_button() throws Throwable {
		JavascriptExecutor js = (JavascriptExecutor) driver;
		js.executeScript("window.scrollBy(0,1000)");

		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("button.mic-button.next-btn.shadow")));
		elem.click();
	}


	@When("^User click Broadband and Landline$")
	public void user_click_Broadband_and_Landline() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("img.option-icon")));
		elem.click();
	}

	@When("^User click BT provider$")
	public void user_click_BT_provider() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("img[alt=\"BT Business logo\"]")));
		elem.click();
	}

	@When("^Unselect My landline provider is the same checkbox$")
	public void unselect_My_landline_provider_is_the_same_checkbox() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement uncheck;
		uncheck= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("label")));
		uncheck.click();
	}

	@When("^Click SKY provider$")
	public void click_SKY_provider() throws Throwable {

		JavascriptExecutor js = (JavascriptExecutor) driver;
		js.executeScript("window.scrollBy(0,1000)");

		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement sky;
		sky= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("div.phone-suppliers > div.option-wrap > div.supplier-option > img[alt=\"Sky logo\"]")));
		sky.click();
	}

	@When("^User click Emails$")
	public void user_click_Emails() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//label")));
		elem.click();
	}
	
	@When("^User click Wifi for my customers$")
	public void user_click_Wifi_for_my_customers() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[6]/label")));
		elem.click();	
	}

	@When("^User click Transferring files$")
	public void user_click_Transferring_files() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[5]/label")));
		elem.click();
	}

	@When("^User click Social media$")
	public void user_click_Social_media() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[3]/label")));
		elem.click();
	}

	@When("^User click Streaming$")
	public void user_click_Streaming() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[4]/label")));
		elem.click();
	}

	@When("^User click Using the web$")
	public void user_click_Using_the_web() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[@id='app']/div/div/div/div/div/div[2]/div[2]/label")));
		elem.click();
	}
	
	@When("^User click Document$")
	public void user_click_Document() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='Photos'])[1]/preceding::label[1]")));
		elem.click();
	}
	
	@When("^User click Photos$")
	public void user_click_Photos() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("label.check-label")));
		elem.click();
	}

	@When("^User click Video files$")
	public void user_click_Video_files() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("label.check-label")));
		elem.click();
	}

	@When("^User click Audio files$")
	public void user_click_Audio_files() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='Next'])[1]/preceding::label[2]")));
		elem.click();
	}

	@When("^User click Something else$")
	public void user_click_Something_else() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='Next'])[1]/preceding::label[1]")));
		elem.click();
	}

	@Then("^Copy content message should be \"([^\"]*)\"$")
	public void copy_content_message_should_be(String ExpectedResult) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		String ActualResult;
		ActualResult= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("h3.message-text > span"))).getText();
		assertEquals(ExpectedResult, ActualResult);
	}

	@When("^User click message next button$")
	public void user_click_message_next_button() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("button.mic-button.shadow.icon-only-mobile")));
		elem.click();
	}

	@When("^User click During the day$")
	public void user_click_During_the_day() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("label.check-label")));
		elem.click();
	}
	
	
	@When("^User click In the evenings$")
	public void user_click_In_the_evenings() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[2]/label")));
		elem.click();
	}

	@When("^User click At night$")
	public void user_click_At_night() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[3]/label")));
		elem.click();
	}

	@When("^User click 1 to 3$")
	public void user_click_1_to_3() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("label.radio-label")));
		elem.click();
	}
	
    @When("^User click 4 to 8$")
    public void user_click_4_to_8() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[2]/label")));
		elem.click();
    }
	
    @When("^User click 9 to 14$")
    public void user_click_9_to_14() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[3]/label")));
		elem.click();
    }
    

	
//	@When("^User click (\\d+) to (\\d+)$")
//	public void user_click_to(int arg1, int arg2) throws Throwable {
//		WebDriverWait wait = new WebDriverWait(driver, 20);
//		WebElement elem;
//		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("div.radio-option:nth-child(2) > label:nth-child(1)")));
//		elem.click();
//	}
	
	
	@When("^User click (\\d+)\\+$")
	public void user_click(int arg1) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[4]/label")));
		elem.click();
	}


	@When("^User click International calls$")
	public void user_click_International_calls() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[4]/label")));
		elem.click();
	}
	
	@When("^User click Calls to mobile$")
	public void user_click_Calls_to_mobile() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[3]/label")));
		elem.click();
	}
	
	@When("^User click Calls to landline$")
	public void user_click_Calls_to_landline() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[2]/label")));
		elem.click();
	}

	@When("^User click Call waiting$")
	public void user_click_Call_waiting() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[2]/label")));
		elem.click();
	}

	@When("^User click Caller display$")
	public void user_click_Caller_display() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[3]/label")));
		elem.click();
	}
	
	@When("^User click Conference calling$")
	public void user_click_Conference_calling() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[5]/label")));
		elem.click();
	}
	
	@When("^User click Call diversion$")
	public void user_click_Call_diversion() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//label")));
		elem.click();
	}
	
	@When("^User click Conference calls$")
	public void user_click_Conference_calls() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[5]/label")));
		elem.click();
	}

	@When("^User click Automatic ring back$")
	public void user_click_Automatic_ring_back() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[4]/label")));
		elem.click();
	} 

	@When("^User click Barring$")
	public void user_click_Barring() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[6]/label/span")));
		elem.click();
	}

	@When("^User click Yes$")
	public void user_click_Yes() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("label.radio-label")));
		elem.click();
	}
	
	@When("^User click No$")
	public void user_click_No() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[2]/label")));
		elem.click();
	}

	@When("^User click message all done button$")
	public void user_click_message_all_done_button() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("button.mic-button.shadow.icon-only-mobile")));
		elem.click();
	}

	@Then("^First copy content for broadband should be \"([^\"]*)\"$")
	public void first_copy_content_for_broadband_should_be(String ExpectedResult) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		String ActualResult;
		ActualResult= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("p.text"))).getText();
		assertEquals(ExpectedResult, ActualResult);
	}

	@Then("^Second copy content for broadband should be \"([^\"]*)\"$")
	public void second_copy_content_for_broadband_should_be(String ExpectedResult) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		String ActualResult;
		ActualResult= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("li"))).getText();
		assertEquals(ExpectedResult, ActualResult);
	}

	@Then("^Landline copy content should be \"([^\"]*)\"$")
	public void landline_copy_content_should_be(String ExpectedResult) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		String ActualResult;
		ActualResult= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//li[2]"))).getText();
		assertEquals(ExpectedResult, ActualResult);
	}

	@Then("^Copy content at the bottom should be \"([^\"]*)\"$")
	public void copy_content_at_the_bottom_should_be(String ExpectedResult) throws Throwable {

		JavascriptExecutor js = (JavascriptExecutor) driver;
		js.executeScript("window.scrollBy(0,1000)");

		WebDriverWait wait = new WebDriverWait(driver, 20);
		String ActualResult;
		ActualResult= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("b"))).getText();
		assertEquals(ExpectedResult, ActualResult);
	}

	@When("^User click Great, let's talk button$")
	public void user_click_Great_let_s_talk_button() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("button.mic-button.chat-button.shadow")));
		elem.click();
	}

	@When("^User click call me now button$")
	public void user_click_call_me_now_button() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("button.mic-button.call-btn.call-now-btn")));
		elem.click();
	}
	
	@When("^User click Schedule for later button$")
	public void user_click_Schedule_for_later_button() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("button.mic-button.call-btn.schedule-btn.outline")));
		elem.click();
	}

	@When("^User click continue button$")
	public void user_click_continue_button() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//button")));
		elem.click();
	}
	
	@When("^User enter Business name \"([^\"]*)\"$")
	public void user_enter_Business_name(String BusinessName) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("input[name=\"Business name\"]")));
		elem.sendKeys(BusinessName);
	}


	@When("^User enter Your name \"([^\"]*)\"$")
	public void user_enter_Your_name(String YourName) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("input[name=\"Name\"]")));
		elem.sendKeys(YourName);
	}

	@When("^User enter Your phone number \"([^\"]*)\"$")
	public void user_enter_Your_phone_number(String YourPhoneNumber) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("input[name=\"Phone\"]")));
		elem.sendKeys(YourPhoneNumber);
	}

	@When("^User enter Your email address \"([^\"]*)\"$")
	public void user_enter_Your_email_address(String YourEmailAddress) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("input[name=\"Email\"]")));
		elem.sendKeys(YourEmailAddress);
	}

	@When("^Click Call me button$")
	public void click_Call_me_button() throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("button.mic-button.submit-btn.compact")));
		elem.click();
	}

	@Then("^Copy content should be \"([^\"]*)\"$")
	public void copy_content_should_be(String ExpectedResult) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		String ActualResult;
		ActualResult= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("p.intro.text-left"))).getText();
		assertEquals(ExpectedResult, ActualResult);
	}

    @Then("^Post Code validation error message \"([^\"]*)\" is displayed$")
    public void post_code_validation_error_message_something_is_displayed(String Expected) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		String Actual;
		Actual= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("p.postcode-search__error-text"))).getText();
		assertEquals(Expected, Actual);
    }
    
    @Then("^Street Address 1 validation error \"([^\"]*)\" is displayed$")
    public void street_address_1_validation_error_something_is_displayed(String Expected) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		String Actual;
		Actual= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("span.mic-input__error"))).getText();
		assertEquals(Expected, Actual);
    
    }

    @And("^Click My address is not listed, Enter it manually$")
    public void click_my_address_is_not_listed_enter_it_manually() throws Throwable {
    	Thread.sleep(3000);
    	
		JavascriptExecutor js = (JavascriptExecutor) driver;
		js.executeScript("window.scrollBy(0,2000)");
    	
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("div.postcode-lookup__address-item.postcode-lookup__address-item--manual")));
		elem.click();
    }

    @And("^user enter Street Address 1 \"([^\"]*)\"$")
    public void user_enter_street_address_1_something(String streetaddress1) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("input[name=\"Street address\"]")));
		elem.sendKeys(streetaddress1);
    }

    @And("^user enter Street Address 2 \"([^\"]*)\"$")
    public void user_enter_street_address_2_something(String streetaddress2) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("input[name=\"streetAddress2\"]")));
		elem.sendKeys(streetaddress2);
    }

    @And("^user enter Town \"([^\"]*)\"$")
    public void user_enter_town_something(String town) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("input[name=\"Town\"]")));
		elem.sendKeys(town);
    
    }

    @And("^user enter County \"([^\"]*)\"$")
    public void user_enter_county_something(String county) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("input[name=\"county\"]")));
		elem.sendKeys(county);
    
    }

    @And("^user enter Post Code \"([^\"]*)\"$")
    public void user_enter_post_code_something(String postcode) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		WebElement elem;
		elem= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("input[name=\"Postcode\"]")));
		elem.sendKeys(postcode);
		
		JavascriptExecutor js = (JavascriptExecutor) driver;
		js.executeScript("window.scrollBy(0,1000)");
		
		WebElement elem1;
		elem1= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("div.next-btn-wrap.text-right")));
		elem1.click();
    
    }

    @And("^Street Address 2 validation error \"([^\"]*)\" is displayed$")
    public void street_address_2_validation_error_something_is_displayed(String Expected) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		String Actual;
		Actual= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("label.address-form__field.address-form__field--optional-street.mic-input > span.mic-input__error"))).getText();
		assertEquals(Expected, Actual);
    }

    @And("^Town validation error \"([^\"]*)\" is displayed$")
    public void town_validation_error_something_is_displayed(String Expected) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		String Actual;
		Actual= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("label.address-form__field.address-form__field--town.mic-input > span.mic-input__error"))).getText();
		assertEquals(Expected, Actual);
    
    }

    @And("^County validation error \"([^\"]*)\" is displayed$")
    public void county_validation_error_something_is_displayed(String Expected) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		String Actual;
		Actual= wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("label.address-form__field.address-form__field--county.mic-input > span.mic-input__error"))).getText();
		assertEquals(Expected, Actual);
    
    }

    @And("^Post Code validation error \"([^\"]*)\" is displayed$")
    public void post_code_validation_error_something_is_displayed(String Expected) throws Throwable {
		WebDriverWait wait = new WebDriverWait(driver, 20);
		String Actual;
		Actual= wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='Post code'])[1]/following::span[2]"))).getText();
		assertEquals(Expected, Actual);
    
    }

	
	@Then("^User exit page$")
	public void user_exit_page() throws Throwable {
		driver.close();
	}


}
