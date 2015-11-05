package com.example.package;

import org.json.*;
import java.io.Serializable;


public class Spa_ce implements Serializable
{
    private static final String FIELD__1ONE = "1one";

    private String _1one;

    public Spa_ce() {

    }

    public Spa_ce(JSONObject jsonObject) {
        parseObject(jsonObject);
    }

    public Spa_ce(String jsonString) {
        try {
            parseString(jsonString);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    protected void parseString(String jsonString) throws JSONException {
        JSONObject jsonObject = new JSONObject(jsonString);
        parseObject(jsonObject);
    }

    protected void parseObject(JSONObject object)
    {
        this._1one = object.optString(FIELD__1ONE);

    }

    public void set_1one(String value) {
        this._1one = value;
    }

    public String get_1one() {
        return this._1one;
    }

}
