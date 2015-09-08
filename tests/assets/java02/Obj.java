package com.example;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.annotations.SerializedName;
import com.google.gson.annotations.Expose;

public class Obj
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
  private Integer num;

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

  public void setNum(Integer value) {
      this.num = value;
  }

  public Integer getNum() {
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

  public Boolean getBoo() {
      return this.boo;
  }

  @Override
  public String toString() {
    Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
    return gson.toJson(this);
  }
}
