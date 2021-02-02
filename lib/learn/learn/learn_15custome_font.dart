
// 自定义字体
// 字体下载地址：https://fonts.google.com/specimen/Rubik+Mono+One?selection=#standard-styles

import 'package:flutter/material.dart';

class CustomFont extends StatefulWidget {
  @override
  _CustomFontState createState() => _CustomFontState();
}

class _CustomFontState extends State<CustomFont> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '自定义字体',
      theme: ThemeData(
        //使用自定义字体 --- 全局使用
        fontFamily: 'RubikMonoOne',
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('自定义字体'),
          ),
          body: Column(
            children: <Widget>[
               Text('更换字体',style: TextStyle(fontSize: 28),),

              //使用自定义字体 --- 单个控件使用
               Text('单个组件更换字体',style: TextStyle(fontSize: 28,fontFamily: 'LondrinaSolid'),),
            ],
          )
      ),
    );
  }
}
