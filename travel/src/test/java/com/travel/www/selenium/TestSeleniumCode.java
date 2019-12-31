package com.travel.www.selenium;

import java.util.concurrent.TimeUnit;

import org.junit.*;
import org.openqa.selenium.*;
import org.openqa.selenium.chrome.*;

public class TestSeleniumCode {

	private WebDriver driver;
	private String url;
	
	@Before
	public void before() {
		
		String path = this.getClass().getResource("").getPath();
		int idx = path.indexOf("/com");
		String driverPath = path.substring(0, idx) + "/chromedriver/chromedriver.exe";
		
		url = "https://www.google.com/";
		
		System.setProperty("webdriver.chrome.driver", driverPath);
		driver = new ChromeDriver();
		driver.manage().window().maximize();
		driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
		driver.get(url);
	}
	
	@Test
	public void testa() {
		
		WebElement element1 = driver.findElement(By.name("q"));
		
		element1.sendKeys("Selenium Test");

		element1.submit();
		
		System.out.println(driver.findElement(By.id("gsr")).getText());
	}

}
