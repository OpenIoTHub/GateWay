// Step 7 (Final): Change the app's theme

import 'package:flutter/material.dart';
import 'package:modules/pages/gateWay/findmDNSClientList.dart';
import 'package:modules/pages/mdnsService/mDNSService/getway.dart';
import 'package:modules/model/portService.dart';

void main() => runApp(new MyApp());
//TODO 开机自启，配置保存，斐讯r1安装网关脚本
class MyApp extends StatelessWidget {
  var gatewayPortService = PortService(
      portConfig: null,
      isLocal: true,
      info: {
        "name": "网关",
        "model": Gateway.modelName,
        "mac": "mac",
        "id": "id",
        "author": "Farry",
        "email": "newfarry@126.com",
        "home-page": "https://github.com/OpenIoTHub",
        "firmware-respository": "https://github.com/OpenIoTHub/gateway-go",
        "firmware-version": "version",
      },
      ip: "127.0.0.1",
      port: 1082);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '云易连网关',
      theme: new ThemeData(
        primaryColor: Colors.purple,
      ),
      home: Gateway(serviceInfo: gatewayPortService),
      darkTheme: new ThemeData(
        primaryColor: Colors.black,
      ),
    );
  }
}
