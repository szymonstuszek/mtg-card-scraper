package com.mtg.scraper.service;

import com.mtg.scraper.repository.CarRepository;
import jakarta.annotation.PostConstruct;
import org.springframework.stereotype.Service;

@Service
public class CardService {

    private final CarRepository carRepository;

    public CardService(CarRepository carRepository) {
        this.carRepository = carRepository;
    }

    @PostConstruct
    public void init(){
        System.out.println(this.carRepository.findAll());
    }
}
