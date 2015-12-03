package com.example.kbrichta.coffee;

/**
 * Created by kbrichta on 11/19/15.
 */
public class CoffeeShop {
    private String coffeeShop;
    private String coffeeShopURL;

    private void setCoffeeInfo(String coffeeCrowd){
        switch (coffeeCrowd){
            case "cycling":
                coffeeShop="Amante";
                coffeeShopURL="https://www.amantecoffee.com";
                break;
            case "hipster":
                coffeeShop="Ozo";
                coffeeShopURL="https://ozocoffee.com";
                break;
            case "hippie":
                coffeeShop="Trident";
                coffeeShopURL="http://www.tridentcafe.com";
                break;
            case "tea":
                coffeeShop="Pekoe";
                coffeeShopURL="http://www.pekoesiphouse.com";
                break;
            case "college":
                coffeeShop="Buchanans";
                coffeeShopURL="https://www.facebook.com/BuchanansCoffeePub/";
                break;
            default:
                coffeeShop="none";
                coffeeShopURL="https://google.com/search?q=boulder+coffee_shops&ie=utf-8&oe=utf-8";
        }
    }

    public void setCoffeeShop(String coffeeCrowd){
        setCoffeeInfo(coffeeCrowd);
    }

    public void setCoffeeShopURL(String coffeeCrowd){
        setCoffeeInfo(coffeeCrowd);
    }

    public String getCoffeeShop(){
        return coffeeShop;
    }

    public String getCoffeeShopURL(){
        return coffeeShopURL;
    }
}
