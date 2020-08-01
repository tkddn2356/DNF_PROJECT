package com.sangwookim.service;

import lombok.extern.log4j.Log4j;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

@Service
@Log4j
public class DNFServiceImpl implements DNFService{
    private String apiKey = "ihvcsZUIedezYGPLYS0XZfevyza6aWbz";

    @Override
    public String getResult(String urlStr) {
        StringBuffer result = new StringBuffer();
        try{
            URL url = new URL(urlStr);
            HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
            urlconnection.setRequestMethod("GET");

            BufferedReader br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
            String returnLine;
            while((returnLine = br.readLine()) != null) {
                log.info(returnLine);
                result.append(returnLine);
            }
            urlconnection.disconnect();

        }catch(Exception e){
            e.printStackTrace();
        }
        return result.toString();
    }

    @Override
    public JSONObject getResult(String urlStr, String target) {
        try{
            URL url = new URL(urlStr);
            HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
            urlconnection.setRequestMethod("GET");
            BufferedReader br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
            JSONObject json = new JSONObject(br.readLine());
            urlconnection.disconnect();
            return json.getJSONObject(target);
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public String searchCharacter(String serverId, String characterName) throws UnsupportedEncodingException {
        String encodedCharacterName = URLEncoder.encode(characterName, "UTF-8");
        String urlStr = "https://api.neople.co.kr/df/servers/"+serverId+
                "/characters?characterName="+encodedCharacterName+
                "&apikey="+apiKey;
        return getResult(urlStr);
    }

    @Override
    public String getCharacterStatus(String serverId, String characterId) throws UnsupportedEncodingException {
        String urlStr = "https://api.neople.co.kr/df/servers/"+serverId+
                "/characters/"+characterId+
                "/status?apikey="+apiKey;
        return getResult(urlStr);
    }

    @Override
    public String getCharacterEquipment(String serverId, String characterId) throws UnsupportedEncodingException {
        String encodedCharacterId = URLEncoder.encode(characterId, "UTF-8");
        String urlStr = "https://api.neople.co.kr/df/servers/"+serverId+
                "/characters/"+encodedCharacterId+
                "/equip/equipment?apikey="+apiKey;
        return getResult(urlStr);
    }


}
