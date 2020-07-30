package com.sangwookim.service;

import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

@Service
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
                result.append(returnLine);
            }
            urlconnection.disconnect();

        }catch(Exception e){
            e.printStackTrace();
        }
        return result.toString();
    }

    @Override
    public String searchCharacter(String serverId, String characterName) throws UnsupportedEncodingException {
        String encodedCharacterName = URLEncoder.encode(characterName, "UTF-8");
        String urlStr = "https://api.neople.co.kr/df/servers/"+serverId+
                "/characters?characterName="+encodedCharacterName+
                "&apikey="+apiKey;
        return getResult(urlStr);
    }


}
