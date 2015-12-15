package com.example.kebr1707.findstmeducator;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.TextView;

public class ReceiveEducatorActivity extends AppCompatActivity {

    private String educator;
    private String educatorURL;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_receive_educator);

        Intent intent = getIntent();
        educator = intent.getStringExtra("educatorName");
        educatorURL = intent.getStringExtra("educatorURL");
        System.out.println(educator);
        System.out.println(educatorURL);

        TextView messageView = (TextView)findViewById(R.id.educatorTextView);
        messageView.setText("You should look at these educators: " + educator);
    }
}
