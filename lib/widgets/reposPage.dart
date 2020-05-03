import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:fluttergithubapp/models/repository.dart';
import 'package:fluttergithubapp/network/gitApi.dart';
import 'package:fluttergithubapp/common/progressViewUtil.dart';

class ReposPage extends StatefulWidget{
  final String username;
  ReposPage(this.username);

  @override
  State<StatefulWidget> createState() {
    return _ReposPageState(username);
  }
}

class _ReposPageState extends State<ReposPage>{
  var _repository = <Repo>[];
  final String username;

  _ReposPageState(this.username);

  @override
  void initState() {
    super.initState();
    _receiveData();
  }

  @override
  Widget build(BuildContext context) {

    Widget divider = Divider(color: Colors.grey,);
    return ListView.separated(
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            title: Text(_repository[index].name),
            subtitle: Text(_repository[index].description),
          );
        },
        separatorBuilder: (BuildContext context, int index){
          return divider;
        },
        itemCount: _repository.length,
    );
  }

  void _receiveData(){
    Future.delayed(Duration.zero, () {
      ProgressUtils.showLoadingDialog(context, "正在加载数据...");
      var data = GitApi(context).getRepos(username);
      data.then((e){
        Navigator.of(context).pop();
        _repository.insertAll(_repository.length, e.toList());
        setState(() {

        });
      });
    });
  }

}