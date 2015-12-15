package com.example.kebr1707.findstmeducator;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.EditText;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.ToggleButton;


public class FindEducator extends AppCompatActivity {

        public void findinfo(View view) {

        TextView endString = (TextView) findViewById(R.id.textView4);

        //START Edit Text
        EditText name = (EditText) findViewById(R.id.editTextName);
        String nameValue = name.getText().toString();
        //END Edit Text

        //START Toggle Button (Sex)
        ToggleButton toggleSex = (ToggleButton) findViewById(R.id.toggleButtonSex);
        boolean sex = toggleSex.isChecked();
        String sexString;
        if (sex) {
            sexString = "male";
        } else {
            sexString = "female";
        }
        //END Toggle Button (Sex)

        //START Spinner (Location)
        //END Spinner (Location)

        //START Spinner (Use)
        Spinner useSpinner = (Spinner) findViewById(R.id.spinnerUse);
        String useValue = String.valueOf(useSpinner.getSelectedItem());
        //END Spinner (Use)

        //START Radio Group (Learning)
        RadioGroup learning = (RadioGroup) findViewById(R.id.radioButtonsLearning);
        String learningType;
        int type = learning.getCheckedRadioButtonId();
        switch(type){
            case -1:
                learningType="none";
                break;
            case R.id.radioButton1:
                learningType="one-on-one (in person)";
                break;
            case R.id.radioButton2:
                learningType="one-on-one (online)";
                break;
            case R.id.radioButton3:
                learningType="in small groups";
                break;
            case R.id.radioButton4:
                learningType="reading";
                break;
            default:
                learningType="none";
        }
        //END Radio Group (Learning)

        //START Toggle Button (Religion)
        ToggleButton toggleButtonReligion = (ToggleButton) findViewById(R.id.toggleButtonReligion);
        boolean religion = toggleButtonReligion.isChecked();
        String religionString;
        if (religion) {
            religionString = "Catholic";
        } else {
            religionString = "secular";
        }
        //END Toggle Button (Religion)

        //START Button (Go)
        //END Button (Go)

        //START End String
        endString.setText(nameValue + " is a " + sexString + ", and wants to learn STM " + useValue + ". You learn best " + learningType + " and prefer to learn through a " + religionString + " teaching.");
        //END End String
    }

    private EducatorInfo myEducator = new EducatorInfo();

    public void findCertifiedEducator(View view) {
        Spinner stmMethodUse = (Spinner) findViewById(R.id.spinnerUse);
        String methodUse = String.valueOf(stmMethodUse.getSelectedItem());
        myEducator.setEducator(methodUse);
        String suggestedEducator = myEducator.getEducator();
        String suggestedEducatorURL = myEducator.getEducatorURL();
        System.out.println(suggestedEducator);
        System.out.println(suggestedEducatorURL);

        Intent intent = new Intent(this, ReceiveEducatorActivity.class);

        intent.putExtra("educatorName", suggestedEducator);
        intent.putExtra("educatorURL", suggestedEducatorURL);

        startActivity(intent);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_find_educator);
    }

}
