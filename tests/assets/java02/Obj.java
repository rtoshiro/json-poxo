package com.example;

import java.io.Serializable;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.annotations.SerializedName;
import com.google.gson.annotations.Expose;

public class Obj implements Serializable
{
  private static final String FIELD_STR = "str";
  private static final String FIELD_NUM = "num";
  private static final String FIELD_FLO = "flo";
  private static final String FIELD_BOO = "boo";

  @Expose
  @SerializedName(FIELD_STR)
  private String str;

  @Expose
  @SerializedName(FIELD_NUM)
  private Long num;

  @Expose
  @SerializedName(FIELD_FLO)
  private Double flo;

  @Expose
  @SerializedName(FIELD_BOO)
  private Boolean boo;

  public Obj() {
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

  @Override
  public String toString() {
    Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
    return gson.toJson(this);
  }
}
