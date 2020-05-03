import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttergithubapp/models/repository.dart';
import 'package:fluttergithubapp/models/user.dart';

class GitApi{

  BuildContext context;
  Options _options;

  GitApi([this.context]){
    _options = Options(extra: {"context":context});
  }

  static Dio dio = new Dio(BaseOptions(
    baseUrl: 'https://api.github.com',
    headers: {
      HttpHeaders.acceptHeader:"application/vnd.github.v3+json,"
    }
  ));

  //获取个人的公开资料
  Future<User> getUserPublicInfo(String userName) async{
    var result = await dio.get("/users/$userName");
    return User.fromJson(result.data);
  }

  //OAut认证
  Future<User> doOAuthAuthentication(String token) async{
    var result = await dio.get("/users",options: _options.merge(
      headers: {HttpHeaders.authorizationHeader:token},
        extra: {"noCache":true,}
    ));
    return User.fromJson(result.data);
  }

  //用户密码认证
  Future<User> doLogin(String userName,String pwd) async{
    String basic = 'Basic' + base64.encode(utf8.encode('$userName:$pwd'));
    var result = await dio.get("/users/$userName",options: _options.merge(
        headers: {HttpHeaders.authorizationHeader:basic},
        extra: {"noCache":true,}
    ));
    return User.fromJson(result.data);
  }
  //用户的藏库
  Future<List<Repo>> getRepos(String userName) async {
    var result = await dio.get("/users/$userName/repos", options: _options);
    List dataList = result.data;
    return dataList.map((e)=>Repo.fromJson(e)).toList();
  }
}