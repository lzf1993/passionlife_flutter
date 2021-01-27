
// dart 常用数据类型  stuf 快捷键

import 'package:flutter/material.dart';

class DataType extends StatefulWidget {
  @override
  _DataTypeState createState() => _DataTypeState();
}



class _DataTypeState extends State<DataType> {

  @override
  Widget build(BuildContext context) {

    _numType();
    _stringType();
    _boolType();
    _listType();
    _mapType();
    _tips();

    return Container(child: Text('常用数据类型，请查看控制台输出'),);
  }


  //1、数字类型
  void _numType() {
    //num 数字类型的父类
    num num1 = -1.20;
    num num2 = 1;
    int a = 3;
    double d = 1.68;
    print("num1: $num1  num2: $num2");
    print("a: $a  d: $d");
    //求绝对值
    print(num1.abs());
    //转换成 int 类型
    print(num1.toInt());
  }


  //2、字符串类型
  void _stringType() {
    String str1 = '字符串1', str2 = "字符串2" ;  //字符串的定义
    String str3 = 'str: $str1 str: $str2 ';
    String str4 = str1 + str2 + str3;
    print(str1);
    print(str3);
    print(str4);

    print(str3.substring(0,1));
    print(str3.length);
  }


  //3、bool 类型
  void _boolType() {
    bool success = true , fail = false;
    print(success || fail);
    print(success && fail);

  }


  //list 集合
  void _listType() {
    print("------------ list 初始化 -----------");
    List list = [1,2,3,4,5, '4'];
    print(list);

    //集合泛型，只能放指定类型
    List<int> list2 = [1,2,3,4,5];
    print(list2);

    List<int> list3 = [];
    //通过 add 方法进行初始化
    list3.add(1);
    //list2 = list;   -- 报错，动态数据类型 不是 指定数据类型的子类，所以赋值会报错

    List list4 = List.generate(10, (index) => index * 2);
    print(list4);

    //集合的遍历
    print("------------ list 遍历1 -----------");
    for(int i = 0 ; i<list4.length ; i++){
      print(list4[i]);
    }

    print("------------ list 遍历2 -----------");
    for(var o in list4){
      print(o);
    }

    print("------------ list 遍历3 -----------");
    list4.forEach((element) {
      print(element);
    });

  }


  //map 数据类型
  void _mapType() {

    //map 赋值
    Map names = {'xiaoming':'小明', 'xiaohong':'小红'};
    print(names);

    Map ages = {};
    //集合添加元素另外一种放
    ages['xiaoming'] = 16;
    ages['xiaohong'] = 18;

    print(ages);

    //map 遍历
    ages.forEach((key, value) {
      print('$key  $value ');
    });

    //遍历，返回一个新的元素
    Map map2 =  ages.map((key, value) => MapEntry(value ,key));
    print(map2);

    //遍历
    for(var key in ages.keys)
      print('$key ${ages[key]}');
  }


  /**
   *   dynamic
   *   var
   *   Object
   * */
  void _tips(){
    var a = 1;
//      a = 1.0f;   --- 报错

    dynamic b = 1.0;
    b = 1;    //不会报错，但会失去编译检查功能
    //b.test(); //不会报错

    Object s = 1;
    s = 1.0;

    //s.test(); //会报错

  }
}
