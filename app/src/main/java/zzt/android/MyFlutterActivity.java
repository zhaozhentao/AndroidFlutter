package zzt.android;

import android.os.Bundle;
import android.util.Log;

import androidx.annotation.Nullable;

import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;
import org.json.JSONException;
import org.json.JSONObject;

import io.flutter.embedding.android.FlutterActivity;

public class MyFlutterActivity extends FlutterActivity {

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EventBus.getDefault().register(this);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        EventBus.getDefault().unregister(this);
    }

    @Subscribe(threadMode = ThreadMode.MAIN)
    public void onMessageEvent(String message) {
        try {
            JSONObject j = new JSONObject(message);
            if (j.getBoolean("last_page")) {
                finish();
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }
}
