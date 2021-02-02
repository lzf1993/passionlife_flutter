
//所有的 dart 类，所有的类都继承自 Object
class Person{

  String name;
  int age;

  //1、标准构造方法
  Person(this.name, this.age);

  //类的重载
  @override
  String toString() {
    return 'name:$name, age:$age';
  }
}


//子类
class Student extends Person{

  //_ 下划线开头属性，表示私有变量
  String _school;
  String name;
  String city;
  String county;

  //2、初始化列表
  //city 为可选参数
  //county 为默认参数
  // : 后面表示初始化列表
  Student(this._school, String name, int age, {this.city, this.county = 'china'})
      : name = '$county。$city',
       //如果父类没有无参构造方法，则需要在初始化列表中调用父类的的构造方法
        super(name, age){
     //构造方法体中做些事情
    print('父类构造方法被调用');
  }

  //3、命名构造方法
  Student.cover(Student stu):super(stu.name, stu.age){
    print('命名构造方法方法体');
  }

  //5、命名工厂构造方法   factory [类名 + . + 方法名]
  //   他可以有返回值，而且不需要将类的 final 变量作为参数，提供了一种灵活获取类对象的方式
  //  比如某个属性是 final 类型，则要求构造方法一定要初始化，但命名工厂构造方法可以不要实例化
  factory Student.stu(Student stu){
     return Student(stu._school, stu.name, stu.age);
  }

  //获取私有属性
  String getSchool()=> _school;


  static doPrint(String str){
    print('doPrint: $str');
  }
}


//抽象类
abstract class Study{
  void study();
}

//实现类
class LearnFlutter extends Study{
  @override
  void study() {
     print('flutter study ');
  }
}


class Logger{

  static Logger _cache;

  //4、工厂构造方法
  // 不仅仅是构造方法，更是一种模式，有时候为了返回一个已经创建的缓存对象，原始的构造方法已经不能满足需求，
  // 那么可以使用工厂模式里定义构造方法
  factory Logger(){
    if(_cache == null){
       _cache = Logger._internal();
    }
    return _cache;
  }

  //私有的命名构造方法
  Logger._internal();

}