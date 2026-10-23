package com.ticketing.backend.station;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/stations")
public class StationController {

    private final StationRepository stations;

    public StationController(StationRepository stations) {
        this.stations = stations;
    }

    @GetMapping
    public List<Station> list() {
        return stations.findAll();
    }
}