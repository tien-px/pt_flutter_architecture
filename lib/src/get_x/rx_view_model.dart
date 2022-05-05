import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

abstract class RxViewModel<I, O> extends GetxController {
  late final I input;
  final bag = DisposeBag();

  O? transform(I input) {
    this.input = input;
  }

  @override
  void dispose() {
    Get.log('"${this.runtimeType.toString()}" disposed');
    bag.clear();
    super.dispose();
  }

  @override
  void onInit() {
    print("onInit");
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
