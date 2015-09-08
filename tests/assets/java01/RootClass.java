package com.example;

public class RootClass
{
  private String id;
  private String str;
  private Integer num;
  private Double flo;
  private Boolean boo;
  private ArrayList<Integer> arrnum;
  private ArrayList<String> arrstr;
  private ArrayList<Boolean> arrboo;
  private Object obj;
  private ArrayList<Arrobj> arrobj;

  public RootClass() {
  }

  public void setId(String value) {
      this.id = value;
  }

  public String getId() {
      return this.id;
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

  public void setArrnum(ArrayList<Integer> value) {
      this.arrnum = value;
  }

  public ArrayList<Integer> getArrnum() {
      return this.arrnum;
  }

  public void setArrstr(ArrayList<String> value) {
      this.arrstr = value;
  }

  public ArrayList<String> getArrstr() {
      return this.arrstr;
  }

  public void setArrboo(ArrayList<Boolean> value) {
      this.arrboo = value;
  }

  public ArrayList<Boolean> getArrboo() {
      return this.arrboo;
  }

  public void setObj(Object value) {
      this.obj = value;
  }

  public Object getObj() {
      return this.obj;
  }

  public void setArrobj(ArrayList<Arrobj> value) {
      this.arrobj = value;
  }

  public ArrayList<Arrobj> getArrobj() {
      return this.arrobj;
  }

  @Override
  public boolean equals(Object obj) {
      if (obj instanceof RootClass) {
          return ((RootClass) obj).getId() == id;
      }
      return false;
  }

  @Override
  public int hashCode(){
      return ((Long)id).hashCode();
  }
}
