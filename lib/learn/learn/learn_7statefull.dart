import 'package:flutter/material.dart';



//StatefulWidget 使用
class learnStateFull extends StatefulWidget {
  @override
  _LearnStateFullState createState() => _LearnStateFullState();
}


class _LearnStateFullState extends State<learnStateFull> {

  int _currentIndex = 0;


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
          title: Text('StatefulWidget 基础组件'),
          leading: GestureDetector(
            onTap: () {
              //跳出
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,

          //切换
          onTap:(index){
            setState(() {
              _currentIndex = index;
            });
          } ,

          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color:Colors.grey),
                activeIcon: Icon(Icons.home, color:Colors.blue),
                title: Text('首页')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.list, color:Colors.grey),
                activeIcon: Icon(Icons.home, color:Colors.blue),
                title: Text('列表')
            )
          ],
        ),

        //切换页面
        body: _currentIndex == 0? RefreshIndicator(
            child: ListView(
              children: [
                //wrap 布局
                Wrap(
                  spacing: 8.0,      // 主轴(水平)方向间距
                  runSpacing: 4.0,   // 纵轴（垂直）方向间距
                  alignment: WrapAlignment.center, //沿主轴方向居中
                  children: <Widget>[
                    new Chip(
                      avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
                      label: new Text('Hamilton'),
                    ),
                    new Chip(
                      avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
                      label: new Text('Lafayette'),
                    ),
                    new Chip(
                      avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
                      label: new Text('Mulligan'),
                    ),
                    new Chip(
                      avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
                      label: new Text('Laurens'),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  //居中方式
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Image.network("http://www.devio.org/img/avatar.png",width: 100, height: 100,),
                      Text('i am Text', style: style),
                      Icon(Icons.android , size: 50 , color: Colors.red),
                      CloseButton(),
                      BackButton(),
                      Chip(
                          label: Text(' StatelessWidget 与基础组件'),
                          avatar: Icon(Icons.people)
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child:ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Opacity(
                                opacity: 0.6,
                                child: Image.network(
                                  'http://www.devio.org/img/avatar.png',
                                  width: 100,
                                  height: 100,)
                            )
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            hintText: '请输入' ,
                            hintStyle: TextStyle(fontSize: 15)
                        ),
                      ),
                      Container(
                          height: 100,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.lightBlueAccent),
                          child:
                          PhysicalModel(
                            color: Colors.transparent,
                            clipBehavior: Clip.antiAlias,  //抗锯齿
                            borderRadius: BorderRadius.circular(6),
                            child: PageView(
                              children: <Widget>[
                                _item("page1", Colors.deepOrange),
                                _item("page2", Colors.green),
                                _item("page3", Colors.deepOrange),
                                _item("page4", Colors.red)
                              ],),
                          )
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
              ],
            ), onRefresh: _handleRefresh):
        Text('列表页面'),

        //悬浮按钮
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text('点我'),
        ),

      ),
    );
  }

  Future<Null> _handleRefresh() async{
    await Future.delayed(Duration(milliseconds:200));
    return null;
  }

  _item(String title, Color color)  {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(title, style: TextStyle(fontSize: 22, color: Colors.white),),
    );
  }
}

