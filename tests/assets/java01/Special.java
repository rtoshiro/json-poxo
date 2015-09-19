package ;

import org.json.*;
import java.io.Serializable;


public class Special implements Serializable
{
  private static final String FIELD_A = "A";
  private static final String FIELD__B______ = "[B]\"\"&^ ";
  private static final String FIELD_WITH_SOME_SPACES = "with some spaces";
  private static final String FIELD__NEW = "new";

  private Object a;
  private String _b______;
  private String with_some_spaces;
  private Long _new;

  public Special() {

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

}
