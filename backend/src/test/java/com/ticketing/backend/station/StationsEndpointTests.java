package com.ticketing.backend.station;

import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.context.annotation.Import;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import com.ticketing.backend.TestcontainersConfiguration;

@SpringBootTest
@AutoConfigureMockMvc
@Import(TestcontainersConfiguration.class)
@Transactional
class StationsEndpointTests {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private JdbcClient jdbc;

    private void insertStation(String code) {
        jdbc.sql("INSERT INTO stations (code, name, city) VALUES (:code, :name, :city)")
                .param("code", code)
                .param("name", "Simulated Central")
                .param("city", "Monrovia")
                .update();
    }

    @Test
    void returnsEmptyListWhenNoStationsExist() throws Exception {
        mockMvc.perform(get("/api/v1/stations"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$").isArray())
                .andExpect(jsonPath("$.length()").value(0));
    }

    @Test
    void returnsStoredStationWithDefaultTimeZone() throws Exception {
        insertStation("SIM1");

        mockMvc.perform(get("/api/v1/stations"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.length()").value(1))
                .andExpect(jsonPath("$[0].code").value("SIM1"))
                .andExpect(jsonPath("$[0].timeZone").value("Africa/Monrovia"));
    }

    @Test
    void databaseRejectsDuplicateStationCode() {
        insertStation("SIM1");

        assertThrows(DataIntegrityViolationException.class, () -> insertStation("SIM1"));
    }
}