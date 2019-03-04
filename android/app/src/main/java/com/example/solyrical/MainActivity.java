package com.example.solyrical;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import java.io.FileDescriptor;

import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.os.Bundle;
import android.media.MediaMetadataRetriever;

public class MainActivity extends FlutterActivity {
  private static final String CHANNEL = "flutter.io/Id3";
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
                new MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, Result result) {
                      if(call.method.equals("getImage")){
                      
                        String uri = call.argument("path");
                        MediaMetadataRetriever retriever = new MediaMetadataRetriever();
                        retriever.setDataSource(uri);
                        byte [] data = retriever.getEmbeddedPicture();
                      
                        // convert the byte array to a bitmap
                        // Bitmap bitmap = BitmapFactory.decodeByteArray(data, 0, data.length);
                        // do something with the image ...
                        // mImageView.setImageBitmap(bitmap);
                        retriever.release();
                        result.success(data);
                      }
                      else {
                        result.notImplemented();
                      }
                      
                    }
                });
 
  }
}
