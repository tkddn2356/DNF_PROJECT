package com.sangwookim.service;



import java.io.UnsupportedEncodingException;


public interface DNFService {
    public String searchCharacter(String serverId, String characterName) throws UnsupportedEncodingException;
    public String getResult(String urlStr);

}
