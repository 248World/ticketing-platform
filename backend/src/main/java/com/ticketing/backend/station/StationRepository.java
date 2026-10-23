package com.ticketing.backend.station;

import java.util.List;

import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.stereotype.Repository;

@Repository
public class StationRepository {

    private final JdbcClient jdbc;

    public StationRepository(JdbcClient jdbc) {
        this.jdbc = jdbc;
    }

    public List<Station> findAll() {
        return jdbc.sql("SELECT code, name, city, time_zone FROM stations ORDER BY name")
                .query((rs, rowNum) -> new Station(
                        rs.getString("code"),
                        rs.getString("name"),
                        rs.getString("city"),
                        rs.getString("time_zone")))
                .list();
    }
}