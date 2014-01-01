package com.jianxin.yingxt.web.modules.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("yingxtController")
@RequestMapping(value = "/test")
public class YingxtController {
	@RequestMapping(value = "query", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody JavaBean byProduces() {
		return new JavaBean();
	}

	@RequestMapping(value = "query1", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String byProduces1() {
		return "a({\"foo\":\"bar\",\"fruit\":\"apple\"})";
	}
}