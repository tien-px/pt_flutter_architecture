import 'package:flutter/widgets.dart';
import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

@optionalTypeArgs
mixin DisposeBagMixin<T extends StatefulWidget> on State<T> {
  DisposeBag? _bag;

  @protected
  DisposeBag get bag {
    if (!mounted) {
      throw StateError('Invalid when getting bag after disposed.');
    }
    return _bag ??= DisposeBag();
  }

  @override
  void dispose() {
    _bag?.dispose();
    super.dispose();
  }
}
