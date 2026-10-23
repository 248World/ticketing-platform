package com.ticketing.backend.config;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.header;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.context.annotation.Import;
import org.springframework.test.web.servlet.MockMvc;

import com.ticketing.backend.TestcontainersConfiguration;

@SpringBootTest
@AutoConfigureMockMvc
@Import(TestcontainersConfiguration.class)
class CorsTests {

    @Autowired
    private MockMvc mockMvc;

    @Test
    void allowsTheConfiguredFrontendOrigin() throws Exception {
        mockMvc.perform(get("/api/v1/stations").header("Origin", "http://localhost:5000"))
                .andExpect(status().isOk())
                .andExpect(header().string("Access-Control-Allow-Origin", "http://localhost:5000"));
    }

    @Test
    void rejectsAnUnknownOrigin() throws Exception {
        mockMvc.perform(get("/api/v1/stations").header("Origin", "http://evil.example"))
                .andExpect(status().isForbidden());
    }
}