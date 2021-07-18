package zzt.android;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;

import androidx.appcompat.app.AppCompatActivity;

import org.greenrobot.eventbus.EventBus;

import io.flutter.embedding.engine.FlutterEngineCache;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.StringCodec;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        BasicMessageChannel<String> eventChannel = new BasicMessageChannel<>(
            FlutterEngineCache.getInstance().get("flutter").getDartExecutor().getBinaryMessenger(),
            "my",
            StringCodec.INSTANCE
        );
        eventChannel.setMessageHandler((message, reply) -> {
            Log.e("eventChannel", message);
            EventBus.getDefault().post(message);
        });

        findViewById(R.id.flutter).setOnClickListener(v -> {
            eventChannel.send("/");
            MyFlutterActivity.CachedEngineIntentBuilder builder = new MyFlutterActivity.CachedEngineIntentBuilder(MyFlutterActivity.class, "flutter");
            Intent intent = builder.build(this);
            startActivity(intent);
        });

        findViewById(R.id.index).setOnClickListener(v -> {
            eventChannel.send("index");
            MyFlutterActivity.CachedEngineIntentBuilder builder = new MyFlutterActivity.CachedEngineIntentBuilder(MyFlutterActivity.class, "flutter");
            Intent intent = builder.build(this);
            startActivity(intent);
        });
    }
}
