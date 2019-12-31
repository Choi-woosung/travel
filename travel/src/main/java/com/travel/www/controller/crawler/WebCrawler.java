package com.travel.www.controller.crawler;

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
		
		System.out.println(path);
		System.out.println(idx);
		System.out.println(driverPath);
		
		// 사이트 URL을 입력한다.
		System.setProperty("webdriver.chrome.driver", driverPath);
		driver = new ChromeDriver();
		driver.manage().window().maximize();
		driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
		driver.get(url);
	}
	
	public void crawlerStart(String query) {
		
		WebElement element1 = driver.findElement(By.id("hc_f_id_where_1"));
		
		element1.sendKeys(query);
		
		driver.findElement((By.cssSelector("ul#ui-id-5:first-child"))).click();
		
		new Select(driver.findElement(By.id("hc_f_id_checkin_1"))).selectByIndex(1);
		
		new Select(driver.findElement(By.cssSelector("div.hc_f_t_s3 hc_f_day label select[data-track-kayak=\"search-box/hc_searchBox/checkin-day-click\"]"))).selectByIndex(1);
		
		new Select(driver.findElement(By.id("hc_f_id_checkout_1"))).selectByIndex(1);
		
		new Select(driver.findElement(By.cssSelector("div.hc_f_t_s3 hc_f_day label select[data-track-kayak=\"search-box/hc_searchBox/checkout-day-click\"]"))).selectByIndex(1);
		
		driver.findElement(By.cssSelector("div.hc_f_t_btn hc_f_submit a.hc_f_btn_v15")).click();
		
		System.out.println(driver.findElement(By.cssSelector("body")).getText());
	}
	
	public void crawlerStop() {
		driver.quit();
	}
	
}
