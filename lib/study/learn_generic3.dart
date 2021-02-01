


class TestGeneric{
  void start(){
    Cache<String> cache1 = Cache();
    cache1.setItem('cache1', 'cache');
    String value = cache1.getItem('cache1');
    print(value);
  }

}

//泛型：
// 主要是解决类、接口、方法的复用性。以及对不特定数据类型的支持
// 作用：提高代码的复用性
class Cache<T>{
  static final Map<String, Object> _cache = Map();

  void setItem(String key , T value){
    _cache[key] = value;
  }

  T getItem(String key){
    return _cache[key];
  }
}