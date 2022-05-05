import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RxView<T extends GetxController> extends StatefulWidget {
  RxView({Key? key, required this.viewModel}) : super(key: key);

  final String? tag = null;

  final T viewModel;

  @override
  State<RxView<T>> createState() => _RxViewState<T>();

  Widget build(BuildContext context) => Container();

  void initState() {}

  void bindViewModel() {}

  void dispose() {}
}

class _RxViewState<T extends GetxController> extends State<RxView<T>> {
  @override
  void initState() {
    super.initState();
    widget.initState();
    widget.bindViewModel();
  }

  @override
  void dispose() {
    Get.log('"${widget.toString()}${widget.tag ?? ""}" disposed');
    super.dispose();
    widget.dispose();
    widget.viewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context);
  }
}
