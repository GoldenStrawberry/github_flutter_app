import 'package:flutter/material.dart';

class ProgressUtils{

  static void showLoadingDialog(BuildContext context,String message){
    showDialog(
      context: context,
      barrierDismissible: false,//点击遮罩不关闭对话框
      builder: (context){
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(message),
                ),
              ],
            ),
          );
      },
    );
  }

  static Future<bool> showNoContentDialog(BuildContext context){
    return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text("提示"),
          content: Text("内容正在开发，敬请期待"),
          actions: <Widget>[
            FlatButton(
              onPressed: ()=>Navigator.of(context).pop(),
              child: Text("确定"),
            ),
          ],
        );
      },
    );
  }
}