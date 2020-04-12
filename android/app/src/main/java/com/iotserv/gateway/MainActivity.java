package com.iotserv.gateway;

import android.content.Intent;
import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    Intent it=new Intent(this, com.iotserv.gateway.NatCloudClientService.class);
    startService(it);
    GeneratedPluginRegistrant.registerWith(this);
  }
}
