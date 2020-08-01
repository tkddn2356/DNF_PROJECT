package com.sangwookim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DNFViewController {

    @RequestMapping(value = "/Info", method = RequestMethod.GET)
    public String list(@RequestParam("server") String server, @RequestParam("characterName")String characterName, Model model) {
        model.addAttribute("server", server);
        model.addAttribute("characterName", characterName);
        return "/Info";
    }
}
