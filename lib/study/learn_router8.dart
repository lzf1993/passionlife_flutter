import 'package:flutter/material.dart';

import 'learn_layout8.dart';
import 'learn_plugin_use5.dart';
import 'learn_statefull7.dart';
import 'learn_stateless6.dart';



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
        'route': (BuildContext context) => AppRouter(),
        'pluginUse': (BuildContext context) => PluginUse(),
        'learnLayout': (BuildContext context) => learnLayout(),
        'learnStateFull': (BuildContext context) => learnStateFull(),
        'learnLessFull': (BuildContext context) => learnLessFull(),
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
    return Container(
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
          _item('如何使用Flutter包和插件？', PluginUse(), 'pluginUse'),
          _item('布局组件', learnLayout(), 'learnLayout'),
          _item('StatefulWidget与基础组件', learnStateFull(), 'learnStateFull'),
          _item('StatelessWidget与基础组件', learnLessFull(), 'learnLessFull'),
          _item('如何创建和使用Flutter的路由与导航？', AppRouter(), 'route'),
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

