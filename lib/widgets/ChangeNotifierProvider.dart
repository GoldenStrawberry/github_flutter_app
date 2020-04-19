import 'package:flutter/material.dart';

class InheritedProvider<T> extends InheritedWidget{
  final T data;

  InheritedProvider({@required this.data, Widget child}):super(child:child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class ChangeNotifier implements Listenable{
  @override
  void addListener(listener) {

  }

  @override
  void removeListener(listener) {
  }

  void notifyListener(){

  }
}

Type _typeOf<T>() => T;

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget{
  final Widget child;
  final T data;

  ChangeNotifierProvider({Key key,this.data,this.child});

  //定义一个方法，方便字数种的Widget获取共享数据
  static T of<T> (BuildContext context){
    final type = _typeOf<InheritedProvider<T>>();
    final provider = context.dependOnInheritedWidgetOfExactType() as InheritedProvider<T>;
    return provider.data;
  }

  @override
  State<StatefulWidget> createState() {
    return _ChangeNotifierProviderState();
  }
}

class _ChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<ChangeNotifierProvider<T>>{

  void update(){
    setState(() {});
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    if(widget.data != oldWidget.data){
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    widget.data.addListener(update);
    super.initState();
  }
  @override
  void dispose() {
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}

class ProfileChangeNotifier extends ChangeNotifier{
  @override
  void notifyListener() {
    super.notifyListener();
  }
}