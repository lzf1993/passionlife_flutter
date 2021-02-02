import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'learn/learn_11launch_app.dart';
import 'learn/learn_12widget_lifecycle.dart';
import 'learn/learn_13app_lifecycle.dart';
import 'learn/learn_14dynamic_theme.dart';
import 'learn/learn_15custome_font.dart';
import 'learn/learn_16photo_app.dart';
import 'learn/learn_5darts.dart';
import 'learn/learn_9gesture.dart';
import 'learn/learn_8layout.dart';
import 'learn/learn_5plugin_use.dart';
import 'learn/learn_10res_page.dart';
import 'learn/learn_7statefull.dart';
import 'learn/learn_6stateless.dart';



void main() {
  runApp(AppRouter());
}

class AppRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何创建和使用Flutter的路由与导航？'),
        ),
        body: RouteNavigator(),
      ),
      routes: <String, WidgetBuilder>{
        'dartStudy': (BuildContext context) => DartStudy(),
        'pluginUse': (BuildContext context) => PluginUse(),
        'learnStateLess': (BuildContext context) => learnStateLess(),
        'learnStateFull': (BuildContext context) => learnStateFull(),
        'learnLayout': (BuildContext context) => learnLayout(),
        'gesturePage': (BuildContext context) => GesturePage(),
        'resPage': (BuildContext context) => ResPage(),
        'launchPage': (BuildContext context) => LaunchPage(),
        'appLifeCycle': (BuildContext context) => AppLifeCycle(),
        'dynamicTheme': (BuildContext context) => DynamicTheme(),
        'customFont': (BuildContext context) => CustomFont(),
        'photoApp': (BuildContext context) => PhotoApp(),
      },
    );
  }
}



class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 35,top: 15),
      child: Column(
        children: <Widget>[
          SwitchListTile(
              title: Text('${byName ? '' : '不'}通过路由名跳转'),
              value: byName,
              onChanged: (value) {
                setState(() {
                  byName = value;
                });
              }),
          _item('Flutter Dart 语法学习', DartStudy(), 'dartStudy'),
          _item('如何使用Flutter包和插件？', PluginUse(), 'pluginUse'),
          _item('布局组件', learnLayout(), 'learnLayout'),
          _item('StatefulWidget与基础组件', learnStateFull(), 'learnStateFull'),
          _item('StatelessWidget与基础组件', learnStateLess(), 'learnStateLess'),
          _item('如何创建和使用Flutter的路由与导航？', AppRouter(), 'route'),
          _item('用户手势检测和点击事件', GesturePage(), 'gesturePage'),
          _item('如何使用资源文件', ResPage(), 'resPage'),
          _item('如何打开第三方应用？', LaunchPage(), 'launchPage'),
          _item('组件的生命周期？', WidgetLifecycle(), 'widgetLifecycle'),
          _item('APP的生命周期？', AppLifeCycle(), 'appLifeCycle'),
          _item('如何动态修改应用主题？', DynamicTheme(), 'dynamicTheme'),
          _item('自定义字体', CustomFont(), 'customFont'),
          _item('拍照 app', PhotoApp(), 'photoApp'),
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if (byName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}

