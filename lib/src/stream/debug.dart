import 'dart:developer' as developer;

import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

extension DebugExtensions<T> on Stream<T> {
  /// Prints received events for all observers on standard output.
  ///
  /// - [identifier] (optional) is the stream log message.
  /// - [source] (optional) is the name of the source of the log message.
  /// - [isUsingPrint] if using traditional logging. The default is `false`.
  Stream<T> debug(String? identifier,
      {String source = "RxDebug", bool isUsingPrint = false}) {
    var name = identifier ?? this.hashCode;

    void log(String value) => isUsingPrint
        ? print(value)
        : developer.log(value, name: source.toUpperCase());

    return this.doOnListen(() {
      log("[$name] listened");
    }).doOnData((data) {
      log("[$name] -> Event emit(${data != null ? data : ""})");
    }).doOnError((e, s) {
      log("[$name] -> Event error($e)");
    }).doOnDone(() {
      log("[$name] done");
    }).doOnCancel(() {
      log("[$name] disposed");
    });
  }
}
