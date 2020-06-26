package com.archetypetraining.demo;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.ActiveProfiles;

import java.util.Objects;

import static java.lang.String.format;
import static org.junit.jupiter.api.Assertions.assertTrue;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@AutoConfigureMockMvc
@ActiveProfiles("test")
class DemoApplicationTests {
	private static final String HTTP_URL = "http://localhost:%d%s";
	@LocalServerPort
	private int port;
	final private TestRestTemplate restTemplate = new TestRestTemplate();

	@Test
	void testHelloController() {
		final ResponseEntity<String> exchange =
				restTemplate.exchange(
						format(HTTP_URL, port, "/hello"),
						HttpMethod.GET,
						new HttpEntity<>(new HttpHeaders()),
						String.class);
		assertTrue(Objects.requireNonNull(exchange.getBody()).contains("hello"));
		System.out.println("test success !");
	}

}
