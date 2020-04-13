package com.iotserv.gateway;

import android.content.Intent;
import android.os.Bundle;
import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    Intent it=new Intent(this, com.iotserv.gateway.NatCloudClientService.class);
    startService(it);
  }
}
