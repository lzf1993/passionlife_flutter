import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

///【实战尝鲜】拍照APP开发
/// 使用了 Image_picker 插件 ， 我们的项目需要兼容 androidx
class PhotoApp extends StatefulWidget {
  @override
  _PhotoAppState createState() => _PhotoAppState();
}


class _PhotoAppState extends State<PhotoApp> {
  List<File> _images = [];

  //获取照片
  Future getImage(bool isTakePhoto) async {
    Navigator.pop(context);
    //选择拍照，还是从照片选择
    var image = await ImagePicker.pickImage(source: isTakePhoto ? ImageSource.camera : ImageSource.gallery);
    if (image != null) {
      setState(() {
        //存储起来
        _images.add(image);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('【实战尝鲜】拍照APP开发'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Wrap(
          spacing: 5,
          runSpacing: 5,
          children: _genImages(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: '选择图片',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }


  //点击按钮，出现选择或者拍照
  _pickImage() {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: 160,
              child: Column(
                children: <Widget>[
                  _item('拍照', true),
                  _item('从相册选择', false),
                ],
              ),
            ));
  }


  //两个选项
  _item(String title, bool isTakePhoto) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(isTakePhoto ? Icons.camera_alt : Icons.photo_library),
        title: Text(title),
        onTap: () => getImage(isTakePhoto),
      ),
    );
  }


  //获取 Widget list
  _genImages() {
    //遍历 _images
    return _images.map((file) {
      return Stack(
        children: <Widget>[
          ClipRRect(
            //圆角效果
            borderRadius: BorderRadius.circular(5),
            //加载图片
            child: Image.file(file, width: 120, height: 90, fit: BoxFit.fill),
          ),
          //删除按钮-定位布局
          Positioned(
              right: 5,
              top: 5,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _images.remove(file);
                  });
                },
                child: ClipOval(
                  //圆角删除按钮
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(color: Colors.black54),
                    child: Icon(
                      Icons.close,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ))
        ],
      );
    }).toList();
  }
}
