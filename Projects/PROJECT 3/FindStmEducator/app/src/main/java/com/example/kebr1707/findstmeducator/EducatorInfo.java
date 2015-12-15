package com.example.kebr1707.findstmeducator;

/**
 * Created by kebr1707 on 12/14/15.
 */
public class EducatorInfo {
    private String educator;
    private String educatorURL;

    private void setInfo(String stmMethodUse){
        if (stmMethodUse.equals("to achieve pregnancy")) {
            educator = "Rachel Snow";
            educatorURL = "http://boulderfertility.weebly.com/";

        } else if (stmMethodUse.equals("to avoid pregnancy")) {
            educator = "Justina Thompson";
            educatorURL = "http://www.justinathompson.com/";

        } else if (stmMethodUse.equals("for health")) {
            educator = "Faith Rodgers";
            educatorURL = "http://www.thelittleherbal.com/";

        } else if (stmMethodUse.equals("for an introduction")) {
            educator = "Taking Charge of Your Fertility";
            educatorURL = "http://www.tcoyf.com/";

        } else {
            educator = "none";
            educatorURL = "http://www.fertilityfriday.com/22-fertility-awareness-websites-you-should-know-about/";
        }
    }

    public void setEducator(String stmMethodUse){setEducator(stmMethodUse);}
    public void setEducatorURL(String stmMethodUse){setEducator(stmMethodUse);}

    public String getEducator() {return educator;}
    public String getEducatorURL() {return educatorURL;}

}
