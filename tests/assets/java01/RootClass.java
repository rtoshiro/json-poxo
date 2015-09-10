package com.example;

import java.io.Serializable;
import java.util.ArrayList;

public class RootClass implements Serializable
{
  private String id;
  private String str;
  private Long num;
  private Double flo;
  private Boolean boo;
  private ArrayList<Long> arrnum;
  private ArrayList<String> arrstr;
  private ArrayList<Boolean> arrboo;
  private ArrayList<Arrnull> arrnull;
  private Obj obj;
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

  public void setArrnum(ArrayList<Long> value) {
      this.arrnum = value;
  }


  public ArrayList<Long> getArrnum() {
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

  public ArrayList<Boolean> isArrboo() {
      return this.arrboo;
  }

  public void setArrnull(ArrayList<Arrnull> value) {
      this.arrnull = value;
  }


  public ArrayList<Arrnull> getArrnull() {
      return this.arrnull;
  }

  public void setObj(Obj value) {
      this.obj = value;
  }


  public Obj getObj() {
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
          return ((RootClass) obj).getId().equals(id);
      }
      return false;
  }

  @Override
  public int hashCode(){
      return ((String)id).hashCode();
  }
}
