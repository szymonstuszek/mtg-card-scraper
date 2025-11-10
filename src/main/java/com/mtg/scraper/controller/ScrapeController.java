package com.mtg.scraper.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestClient;

import java.util.Optional;

@RestController
public class ScrapeController {

    private final RestClient restClient = RestClient.create();

    @GetMapping(path = "/cards")
    public ResponseEntity<String> getPrices() {
//        String body = restClient.get()
//                .uri("https://api.scryfall.com/cards/search?q=set:tdm")  // replace with your API URL
//                .retrieve()
//                .body(String.class);

        return ResponseEntity.of(Optional.of("hi"));
    }
}
