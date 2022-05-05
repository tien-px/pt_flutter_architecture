import 'package:rxdart/rxdart.dart';

extension TrackExtensions<T> on Stream<T> {
  Stream<T> trackActivity(BehaviorSubject<bool> aSubject) {
    return this.doOnListen(() {
      aSubject.add(true);
    }).doOnData((_) {
      aSubject.add(false);
    }).doOnError((e, s) {
      aSubject.add(false);
    }).doOnDone(() {
      aSubject.add(false);
    });
  }
}
