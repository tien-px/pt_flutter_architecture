import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

abstract class ViewModelType<I, O> {
  O? transform(I input, [DisposeBag? bag]) {}
}
