
import 'package:flutter/material.dart';


//应用的生命周期
class AppLifeCycle extends StatefulWidget {
  @override
  _AppLifeCycleState createState() => _AppLifeCycleState();
}

class _AppLifeCycleState extends State<AppLifeCycle> with WidgetsBindingObserver{

  @override
  void initState() {
    //添加监听器
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter 应用生命周期'),
        leading: BackButton() ,
      ),
      body: Container(
         alignment: Alignment.center,
         child: Text('生命周期监听'),
      ),
    );
  }

  //当 app 生命周期发生变化，会回调这个方法
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('------------- App 生命周期变化 $state ---------------');
    if(state == AppLifecycleState.paused){
      print(' App 进入后台');
    }else if(state == AppLifecycleState.resumed){
      print(' App 进入前台');
    }
    //不常用，应用程序处于非活动状态，比如未接收用户输入时调用，比如来了个电话
    else if(state == AppLifecycleState.inactive){
      print(' App inactive');
    }else if(state == AppLifecycleState.detached){
      print(' App detached');
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
