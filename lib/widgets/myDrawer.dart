import 'package:flutter/material.dart';
import 'package:fluttergithubapp/models/user.dart';
import 'package:fluttergithubapp/common/imgaeUtil.dart';
import 'package:fluttergithubapp/common/progressViewUtil.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget{

  final User user;

  const MyDrawer({Key key,this.user}):super(key:key);

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 38),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ClipOval(
                        child: gmAvatar(
                          user.avatar_url,
                          width: 80,
                        ),
                      ),
                    ),
                    Text(
                      user.login,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.color_lens),
                        title: Text("换肤"),
                        onTap: (){
                          ProgressUtils.showNoContentDialog(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.language),
                        title: Text("语言"),
                        onTap: (){
                          ProgressUtils.showNoContentDialog(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.power_settings_new),
                        title: Text("注销"),
                        onTap: (){
                          ProgressUtils.showNoContentDialog(context);
                        },
                      ),
                    ],
                  ),
              ),
            ],
          ),
      ),
    );
  }

}