

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main7(){
  new GesturePage();
}

//手势检测
class GesturePage extends StatefulWidget {
  @override
  _GesturePageState createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {

  String printString = '';
  double moveX = 0, moveY = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何检测用户手势以及处理点击事件'),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap:() =>_printMsg('点击'),
                    onDoubleTap:() =>_printMsg('双击'),
                    onLongPress:() =>_printMsg('长按'),
                    onTapCancel:() =>_printMsg('取消'),
                    onTapUp:(e) =>_printMsg('松开'),
                    onTapDown:(e) =>_printMsg('按下'),
                    child: Container(
                      alignment: Alignment.center,
                      margin:EdgeInsets.all(10),
                      padding: EdgeInsets.all(60),
                      decoration: BoxDecoration(color: Colors.amberAccent),
                      child: Text('点我', style: TextStyle(fontSize: 36, color: Colors.white),),
                    ),
                  ),
                  Text('' + printString),
                ],
              ),
              Positioned(
                //跟着手指滑动的小球
                left: moveX,
                top: moveY,
                child: GestureDetector(
                  onPanUpdate: (e) => _doMove(e),
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(36)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  _printMsg(String s) {
    setState(() {
      printString = '事件： ${s}';
    });
  }

  _doMove(DragUpdateDetails e) {
    setState(() {
      moveY += e.delta.dy;
      moveX += e.delta.dx;
    });
    print(e);
  }
}
