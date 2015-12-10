package com.example.kbrichta.brichta_final;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.content.Intent;
import android.widget.TextView;
import android.view.View;
import android.net.Uri;

public class RecievePizzaActivity extends AppCompatActivity {

    private String pizzaPlace;
    private String pizzaPlaceURL;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_recieve_pizza);

        Intent intent = getIntent();
        pizzaPlace = intent.getStringExtra("pizzaPlaceName");
        pizzaPlaceURL = getIntent().getStringExtra("pizzaPlaceURL");
        System.out.println(pizzaPlace);
        System.out.println(pizzaPlaceURL);

        TextView messageView = (TextView)findViewById(R.id.pizzaPlaceTextView);
        messageView.setText("You should go to " + pizzaPlace);
    }

    public void loadWebSite(View view){
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(pizzaPlaceURL));
        startActivity(intent);
    }
}
