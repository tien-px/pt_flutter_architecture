import 'package:flutter/widgets.dart';

mixin Bindable<T extends StatefulWidget> on State<T> {
  void bindViewModel() {

  }

  @override
  void initState() {
    super.initState();
    bindViewModel();
  }
}
