import 'package:flutter/material.dart';



void main3() {
  runApp(learnLessFull());
}

class learnLessFull extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    TextStyle style = TextStyle(fontSize:20);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
            title: Text('StatelessWidget 基础组件'),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            )),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          //居中方式
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text('i am Text', style: style),
              Icon(Icons.android , size: 50 , color: Colors.red),
              CloseButton(),
              BackButton(),
              Chip(
                  label: Text(' StatelessWidget 与基础组件'),
                  avatar: Icon(Icons.people)
              ),
              Divider(
                height:10,
                indent: 10, //左侧间距
                color: Colors.orange,
              ),
              Card(
                color: Colors.blue,
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'i am Card',
                    style: style,
                  ),
                ),
              ),
              AlertDialog(
                title: Text('你好'),
                content:Text('过年啦'),
              )
            ],
          ),
        ),
      ),
    );
  }
}



