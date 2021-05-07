package com.therou.javahello;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RestController
class GreetingsController {
	@Autowired
	private Greetings greetings;

	@RequestMapping("/")
	String hello() {
		return greetings.hello();
	}
}

