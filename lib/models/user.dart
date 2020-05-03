import 'package:fluttergithubapp/main.dart';

class User {
  final String login;
  final String email;
  final String bio;
  final String avatar_url;

  User(this.login,this.email,this.bio,this.avatar_url);

  //初始化列表：调用父类构造函数之前，可以在构造函数体执行之前初始化示例变量，用逗号分隔，该过程叫初始化列表。
  User.fromJson(Map<String,dynamic> json)
    : login = json['login'],
      email = json['email'],
      bio = json['bio'],
      avatar_url = json['avatar_url'];

  Map<String,dynamic> toJson() => <String,dynamic>{
    'name':login,
    'email':email,
    'bio':bio,
    'avatar_url':avatar_url,
  };
}