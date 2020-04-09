// Step 7 (Final): Change the app's theme

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '云易连网关',
      theme: new ThemeData(
        primaryColor: Colors.purple,
      ),
      home: new RandomWords(),
      darkTheme: new ThemeData(
        primaryColor: Colors.black,
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  TextEditingController _host_controller = TextEditingController.fromValue(
      TextEditingValue(text: "guonei.nat-cloud.com"));
  TextEditingController _tcp_port_controller =
      TextEditingController.fromValue(TextEditingValue(text: "34320"));
  TextEditingController _udp_p2p_controller =
      TextEditingController.fromValue(TextEditingValue(text: "34321"));
  TextEditingController _key_controller =
      TextEditingController.fromValue(TextEditingValue(text: "HLLdsa544&*S"));
  TextEditingController _runid_controller =
      TextEditingController.fromValue(TextEditingValue(text: ""));

  login() async {
    var url = 'http://127.0.0.1:1082/loginServer';
    var response;
    try {
      var config = {
        'last_id': _runid_controller.text,
        'server_host': _host_controller.text,
        'tcp_port': _tcp_port_controller.text,
        'udp_p2p_port': _udp_p2p_controller.text,
        'login_key': _key_controller.text
      };
      response = await http.post(url, body: config);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['Code'] == 0) {
          showDialog(
              context: context,
              builder: (_) => new AlertDialog(
                      title: new Text("登录结果"),
                      content: new Text("登录成功！现在可以获取访问Token来访问本内网了！"),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text("取消"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        new FlatButton(
                          child: new Text("确认"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ]));
        } else {
          showDialog(
              context: context,
              builder: (_) => new AlertDialog(
                      title: new Text("登录结果"),
                      content: new Text("登录失败：" + data['Msg'].toString()),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text("取消"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        new FlatButton(
                          child: new Text("确认"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ]));
        }
      }
    } catch (exception) {
      showDialog(
          context: context,
          builder: (_) => new AlertDialog(
                  title: new Text("登录服务器错误"),
                  content: new Text(exception.toString()),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text("取消"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    new FlatButton(
                      child: new Text("确认"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ]));
    }
  }

  seeToken() async {
    var url = 'http://127.0.0.1:1082/getExplorerToken';
    var response;
    try {
      response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['Code'] == 0) {
          showDialog(
              context: context,
              builder: (_) => new AlertDialog(
                      title: new Text("本内网访问Token"),
                      content: new TextFormField(initialValue: data['Token']),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text("取消"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        new FlatButton(
                          child: new Text("复制到剪切板"),
                          onPressed: () {
                            Clipboard.setData(
                                new ClipboardData(text: data['Token']));
                            Navigator.of(context).pop();
                          },
                        )
                      ]));
        }
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (_) => new AlertDialog(
                  title: new Text("获取Token出现错误！"),
                  content: new Text(e.toString()),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text("取消"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    new FlatButton(
                      child: new Text("确认"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("内网穿透(内网端)"),
        ),
        body: new ListView(
          children: <Widget>[
            new TextFormField(
              controller: _host_controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                labelText: '请输入服务器地址',
                helperText: '输入ip或者域名',
              ),
            ),
            new TextFormField(
              controller: _tcp_port_controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                labelText: '请输入服务器TCP端口',
                helperText: '与服务器的设置一致：tcp_port',
              ),
            ),
            new TextFormField(
              controller: _udp_p2p_controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                labelText: '请输入服务器udp_p2p端口',
                helperText: '请输入服务器设置一致：udp_p2p_port',
              ),
            ),
            new TextFormField(
              controller: _key_controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                labelText: '请输入服务器秘钥',
                helperText: '请输入服务器设置一致：login_key',
              ),
            ),
            new TextFormField(
              controller: _runid_controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                labelText: '请输入本内网id',
                helperText: '可以随机输入一个UUID，可以留空随机生成',
              ),
            ),
            new Row(
              children: <Widget>[
                new Container(
                  child: new RaisedButton(
                    child: new Text("连接服务器"),
                    color: Colors.blue,
                    onPressed: () {
//                      从用户的填写中获取参数请求后端连接服务器
                      login();
                    },
                  ),
                  margin: EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                    child: new Text("查看Token"),
                    color: Colors.green,
                    onPressed: () {
                      seeToken();
                    })
              ],
            )
          ],
        ));
  }
}
