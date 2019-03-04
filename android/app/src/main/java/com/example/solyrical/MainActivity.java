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
import android.os.Environment;
import java.io.File;
import java.util.ArrayList;

public class MainActivity extends FlutterActivity {
  private static final String CHANNEL = "flutter.io/solyrical";
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
                      else if(call.method.equals("getSongs")){

                        result.success(getSongs());
                      }
                      else {
                        result.notImplemented();
                      }
                      
                    }
                });
 
  }

  public ArrayList<String> getSongs(){
    File file= Environment.getExternalStorageDirectory();
    String root=file.getPath()+"/";
    ArrayList<String> songs=new ArrayList<String>();
    scanDirectory(file.listFiles(),songs);
    return songs;
  }


  public void scanDirectory(File[] files,ArrayList<String> songs) {
    for (File temp : files) {
      if (temp.isDirectory() && !temp.toString().contains("/."))
        scanDirectory(temp.listFiles(),songs);
      else if (temp.getAbsolutePath().endsWith(".mp3")) {
        songs.add(temp.getAbsolutePath());
      }
    }
  }
}
