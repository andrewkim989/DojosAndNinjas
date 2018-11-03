package com.andrewkim.dojoninja.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.andrewkim.dojoninja.models.Dojo;
import com.andrewkim.dojoninja.models.Ninja;
import com.andrewkim.dojoninja.services.DojoNinjaService;

@Controller
public class DojoNinjaController {
	private final DojoNinjaService dojoNinjaService;
	
	public DojoNinjaController(DojoNinjaService dojoNinjaService) {
        this.dojoNinjaService = dojoNinjaService;
    }
	
	@RequestMapping("/")
	public String home() {
		return "home.jsp";
	}
	
	@RequestMapping("/dojos/new")
	public String createDojo(Model model, @ModelAttribute("dojo") Dojo dojo) {
		model.addAttribute("dojo", dojo);
		return "newdojo.jsp";
	}
	
	@RequestMapping("/dojos/new/process")
	public String createDojoProcess(@Valid @ModelAttribute("dojo") Dojo dojo, BindingResult result) {
		if (result.hasErrors()) {
			return "newdojo.jsp";
		}
		else {
			dojoNinjaService.createDojo(dojo);
			return "redirect:/ninjas/new";
		}
	}
	
	@RequestMapping("/ninjas/new")
	public String createNinja(Model model, @ModelAttribute("ninja") Ninja ninja) {
		List<Dojo> dojos = dojoNinjaService.allDojos();
		model.addAttribute("dojos", dojos);
		return "newninja.jsp";
	}
	
	@RequestMapping(value = "/ninjas/new/process", method = RequestMethod.POST)
	public String createNinjaProcess(@Valid @ModelAttribute("ninja") Ninja ninja,
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "newninja.jsp";
		}
		else {
			dojoNinjaService.createNinja(ninja);
			long id = ninja.getDojo().getId();
			return "redirect:/dojos/" + id;
		}
	}
	
	@RequestMapping("/dojos/{id}")
	public String show (@PathVariable("id") Long id, Model model) {
		Dojo dojo = dojoNinjaService.findDojo(id);
		model.addAttribute("dojo", dojo);
		return "dojoninja.jsp";
	}
}
