package com.sangwookim.service;



import org.json.JSONObject;

import java.io.UnsupportedEncodingException;


public interface DNFService {
    public String getResult(String urlStr);
    public String searchCharacter(String serverId, String characterName) throws UnsupportedEncodingException;
    public String getCharacterStatus(String serverId, String characterId) throws UnsupportedEncodingException;
    public String getCharacterEquipment(String serverId, String characterId) throws UnsupportedEncodingException;


}
