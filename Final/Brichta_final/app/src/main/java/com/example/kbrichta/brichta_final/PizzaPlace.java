package com.example.kbrichta.brichta_final;

/**
 * Created by kbrichta on 12/10/15.
 */
public class PizzaPlace {
    private String pizzaPlace;
    private String pizzaPlaceURL;

    private void setPizzaInfo(String pizzaSauces){
        switch (pizzaSauces){
            case "Red":
                pizzaPlace="Basta";
                pizzaPlaceURL="http://bastaboulder.com/";
                break;
            case "White":
                pizzaPlace="Boss Lady";
                pizzaPlaceURL="http://www.bossladypizza.com/";
                break;
            default:
                pizzaPlace="none";
                pizzaPlaceURL="https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=pizza%20boulder";

        }
    }

    public void setPizzaPlace(String pizzaSauces) { setPizzaInfo(pizzaSauces);}

    public void setPizzaPlaceURL(String pizzaSauces) { setPizzaInfo(pizzaSauces);}

    public String getPizzaPlace() {return pizzaPlace;}
    public String getPizzaPlaceURL() {return pizzaPlaceURL;}
}
