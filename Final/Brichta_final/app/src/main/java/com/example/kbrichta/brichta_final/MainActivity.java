package com.example.kbrichta.brichta_final;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import android.content.Intent;
import android.view.View;
import android.widget.TextView;
import android.widget.EditText;
import android.widget.ToggleButton;


public class MainActivity extends AppCompatActivity {

    public void buildPizza(View view) {

        TextView favoritePizza = (TextView) findViewById(R.id.textView2);

        //START Edit Text
        EditText pizzaName = (EditText) findViewById(R.id.editText);
        String nameValue = pizzaName.getText().toString();
        //END Edit Text

        //START Toggle Button
        ToggleButton toggleSauce = (ToggleButton) findViewById(R.id.toggleButton);
        boolean sauce = toggleSauce.isChecked();
        String sauceString;
        if (sauce) {
            sauceString = "Red";
        } else {
            sauceString = "White";
        }
        //END Toggle Button

        //START TextView2
        favoritePizza.setText(nameValue + " has " + sauceString + " sauce.");
        //END TextView2

    }

    private PizzaPlace myPizzaPlace = new PizzaPlace();

    public void findPizzaPlace(View view){
        ToggleButton toggleSauce = (ToggleButton)findViewById(R.id.toggleButton);
        String pizzaSauces = String.valueOf(toggleSauce.getText());
        myPizzaPlace.setPizzaPlace(pizzaSauces);
        String suggestedPizzaPlace = myPizzaPlace.getPizzaPlace();
        String suggestedPizzaPlaceURL = myPizzaPlace.getPizzaPlaceURL();
        System.out.println(suggestedPizzaPlace);
        System.out.println(suggestedPizzaPlaceURL);

        Intent intent = new Intent(this, RecievePizzaActivity.class);

        startActivity(intent);

        intent.putExtra("pizzaPlaceName", suggestedPizzaPlace);
        intent.putExtra("pizzaPlaceURL", suggestedPizzaPlaceURL);

        startActivity(intent);
    }


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
}
