package zzt.android;

import android.os.Bundle;

import androidx.appcompat.app.AppCompatActivity;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.FlutterEngineCache;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StringCodec;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        findViewById(R.id.flutter).setOnClickListener(v -> {
            FlutterEngine engine = FlutterEngineCache.getInstance().get("flutter");

            BinaryMessenger messenger = engine.getDartExecutor().getBinaryMessenger();
            BasicMessageChannel<String> eventChannel = new BasicMessageChannel<>(messenger, "my", StringCodec.INSTANCE);
            eventChannel.send("/");

            startActivity(FlutterActivity.withCachedEngine("flutter").build(this));
        });

        findViewById(R.id.index).setOnClickListener(v -> {
            FlutterEngine engine = FlutterEngineCache.getInstance().get("flutter");

            BinaryMessenger messenger = engine.getDartExecutor().getBinaryMessenger();
            BasicMessageChannel<String> eventChannel = new BasicMessageChannel<>(messenger, "my", StringCodec.INSTANCE);
            eventChannel.send("index");

            startActivity(FlutterActivity.withCachedEngine("flutter").build(this));
        });
    }
}
