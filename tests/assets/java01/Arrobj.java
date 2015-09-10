package com.example;

import java.io.Serializable;
public class Arrobj implements Serializable
{
  private String str;
  private Long num;
  private Double flo;
  private Boolean boo;
  private Object null;

  public Arrobj() {
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

  public void setNull(Object value) {
      this.null = value;
  }


  public Object getNull() {
      return this.null;
  }

}
