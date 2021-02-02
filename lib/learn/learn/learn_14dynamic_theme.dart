
import 'package:flutter/material.dart';


//动态修改主题
class DynamicTheme extends StatefulWidget {
  @override
  _DynamicThemeState createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {

  Brightness _brightness = Brightness.dark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '动态修改应用主题',
      theme: ThemeData(
        //修改为夜间模式
        brightness: _brightness,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('如何动态修改应用主题'),
          ),
          body: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: (){
                  setState(() {
                    if(_brightness == Brightness.dark){
                      _brightness = Brightness.light;
                    }else{
                      _brightness = Brightness.dark;
                    }
                  });
                },
                child: Text('切换主题'),
              )
            ],
          )
      ),
    );
  }
}
