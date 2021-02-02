
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


/**
 *  StatefulWidget 生命周期
 *  因为无状态的 widget StatelessWidget 只有 createElement 、build 两个生命周期方法
 *
 *  StateFulWidget 的生命周期按照时期不同，可以分为三组
 *
 *  1、初始化时期： createState 、initState
 *  2、更新时期:  didChangeDependencies 、build 、didUpdateWidget
 *  3、销毁时期： deactivate 、 dispose
 *
 * */
class WidgetLifecycle extends StatefulWidget {
  @override
  _WidgetLifecycleState createState() => _WidgetLifecycleState();
}

class _WidgetLifecycleState extends State<WidgetLifecycle> {

  int _count = 0;

  _WidgetLifecycleState(){
    print(' ------------ 1、构造方法:  ---------------');
  }

  //构造方法后的第一个方法： 类似于 onCreate
  @override
  void initState() {
    print(' ------------ 2、initState:  ---------------');
    super.initState();
  }

  //当依赖的 state 对象改变了就会调用
  // a、在第一次构建 widget 时，在 initState 之后立即调用此方法
  // b、如果 StatefulWidget 依赖于 InheritedWidget ，那么当当前 State 所依赖 InheritedWidget 中的变量改变时，会再次调用它
  //
  // InheritedWidget 可以高效向下传递数据给 Widget
  @override
  void didChangeDependencies() {
    print(' ------------ 3、didChangeDependencies:  ---------------');
    super.didChangeDependencies();
  }


  /**
   *  当父组件需要重绘时，才会调用
   *   该方法会携带一个 oldWidget , 可以将其与当前的 oldWidget 进行对比，以便执行一些额外的逻辑
   * */
  @override
  void didUpdateWidget(covariant WidgetLifecycle oldWidget) {
    print(' ------------ 4、didUpdateWidget:  ---------------');
    super.didUpdateWidget(oldWidget);
  }


  /**
   * 每次渲染的时候都会被调用
   * 1、是一个必须实现的方法，会在 didChangeDependencies 之后立即被调用
   * 2、当调用 setState 后，会再次调用该方法
   * **/
  @override
  Widget build(BuildContext context) {
    print(' ------------ 5、build:  ---------------');
    return Scaffold(
      appBar:
      AppBar(
        title: Text('组件的生命周期'),
        leading: BackButton(),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                setState(() {
                  _count ++;
                });
              },
              child: Text('点我', style: TextStyle(fontSize: 26),),
            ),
            Text(_count.toString())
          ],
        ),
      ),
    );
  }



  //很少使用，在组件被移除时调用，在 dispose 之前调用
  @override
  void deactivate() {
    print(' ------------ 6、deactivate:  ---------------');
    super.deactivate();
  }


  //常用，组件被销毁时调用
  //通常在该处做一些资源的释放操作， 比如监听的销毁、channel 的销毁
  @override
  void dispose() {
    print(' ------------ 7、dispose:  ---------------');
    super.dispose();
  }

}
