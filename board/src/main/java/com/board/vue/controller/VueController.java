package com.board.vue.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.vue.service.VueService;

@Controller
@RequestMapping("/vue")
public class VueController {
	
	@Resource(name="vueService")
	private VueService vueService;
	
	@RequestMapping("/")
	public String main() {
		return "vue/main.tiles";
	}
	

}
