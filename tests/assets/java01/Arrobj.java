package com.example.package;

import org.json.*;
import java.io.Serializable;


public class Arrobj implements Serializable
{
    private static final String FIELD_STR = "str";
    private static final String FIELD_NUM = "num";
    private static final String FIELD_FLO = "flo";
    private static final String FIELD_BOO = "boo";
    private static final String FIELD__NULL = "null";

    private String str;
    private Long num;
    private Double flo;
    private Boolean boo;
    private Object _null;

    public Arrobj() {

    }

    public Arrobj(JSONObject jsonObject) {
        parseObject(jsonObject);
    }

    public Arrobj(String jsonString) {
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
        this.str = object.optString(FIELD_STR);
        this.num = object.optLong(FIELD_NUM);
        this.flo = object.optDouble(FIELD_FLO);
        this.boo = object.optBoolean(FIELD_BOO);
        this._null = object.opt(FIELD__NULL);

    }

    public void setStr(String value) {
        this.str = value;
    }

    public String getStr() {
        return this.str;
    }

    public void setNum(Long value) {
        this.num = value;
    }

    public Long getNum() {
        return this.num;
    }

    public void setFlo(Double value) {
        this.flo = value;
    }

    public Double getFlo() {
        return this.flo;
    }

    public void setBoo(Boolean value) {
        this.boo = value;
    }

    public Boolean isBoo() {
        return this.boo;
    }

    public void set_null(Object value) {
        this._null = value;
    }

    public Object get_null() {
        return this._null;
    }

}
