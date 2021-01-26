// Step 7 (Final): Change the app's theme
import 'package:flutter/material.dart';
import 'package:openiothub_plugin/plugins/mdnsService/mDNSService/getway.dart';
import 'package:openiothub_grpc_api/pb/service.pb.dart';
import 'package:openiothub_grpc_api/pb/service.pbgrpc.dart';

void main() => runApp(new MyApp());
//TODO 开机自启，配置保存，斐讯r1安装网关脚本
class MyApp extends StatelessWidget {
  static PortService get gatewayPortService {
    PortService gatewayPortService = PortService.create();
    gatewayPortService.isLocal = true;
    gatewayPortService.ip = "127.0.0.1";
    gatewayPortService.port = 1082;
    gatewayPortService.info.addAll({
        "name": "网关",
        "model": Gateway.modelName,
        "mac": "mac",
        "id": "id",
        "author": "Farry",
        "email": "newfarry@126.com",
        "home-page": "https://github.com/OpenIoTHub",
        "firmware-respository": "https://github.com/OpenIoTHub/gateway-go",
        "firmware-version": "version",
      }
    );
  }


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
