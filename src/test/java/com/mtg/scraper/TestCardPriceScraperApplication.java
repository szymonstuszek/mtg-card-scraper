package com.mtg.scraper;

import org.springframework.boot.SpringApplication;

public class TestCardPriceScraperApplication {

	public static void main(String[] args) {
		SpringApplication.from(CardPriceScraperApplication::main).with(TestcontainersConfiguration.class).run(args);
	}

}
