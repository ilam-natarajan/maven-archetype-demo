package com.archetypetraining.demo.app;

import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("hello")
public class HelloController {
    Logger logger = LoggerFactory.getLogger(HelloController.class);

    @GetMapping(produces = MediaType.TEXT_PLAIN_VALUE)
    public @ResponseBody
    String hello() {
        logger.debug("entered hello.");
        return "hello !! let's learn how to build an archetype and maintain it the correct way !!";
    }
}
