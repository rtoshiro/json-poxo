package ;

import org.json.*;
import java.io.Serializable;

import java.util.ArrayList;

public class Rootclass implements Serializable
{
  private static final String FIELD_ID = "id";
  private static final String FIELD_STR = "str";
  private static final String FIELD_NUM = "num";
  private static final String FIELD_FLO = "flo";
  private static final String FIELD_BOO = "boo";
  private static final String FIELD_SPECIAL = "special";
  private static final String FIELD_ARRDOUBLE = "arrdouble";
  private static final String FIELD_ARRNUM = "arrnum";
  private static final String FIELD_ARRSTR = "arrstr";
  private static final String FIELD_ARRBOO = "arrboo";
  private static final String FIELD_ARRNULL = "arrnull";
  private static final String FIELD_OBJ = "obj";
  private static final String FIELD_ARROBJ = "arrobj";

  private String id;
  private String str;
  private Long num;
  private Double flo;
  private Boolean boo;
  private Special special;
  private ArrayList<Double> arrdouble;
  private ArrayList<Long> arrnum;
  private ArrayList<String> arrstr;
  private ArrayList<Boolean> arrboo;
  private ArrayList<Arrnull> arrnull;
  private Obj obj;
  private ArrayList<Arrobj> arrobj;

  public Rootclass() {

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

  public void setSpecial(Special value) {
      this.special = value;
  }


  public Special getSpecial() {
      return this.special;
  }

  public void setArrdouble(ArrayList<Double> value) {
      this.arrdouble = value;
  }


  public ArrayList<Double> getArrdouble() {
      return this.arrdouble;
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


  public ArrayList<Boolean> getArrboo() {
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
      if (obj instanceof Rootclass) {
          return ((Rootclass) obj).getId().equals(id);
      }
      return false;
  }

  @Override
  public int hashCode(){
      return ((String)id).hashCode();
  }
}
