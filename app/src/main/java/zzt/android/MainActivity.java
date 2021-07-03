package zzt.android;

import android.os.Bundle;

import androidx.appcompat.app.AppCompatActivity;

import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        findViewById(R.id.flutter).setOnClickListener(v ->
            startActivity(FlutterActivity.withCachedEngine("my_engine_id").build(this))
        );
    }
}