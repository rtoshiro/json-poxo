package com.example.package;

import org.json.*;
import java.io.Serializable;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.annotations.SerializedName;
import com.google.gson.annotations.Expose;

public class Special implements Serializable
{
    private static final String FIELD_A = "A";
    private static final String FIELD__B______ = "[B]\"\"&^ ";
    private static final String FIELD_WITH_SOME_SPACES = "with some spaces";
    private static final String FIELD__NEW = "new";

    @Expose
    @SerializedName(FIELD_A)
    private Object a;
    @Expose
    @SerializedName(FIELD__B______)
    private String _b______;
    @Expose
    @SerializedName(FIELD_WITH_SOME_SPACES)
    private String with_some_spaces;
    @Expose
    @SerializedName(FIELD__NEW)
    private Long _new;

    public Special() {

    }

    public Special(JSONObject jsonObject) {
        parseObject(jsonObject);
    }

    public Special(String jsonString) {
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
        this.a = object.opt(FIELD_A);
        this._b______ = object.optString(FIELD__B______);
        this.with_some_spaces = object.optString(FIELD_WITH_SOME_SPACES);
        this._new = object.optLong(FIELD__NEW);

    }

    public void setA(Object value) {
        this.a = value;
    }

    public Object getA() {
        return this.a;
    }

    public void set_b______(String value) {
        this._b______ = value;
    }

    public String get_b______() {
        return this._b______;
    }

    public void setWith_some_spaces(String value) {
        this.with_some_spaces = value;
    }

    public String getWith_some_spaces() {
        return this.with_some_spaces;
    }

    public void set_new(Long value) {
        this._new = value;
    }

    public Long get_new() {
        return this._new;
    }


    @Override
    public String toString() {
      Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
      return gson.toJson(this);
    }
}
