package ;

import org.json.*;
import java.io.Serializable;


public class Arrnull implements Serializable
{


    public Arrnull() {

    }

    public Arrnull(JSONObject jsonObject) {
        parseObject(jsonObject);
    }

    public Arrnull(String jsonString) {
        parseString(jsonString);
    }

    protected void parseString(String jsonString) throws JSONException {
        JSONObject jsonObject = new JSONObject(jsonString);
        parseObject(jsonObject);
    }

    protected void parseObject(JSONObject object)
    {
    }

}
