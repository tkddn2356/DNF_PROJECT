package com.sangwookim.controller;

import com.sangwookim.service.DNFService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;

@Controller
public class DNFController {

    @Autowired
    private DNFService service;

    @ResponseBody
    @RequestMapping(value="/searchCharacter/{serverId}/{characterName}", method= RequestMethod.GET,
            produces = "application/text; charset=utf8")
    public ResponseEntity<String> searchCharacter(@PathVariable("serverId")String serverId,
                                                  @PathVariable("characterName")String characterName) throws UnsupportedEncodingException {
        return new ResponseEntity<>(service.searchCharacter(serverId, characterName), HttpStatus.OK);
    }
}
