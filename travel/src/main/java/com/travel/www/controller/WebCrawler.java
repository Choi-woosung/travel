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
	
	public void crawlerStart(String query) {
		
		System.out.println("실행");
	}
	
	public void crawlerStop() {
		driver.quit();
	}
	
}
