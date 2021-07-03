package zzt.android;

import android.os.Bundle;
import android.util.Log;

import androidx.appcompat.app.AppCompatActivity;

import io.flutter.embedding.android.FlutterActivity;
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
            Log.e("message", message);
            reply.reply("hah");
        });

        findViewById(R.id.flutter).setOnClickListener(v -> {
            eventChannel.send("/");
            startActivity(FlutterActivity.withCachedEngine("flutter").build(this));
        });

        findViewById(R.id.index).setOnClickListener(v -> {
            eventChannel.send("index");
            startActivity(FlutterActivity.withCachedEngine("flutter").build(this));
        });
    }
}
