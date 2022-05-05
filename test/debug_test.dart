//ignore_for_file: close_sinks
import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';
import 'package:test/test.dart';

void main() {
  test('Debug full test', () async {
    var subject = "Tien".subject;
    subject.debug("D1", isUsingPrint: true).onErrorReturn("").subscribe();
    subject.addError(StateError("Error"));
    subject.close();
  });
  test('Debug when emit null', () async {
    Stream.value(null).debug("D2", isUsingPrint: true).subscribe();
  });
}