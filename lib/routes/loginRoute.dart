import 'package:flutter/material.dart';

class LoginRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoginRouteState();
  }

}

class _LoginRouteState extends State<LoginRoute>{

  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();

  void onLoginButtonClick(){
    showLoginDialog();
  }

  Future<bool> showLoginDialog(){
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          autovalidate: true,//开启自动校验
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _unameController,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  icon: Icon(Icons.person)
                ),
                validator: (v){
                  return v.trim().length > 0 ? null:"用户名不能为空";
                },
              ),
              TextFormField(
                controller: _pwdController,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "请输入密码",
                  icon: Icon(Icons.lock),
                ),
                validator: (v){
                  return v.trim().isNotEmpty ? null:"密码不能为空";
                },
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(height: 55),
                  child: RaisedButton(
                    onPressed: onLoginButtonClick,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: Text("登录"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}