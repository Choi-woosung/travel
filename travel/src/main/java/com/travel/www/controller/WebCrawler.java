package com.travel.www.controller;

import java.util.concurrent.*;
import org.openqa.selenium.*;
import org.openqa.selenium.chrome.*;
import org.openqa.selenium.support.ui.*;

public class WebCrawler {

	private WebDriver driver;
	
	public void setUrl(String url) {
		
		// 크롬 드라이버 경로를 얻는다.
		String path = this.getClass().getResource("").getPath();
		int idx = path.indexOf("/com");
		String driverPath = path.substring(0, idx) + "/chromedriver/chromedriver.exe";	
		
		// 사이트 URL을 입력한다.
		System.setProperty("webdriver.chrome.driver", driverPath);
		driver = new ChromeDriver();
		driver.manage().window().maximize();
		driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
		driver.get(url);
	}
	
	public void crawlerStart(String query) throws InterruptedException {
		
		WebElement element1 = driver.findElement(By.name("q"));
		
		Thread.sleep(1000);
			
		element1.sendKeys(query);
		
		Thread.sleep(1000);
		
		element1.submit();
		
		WebElement element2 = driver.findElement(By.cssSelector("body"));
		
		System.out.println(element2.getText());
		
		Thread.sleep(1000);
		
		crawlerStop();
	}
	
	public void crawlerStop() {
		driver.quit();
	}
	
}
